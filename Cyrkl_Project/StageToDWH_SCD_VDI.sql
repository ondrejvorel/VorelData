/************************************************** DELETE DUPLICATES FROM DAILY TABLE LOAD **************************************************/
WITH CTE AS (
SELECT *, ROW_NUMBER () OVER (PARTITION BY UserID ORDER BY VDI_Tier) AS RowNumber
FROM #DailyLoadFINAL)
DELETE CTE
WHERE RowNumber > 1;

/************************************************** MERGE DAILY LOAD TABLE WITH METERING TABLE **************************************************/
/** 8. Step - INSERT all MATCHED (updated) records where historized attributes were changed **/
INSERT INTO [Metering].[dbo].[VDIMetering]
SELECT	   
	   [UserID]
      ,[EmailID]
      ,[UserPrincipalName]
      ,[LastLoginCTX]
      ,[VDI_Tier]
      ,[VDI_AnywhereAccess]
      ,[ValidFrom] = GETDATE()
      ,[ValidTo] = NULL
      ,[LastActiveAccount] = NULL
      ,[Active] = NULL
FROM (

/** 1. Step - MERGE Daily Load table with Metering one  **/	
			MERGE Metering.dbo.VDIMetering AS VDIM
			USING #DailyLoadFINAL AS VDI
			ON ([VDIM].[UserID] = [VDI].[UserID])

/** 2. Step - Define all COMPARING fields, if they are MATCHED. Except all the vailidity flags (ValidFrom, ValidTo, LastActiveAccount, Active) **/	
			WHEN MATCHED AND 
				((	ISNULL([VDIM].[UserID],'') != ISNULL([VDI].[UserID],'') OR ISNULL([VDIM].[EmailID],'') != ISNULL([VDI].[EmailID],'') OR ISNULL([VDIM].[UserPrincipalName],'') != ISNULL([VDI].[UserPrincipalName],'') OR 
					ISNULL([VDIM].[LastLoginCTX],'') != ISNULL([VDI].[LastLoginCTX],'') OR ISNULL([VDIM].[VDI_Tier],'') != ISNULL([VDI].[VDI_Tier],'') OR ISNULL([VDIM].[VDI_AnywhereAccess],'') != ISNULL([VDI].[VDI_AnywhereAccess],''))
					
					-- We want to update only currently valid records and that's why [ValidTo] needs to be NULL --
					AND [ValidTo] IS NULL)
			THEN

/** 3. Step - UPDATE all MATCHED records which contains any difference between Daily Load table and Metering table **/	
				UPDATE SET 
					[VDIM].[UserID] = [VDI].[UserID], [VDIM].[EmailID] = [VDI].[EmailID], [VDIM].[UserPrincipalName] = [VDI].[UserPrincipalName],
					[VDIM].[LastLoginCTX] = [VDI].[LastLoginCTX],

					-- If should be updated one of historized attrributes we need to keep original record as the new record will be inseted in up comming steps 
					[VDI_Tier] = CASE WHEN [VDIM].[VDI_Tier] != [VDI].[VDI_Tier] THEN [VDIM].[VDI_Tier] ELSE [VDI].[VDI_Tier] END,
					[VDI_AnywhereAccess] = CASE WHEN ISNULL([VDIM].[VDI_AnywhereAccess],'') != ISNULL([VDI].[VDI_AnywhereAccess],'') THEN [VDIM].[VDI_AnywhereAccess] ELSE [VDI].[VDI_AnywhereAccess] END,
					
					-- If should be updated one of historized attrributes we need to end the validity of this particular record
					[ValidTo] = CASE WHEN [VDIM].[VDI_Tier] != [VDI].[VDI_Tier] OR ISNULL([VDIM].[VDI_AnywhereAccess],'') != ISNULL([VDI].[VDI_AnywhereAccess],'') THEN GETDATE() ELSE NULL END,
					[LastActiveAccount] = CASE WHEN [VDIM].[VDI_Tier] != [VDI].[VDI_Tier] OR ISNULL([VDIM].[VDI_AnywhereAccess],'') != ISNULL([VDI].[VDI_AnywhereAccess],'') THEN GETDATE() ELSE NULL END,
					[Active] = CASE WHEN [VDIM].[VDI_Tier] != [VDI].[VDI_Tier] OR ISNULL([VDIM].[VDI_AnywhereAccess],'') != ISNULL([VDI].[VDI_AnywhereAccess],'') THEN 'N' ELSE NULL END

/** 4. Step - Define all fields that should be inserted if they are NOT MATCHED **/
			WHEN NOT MATCHED
			THEN
				INSERT ( 
					[UserID], [EmailID], [UserPrincipalName], [LastLoginCTX], [VDI_Tier], [VDI_AnywhereAccess], [ValidFrom], [ValidTo])

/** 5. Step - INSERT all NOT MATCHED records. Except LastActiveAccount, Active fields as they are updated in up comming steps **/
				VALUES (
					[VDI].[UserID], [VDI].[EmailID], [VDI].[UserPrincipalName], [VDI].[LastLoginCTX], [VDI].[VDI_Tier], [VDI].[VDI_AnywhereAccess],
					GETDATE(), NULL)

/** 6. Step - Define OUTPUT fields which should be used in further INSERT **/
		OUTPUT $action,
		[VDI].[UserID], [VDI].[EmailID], [VDI].[UserPrincipalName], [VDI].[LastLoginCTX], [VDI].[VDI_Tier], [VDI].[VDI_AnywhereAccess],
		
		-- Check if historized attributes were changed -> Validity of the record has been ended 
		CASE WHEN [VDI].[VDI_Tier] != deleted.[VDI_Tier] OR ISNULL([VDI].[VDI_AnywhereAccess],'') != ISNULL(deleted.[VDI_AnywhereAccess],'') THEN 1 ELSE 0 END
		) AS SCD
	
	-- 	Define columns for OUTPUT
	([action], [UserID], [EmailID], [UserPrincipalName], [LastLoginCTX], [VDI_Tier], [VDI_AnywhereAccess],  
	[UpdateFlag])

/** 7. Step - SELECT all MATCHED (updated) records where historized attributes were changed **/
WHERE SCD.[action] = 'UPDATE'
AND SCD.UpdateFlag = 1;


/************************************************** UPDATE METERING TABLE WITH THE LAST ACTIVITY **************************************************/
/** UPDATE [LastActiveAccount] for all VALID Metering records which are mapped with Daily Load table **/	    
	UPDATE VDIM 
	SET [LastActiveAccount] = GETDATE()
		FROM [VDIMetering] AS VDIM
		LEFT JOIN #DailyLoadFINAL AS VDI
		ON [VDIM].[UserID] = [VDI].[UserID]
	WHERE [VDI].[UserID] IS NOT NULL
	AND [VDIM].ValidTo IS NULL;

/** UPDATE [Active] to "Y" for all VALID records and [LastActiveAccount] not older than one month **/	  
	UPDATE VDIM 
	SET [Active] = CASE WHEN [LastActiveAccount] > DATEADD(MONTH,-1,GETDATE()) THEN 'Y' ELSE 'N' END
	FROM [VDIMetering] AS VDIM
	WHERE [ValidTo] IS NULL;


/************************************************** REBUILD INDEXES FOR METERING TABLE **************************************************/
/** CREATE Primary Key over the unique records (ID, ValidFrom) **/
--ALTER TABLE [dbo].[VDIMetering]
--ALTER COLUMN [UserID] DATE NOT NULL

--ALTER TABLE [dbo].[VDIMetering]
--ALTER COLUMN [ValidFrom] DATE NOT NULL

--ALTER TABLE [dbo].[VDIMetering]
--ADD CONSTRAINT PK_UserID PRIMARY KEY ([UserID],[ValidFrom])

/** REBUILD created Primary Key **/
ALTER INDEX PK_UserID ON [dbo].[VDIMetering] REBUILD;
