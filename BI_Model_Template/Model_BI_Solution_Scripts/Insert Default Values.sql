/* Default for tb_TRGMDL_Transaction_Document_Types --------------------------------------------------- */
DELETE FROM tb_TRGMDL_Transaction_Document_Types WHERE Document_Type_Code = -1
INSERT INTO tb_TRGMDL_Transaction_Document_Types
SELECT * FROM VIEW_DEF_Transaction_Document_Types WITH (NOLOCK)

/* Default for tb_TRGMDL_Branches --------------------------------------------------------------------- */
DELETE FROM tb_TRGMDL_Branches WHERE Branch_Code = -1
INSERT INTO tb_TRGMDL_Branches
SELECT * FROM VIEW_DEF_Branches WITH (NOLOCK)

/* Default for tb_TRGMDL_Companies --------------------------------------------------------------------- */
DELETE FROM tb_TRGMDL_Companies WHERE Company_Code = -1
INSERT INTO tb_TRGMDL_Companies
SELECT * FROM VIEW_DEF_Companies WITH (NOLOCK)

/* Default for tb_TRGMDL_Customers --------------------------------------------------------------------- */
DELETE FROM tb_TRGMDL_Customers WHERE Customer_Code = -1
INSERT INTO tb_TRGMDL_Customers
SELECT * FROM VIEW_DEF_Customers WITH (NOLOCK)

/* Default for tb_TRGMDL_Products --------------------------------------------------------------------- */
DELETE FROM tb_TRGMDL_Products WHERE Product_Code = -1
INSERT INTO tb_TRGMDL_Products
SELECT * FROM VIEW_DEF_Products WITH (NOLOCK)

/* Default for tb_TRGMDL_Transaction_Types --------------------------------------------------------------------- */
DELETE FROM tb_TRGMDL_Transaction_Types WHERE Transaction_Type_ID = -1
INSERT INTO tb_TRGMDL_Transaction_Types
SELECT * FROM VIEW_DEF_Transaction_Types WITH (NOLOCK)