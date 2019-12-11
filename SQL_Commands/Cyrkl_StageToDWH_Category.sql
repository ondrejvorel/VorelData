BEGIN TRANSACTION;

SELECT *
INTO #tmp_Category
FROM (
SELECT * FROM [myDB].[cyrkl].[1Stage_Category]
UNION
SELECT 999,0,'All','All Categories',0,'all','all','1900-01-01'
) tmp;

MERGE [myDB].[cyrkl].[Category] AS C
USING #tmp_Category AS S
ON [C].[ID] = [S].[id]

WHEN MATCHED AND (	
ISNULL([C].[Name],'') != ISNULL([S].[name0],'') OR 
ISNULL([C].[Description],'') != ISNULL([S].[description0],'') OR 
ISNULL([C].[Priority],'') != ISNULL([S].[priority],'') OR 
ISNULL([C].[URI],'') != ISNULL([S].[uri0],'') OR 
ISNULL([C].[SystemName],'') != ISNULL([S].[system_name],'') OR 
ISNULL([C].[LastModified],'') != ISNULL([S].[last_modified],''))

THEN UPDATE SET 
[C].[Name] = [S].[name0], 
[C].[Description] = [S].[description0], 
[C].[Priority] = [S].[priority],
[C].[URI] = [S].[uri0],
[C].[SystemName] = [S].[system_name],
[C].[LastModified] = [S].[last_modified]

WHEN NOT MATCHED THEN
INSERT ([ID], [Name], [Description], [Priority], [URI], [SystemName], [LastModified])
VALUES ([S].[id], [S].[name0], [S].[description0], [S].[priority], [S].[uri0], [S].[system_name], [S].[last_modified]);

COMMIT;