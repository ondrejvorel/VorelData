BEGIN TRANSACTION;

/************************************************************ STEP 1 ************************************************************/
-- Create temp table as we could order by values before we merge them
CREATE TABLE #tmp_MailingListInt (
[ID] [int] NULL,
[Email] [nvarchar](100) NULL,
[Type] [nvarchar](50) NULL,
[CategoryID] [int] NULL,
[ValidFrom] [datetime2](3) NULL,
[ValidTo] [datetime2](3) NULL,
[Active] [bit] NULL,
[RowNumber] [int]);

-- CTE query which automaticaly distributes multi-categories within separated rows
WITH CTE AS (
SELECT 
	[ML].[id] AS [ID],
	[ML].[email] AS [Email],
	[ML].[Type],
	[CR].[ID] AS [CategoryID],
	[ML].[date_registered] AS [ValidFrom],
	NULL AS [ValidTo],
	1 AS [Active],
	ROW_NUMBER () OVER (PARTITION BY [ML].[email],[ML].[Type],[CR].[ID] ORDER BY [ML].[date_registered] DESC) AS [RowNumber]
FROM [myDB].[cyrkl].[1Stage_MailingListInt] AS [ML]
CROSS APPLY STRING_SPLIT([additional_info], ',') AS [SPL]
LEFT JOIN [myDB].[cyrkl].[Category] AS [CR]
ON [SPL].[value] = [CR].[SystemName]
WHERE [SPL].[value] != '' AND [SPL].[value] IS NOT NULL)

-- Exclude duplicated rows
INSERT INTO #tmp_MailingListInt
SELECT * 
FROM CTE
WHERE RowNumber = 1
ORDER BY [ID] ASC;

/************************************************************ STEP 2 ************************************************************/
-- Merge Stage (tmp table) values with the main table
MERGE [myDB].[cyrkl].[MailingListInt] AS T
USING #tmp_MailingListInt AS S
ON [T].[Email] = [S].[Email] AND [T].[Type] = [S].[Type] AND [T].[CategoryID] = [S].[CategoryID]

WHEN MATCHED AND (	
ISNULL([T].[CyrklID],'') != ISNULL([S].[ID],'') OR 
ISNULL([T].[ValidFrom],'') != ISNULL([S].[ValidFrom],''))

THEN UPDATE SET 
[T].[CyrklID] = [S].[ID], 
[T].[ValidFrom] = [S].[ValidFrom], 
[T].[ValidTo] = NULL,
[T].[Active] = 1

WHEN NOT MATCHED THEN
INSERT ([CyrklID], [Email], [Type], [CategoryID], [ValidFrom], [ValidTo], [Active])
VALUES ([S].[ID], [S].[Email], [S].[Type], [S].[CategoryID], [S].[ValidFrom], NULL, 1);

/************************************************************ STEP 3 ************************************************************/
-- Emails which were not loaded to stage set as not Active with correspond ValidTo data
UPDATE T 
SET [T].[ValidTo] = GETDATE(), [T].[Active] = 0
FROM [myDB].[cyrkl].[MailingListInt] AS T
LEFT JOIN #tmp_MailingListInt AS S
ON [T].[Email] = [S].[Email] AND [T].[Type] = [S].[Type] AND [T].[CategoryID] = [S].[CategoryID]
WHERE [S].[Email] IS NULL
AND [T].[Active] = 1;

COMMIT;


