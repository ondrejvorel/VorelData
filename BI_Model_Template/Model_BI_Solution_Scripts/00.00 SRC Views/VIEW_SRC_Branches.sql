ALTER VIEW VIEW_SRC_Branches AS
SELECT  
	SourceFieldName AS Branch_Code,
	ISNULL(SourceFieldName, -1) AS Branch_Company_ID,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Name,
	ISNULL(SourceFieldName, -1) AS Branch_Parent_Code,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Type,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Classification,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Address,
	ISNULL(SourceFieldName, 'N/A') AS Branch_City,
	ISNULL(SourceFieldName, 'N/A') AS Branch_District,
	ISNULL(SourceFieldName, 1) AS Branch_GIS_FKEY,
	ISNULL(SourceFieldName, '00000') AS Branch_Post_Code,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Phone_1,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Phone_2,
	ISNULL(SourceFieldName, 'N/A') AS Branch_email,
	ISNULL(SourceFieldName, 1) AS Is_Active_Flag,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Value_1,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Description_1,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Value_2,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Description_2,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Value_3,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Description_3,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Value_4,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Description_4,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Value_5,
	ISNULL(SourceFieldName, 'N/A') AS Classified_Description_5
FROM
	tb_Dummy_SRC WITH (NOLOCK)