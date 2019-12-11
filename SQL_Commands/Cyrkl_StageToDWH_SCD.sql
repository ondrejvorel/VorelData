/************************************************** DELETE DUPLICATES FROM DAILY TABLE LOAD **************************************************/
WITH CTE AS (
SELECT *, ROW_NUMBER () OVER (PARTITION BY UserID ORDER BY Tier) AS RowNumber
FROM #DailyLoad)
DELETE CTE
WHERE RowNumber > 1;

/************************************************** MERGE DAILY LOAD TABLE WITH METERING TABLE **************************************************/
/** 8. Step - INSERT all MATCHED (updated) records where historized attributes were changed **/
INSERT INTO [dbo].[CyrklFinal]
SELECT	   
	   [UserID]
      ,[EmailID]
      ,[UserPrincipalName]
      ,[LastLogin]
      ,[Tier]
      ,[AnywhereAccess]
      ,[ValidFrom] = GETDATE()
      ,[ValidTo] = NULL
      ,[LastActiveAccount] = NULL
      ,[Active] = NULL
FROM (

/** 1. Step - MERGE Daily Load table with Metering one  **/	
			MERGE Metering.dbo.CyrklFinal AS CF
			USING #DailyLoad AS DL
			ON ([CF].[UserID] = [DL].[UserID])

/** 2. Step - Define all COMPARING fields, if they are MATCHED. Except all the vailidity flags (ValidFrom, ValidTo, LastActiveAccount, Active) **/	
			WHEN MATCHED AND 
				((	ISNULL([CF].[UserID],'') != ISNULL([DL].[UserID],'') OR ISNULL([CF].[EmailID],'') != ISNULL([DL].[EmailID],'') OR ISNULL([CF].[UserPrincipalName],'') != ISNULL([DL].[UserPrincipalName],'') OR 
					ISNULL([CF].[LastLogin],'') != ISNULL([DL].[LastLogin],'') OR ISNULL([CF].[Tier],'') != ISNULL([DL].[Tier],'') OR ISNULL([CF].[AnywhereAccess],'') != ISNULL([DL].[AnywhereAccess],''))
					
					-- We want to update only currently valid records and that's why [ValidTo] needs to be NULL --
					AND [ValidTo] IS NULL)
			THEN

/** 3. Step - UPDATE all MATCHED records which contains any difference between Daily Load table and Metering table **/	
				UPDATE SET 
					[CF].[UserID] = [DL].[UserID], [CF].[EmailID] = [DL].[EmailID], [CF].[UserPrincipalName] = [DL].[UserPrincipalName],
					[CF].[LastLogin] = [DL].[LastLogin],

					-- If should be updated one of historized attrributes we need to keep original record as the new record will be inseted in up comming steps 
					[Tier] = CASE WHEN [CF].[Tier] != [DL].[Tier] THEN [CF].[Tier] ELSE [DL].[Tier] END,
					[AnywhereAccess] = CASE WHEN ISNULL([CF].[AnywhereAccess],'') != ISNULL([DL].[AnywhereAccess],'') THEN [CF].[AnywhereAccess] ELSE [DL].[AnywhereAccess] END,
					
					-- If should be updated one of historized attrributes we need to end the validity of this particular record
					[ValidTo] = CASE WHEN [CF].[Tier] != [DL].[Tier] OR ISNULL([CF].[AnywhereAccess],'') != ISNULL([DL].[AnywhereAccess],'') THEN GETDATE() ELSE NULL END,
					[LastActiveAccount] = CASE WHEN [CF].[Tier] != [DL].[Tier] OR ISNULL([CF].[AnywhereAccess],'') != ISNULL([DL].[AnywhereAccess],'') THEN GETDATE() ELSE NULL END,
					[Active] = CASE WHEN [CF].[Tier] != [DL].[Tier] OR ISNULL([CF].[AnywhereAccess],'') != ISNULL([DL].[AnywhereAccess],'') THEN 'N' ELSE NULL END

/** 4. Step - Define all fields that should be inserted if they are NOT MATCHED **/
			WHEN NOT MATCHED
			THEN
				INSERT ( 
					[UserID], [EmailID], [UserPrincipalName], [LastLogin], [Tier], [AnywhereAccess], [ValidFrom], [ValidTo])

/** 5. Step - INSERT all NOT MATCHED records. Except LastActiveAccount, Active fields as they are updated in up comming steps **/
				VALUES (
					[DL].[UserID], [DL].[EmailID], [DL].[UserPrincipalName], [DL].[LastLogin], [DL].[Tier], [DL].[AnywhereAccess],
					GETDATE(), NULL)

/** 6. Step - Define OUTPUT fields which should be used in further INSERT **/
		OUTPUT $action,
		[DL].[UserID], [DL].[EmailID], [DL].[UserPrincipalName], [DL].[LastLogin], [DL].[Tier], [DL].[AnywhereAccess],
		
		-- Check if historized attributes were changed -> Validity of the record has been ended 
		CASE WHEN [DL].[Tier] != deleted.[Tier] OR ISNULL([DL].[AnywhereAccess],'') != ISNULL(deleted.[AnywhereAccess],'') THEN 1 ELSE 0 END
		) AS SCD
	
	-- 	Define columns for OUTPUT
	([action], [UserID], [EmailID], [UserPrincipalName], [LastLogin], [Tier], [AnywhereAccess],  
	[UpdateFlag])

/** 7. Step - SELECT all MATCHED (updated) records where historized attributes were changed **/
WHERE SCD.[action] = 'UPDATE'
AND SCD.UpdateFlag = 1;


/************************************************** UPDATE TABLE WITH THE LAST ACTIVITY **************************************************/
/** UPDATE [LastActiveAccount] for all VALID records which are mapped with Daily Load table **/	    
	UPDATE CF 
	SET [LastActiveAccount] = GETDATE()
		FROM [CyrklFinal] AS CF
		LEFT JOIN #DailyLoad AS DL
		ON [CF].[UserID] = [DL].[UserID]
	WHERE [DL].[UserID] IS NOT NULL
	AND [CF].ValidTo IS NULL;

/** UPDATE [Active] to "Y" for all VALID records and [LastActiveAccount] not older than one month **/	  
	UPDATE CF 
	SET [Active] = CASE WHEN [LastActiveAccount] > DATEADD(MONTH,-1,GETDATE()) THEN 'Y' ELSE 'N' END
	FROM [CyrklFinal] AS CF
	WHERE [ValidTo] IS NULL;


/************************************************** REBUILD INDEXES FOR TABLE **************************************************/
/** CREATE Primary Key over the unique records (ID, ValidFrom) **/
ALTER TABLE [dbo].[CyrklFinal]
ALTER COLUMN [UserID] DATE NOT NULL

ALTER TABLE [dbo].[CyrklFinal]
ALTER COLUMN [ValidFrom] DATE NOT NULL

ALTER TABLE [dbo].[CyrklFinal]
ADD CONSTRAINT PK_UserID PRIMARY KEY ([UserID],[ValidFrom])

/** REBUILD created Primary Key **/
ALTER INDEX PK_UserID ON [dbo].[CyrklFinal] REBUILD;
