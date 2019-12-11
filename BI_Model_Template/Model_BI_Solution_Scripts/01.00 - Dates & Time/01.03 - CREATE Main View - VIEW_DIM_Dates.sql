USE Targit_Model
GO

ALTER VIEW VIEW_DIM_Dates AS
SELECT  
	T.*, 
	ISNULL(H.Holiday_Name,'Not Holiday') AS Holiday_Name, 
	ISNULL(H.Holiday_Name_2,'Not Holiday') AS Holiday_Name_2, 
	ISNULL(H.Holiday_Group,'Not Holiday') AS Holiday_Group, 
	ISNULL(H.Holiday_Group_2,'Not Holiday') AS Holiday_Group_2, 
	ISNULL(H.Holiday_Flag_RetailHQ,0) AS Holiday_Flag_RetailHQ, 
	ISNULL(H.Holiday_Flag_RetailStores,0) AS Holiday_Flag_RetailStores,
	ISNULL(H.Holiday_Flag_ShippingHQ,0) AS Holiday_Flag_ShippingHQ,
	ISNULL(H.Holiday_Flag_ShippingShips,0) AS Holiday_Flag_ShippingShips
FROM 
	tb_TRGMDL_Dates T WITH (NOLOCK) 
	LEFT OUTER JOIN tb_TRGMDL_Dates_Holidays H WITH (NOLOCK) ON T.PKEY = H.PKEY

GO


