DROP TABLE tb_TRGMDL_Transactions
-- TRUNCATE TABLE tb_TRGMDL_Transactions
/*
	ο παρακάτω πίνακας κρατάει το αρχείο των κινήσεων. Αφορά Αγορές, Πωλήσεις, ενδοδιακινήσεις κλπ.
	In general when we refer to Orders we are refering to the Initial Document (Sales: Order from the Customer, Purchases: Order to the Supplier)
	Orders can be Invoiced through multiple Documents/Transactions and also Invoices can refer to more than one Order

	Οι πληροφορίες με πρόθεμα Transaction αναφέρονται στην εκάστοτε κίνηση,
	Οι πληροφορίες με πρόθεμα Order αναφέρονται στην αρχική κίνηση η οποία "γέννησε" την κίνηση της γραμμής που αναφερόμαστε. 
	Στην περίπτωση που η γραμμή είναι η αρχική κίνηση τότε τα πεδία αυτά έχουν ίδια πληροφορία με τα αντίστοιχα Transaction. Γενικά τα πεδία με πρόθεμα Order "parent-οποιούν" την πληροφορία
*/
CREATE TABLE tb_TRGMDL_Transactions
(
/*	PKEY and Critical Info Section --------------------------------------------------------------------------------------------------------------------------- */
	Transaction_PKEY BIGINT IDENTITY(1,1) NOT NULL,		-- PKEY of Transactional Table AUTOINCREMENT
	Transaction_Type_FKEY SMALLINT NOT NULL,			-- FKEY to tb_TRGMDL_Transaction_Types.Transaction_Type_ID. The Transaction Type FKEY of the Record (e.g. Sales, Wholesales, Purchases, Stock Movements etc.)
	Company_FKEY SMALLINT NOT NULL,						-- FKEY to tb_TRGMDL_Companies.Company_ID. The Company the Employee is Hired to
	Order_Flag SMALLINT NULL,							-- Flag to Distinguish Orders in Both Sales & Purchases
	Invoice_Flag SMALLINT NULL,							-- Flag to Distinguish Orders in Both Sales & Purchases

/*	Transaction Details Section ------------------------------------------------------------------------------------------------------------------------------ */
	Transaction_Document_Type_FKEY VARCHAR(50) NULL,	-- Document Type of the Transaction
	Order_Document_Type_FKEY VARCHAR(50) NULL,			-- Document Type of the Order 
	Transaction_Document_No VARCHAR(50) NULL,			-- Document number of the Transaction
	Order_Document_No VARCHAR(50) NULL,					-- Document number of the Order / Can also be the Initial Document Number which parents all Children

	Basket_Gross_Value INT NULL,						-- The Gross Value of the whole Order rounded in Zero decimals. Will be used to classify Orders
	Basket_Net_Value INT NULL,							-- The Net Value of the whole Order rounded in Zero decimals. Will be used to classify Orders
	Basket_Discount_Value INT NULL,						-- The Discount Value of the whole Order rounded in Zero decimals. Will be used to classify Orders

/*	Dates Section -------------------------------------------------------------------------------------------------------------------------------------------- */
	Record_Creation_Date INT NOT NULL,					-- The Date the Record was Created.
	Transaction_Date INT NOT NULL,						-- The Date the Transaction Refers to. Might be different from Record Creation Date
	Order_Date INT NULL,								-- The Transaction Order Date.
	Invoice_Date INT NULL,								-- The Transaction Invoice Date. If there are several we should put the Last (Max).
	Estimated_Pay_Date INT NULL,						-- The Transaction Estimated Date of Payment. If there are several we should put the Last (Max).
	Actual_Pay_Date INT NULL,							-- The Transaction Actual Date of Payment. If there are several we should put the Last (Max).
/*	End of Dates Section ------------------------------------------------------------------------------------------------------------------------------------- */

/*	Time Section --------------------------------------------------------------------------------------------------------------------------------------------- */
	Record_Creation_Time INT NULL,						-- The Time the Record was Created.
	Transaction_Time INT NULL,							-- The Time the Transaction Refers to. Might be different from Record Creation VARCHAR(8)
	Order_Time INT NULL,								-- The Transaction Order Time.
/*	End of Dates Section ------------------------------------------------------------------------------------------------------------------------------------- */

/*	Generic Section ------------------------------------------------------------------------------------------------------------------------------------------ */
	Transaction_Quantity NUMERIC(18,4) NULL,			-- 
	Transaction_Quantity_IN NUMERIC(18,4) NULL,			-- 
	Transaction_Quantity_OUT NUMERIC(18,4) NULL,		-- 
	Transaction_Gross_Value NUMERIC(18,4) NULL,			-- 
	Transaction_Net_Value NUMERIC(18,4) NULL,			-- 
	Transaction_Cost NUMERIC(18,4) NULL,				-- 
/*	End of Generic Section ----------------------------------------------------------------------------------------------------------------------------------- */

/*	Sales Section -------------------------------------------------------------------------------------------------------------------------------------------- */
	Sales_Quantity NUMERIC(18,4) NULL,					-- The Quantity Sold
	Sales_Gross_Value_Initial NUMERIC(18,4) NULL,		-- The Gross Value (including VAT, Interest and other expenses/fees) of Sales before any Discount. Usually the Ticket Price.
	Sales_Gross_Value_Final NUMERIC(18,4) NULL,			-- The Gross Value (including VAT, Interest and other expenses/fees) of Sales after Discounts. Usually is what Customer paid.
	Sales_Gross_Discount_Value NUMERIC(18,4) NULL,		-- The Gross Discount Value (including VAT, Interest and other expenses/fees) of Sales. Discount % = Sales_Gross_Discount_Value/Sales_Gross_Value_Initial
	Sales_Net_Value_Initial NUMERIC(18,4) NULL,			-- The Net Value (excluding VAT, Interest and other expenses/fees) of Sales before any Discount	
	Sales_Net_Value_Final NUMERIC(18,4) NULL,			-- The Net Value (excluding VAT, Interest and other expenses/fees) of Sales after Discounts
	Sales_Net_Discount_Value NUMERIC(18,4) NULL,		-- The Total Net Discount Value of Sales. Net Discount % = Sales_Net_Discount_Value/Sales_Net_Value_Initial
	Sales_Net_Discount_Value_1 NUMERIC(18,4) NULL,		-- The Net Discount Value 1 of Sales. In Case we need to break down discounts to more than one reason.
	Sales_Net_Discount_Value_2 NUMERIC(18,4) NULL,		-- The Net Discount Value 2 of Sales. In Case we need to break down discounts to more than one reason.
	Sales_Net_Discount_Value_3 NUMERIC(18,4) NULL,		-- The Net Discount Value 3 of Sales. In Case we need to break down discounts to more than one reason.
	Sales_Net_Discount_Value_4 NUMERIC(18,4) NULL,		-- The Net Discount Value 4 of Sales. In Case we need to break down discounts to more than one reason.
	Sales_Net_Discount_Value_5 NUMERIC(18,4) NULL,		-- The Net Discount Value 5 of Sales. In Case we need to break down discounts to more than one reason.
	Sales_Other_Income NUMERIC(18,4) NULL,				-- Might contain incomes from Interest Charged or other type NOT affected by the Item sold but by other factors such as Form of Payment, Customer Type etc.
	Sales_Cost NUMERIC(18,4) NULL,						-- Also Known as COGS (Cost of Goods Sold)
	Sales_Gross_Margin NUMERIC(18,4) NULL,				-- The Gross Margin
	Sales_Other_Profit NUMERIC(18,4) NULL,				-- Other Profits from Sales (e.g. Interest, Commision etc.)
	Sales_Total_Margin NUMERIC(18,4) NULL,				-- The Gross Margin + Other Profits
/*	End of Sales Section ------------------------------------------------------------------------------------------------------------------------------------- */

/*	Purchases Section ---------------------------------------------------------------------------------------------------------------------------------------- */
	Purchase_Quantity NUMERIC(18,4) NULL,				-- The Quantity Purchased
	Purchase_Net_Value_Initial NUMERIC(18,4) NULL,		-- The Net Value of Purchases before any Discount
	Purchase_Net_Value_Final NUMERIC(18,4) NULL,		-- The Net Value (excluding VAT, Interest and other expenses/fees) of Purchases after Discounts
	Purchase_Net_Discount_Value NUMERIC(18,4) NULL,		-- The Total Net Discount Value of Purchases. Net Discount % = Purchase_Net_Discount_Value/Purchase_Net_Value_Initial
	Purchase_Net_Discount_Value_1 NUMERIC(18,4) NULL,	-- The Net Discount Value 1 of Purchases. In Case we need to break down discounts to more than one reason. e.g. YEB, Other Aggreement etc.
	Purchase_Net_Discount_Value_2 NUMERIC(18,4) NULL,	-- The Net Discount Value 2 of Purchases. In Case we need to break down discounts to more than one reason. e.g. YEB, Other Aggreement etc.
	Purchase_Net_Discount_Value_3 NUMERIC(18,4) NULL,	-- The Net Discount Value 3 of Purchases. In Case we need to break down discounts to more than one reason. e.g. YEB, Other Aggreement etc.
	Purchase_Net_Discount_Value_4 NUMERIC(18,4) NULL,	-- The Net Discount Value 4 of Purchases. In Case we need to break down discounts to more than one reason. e.g. YEB, Other Aggreement etc.
	Purchase_Net_Discount_Value_5 NUMERIC(18,4) NULL,	-- The Net Discount Value 5 of Purchases. In Case we need to break down discounts to more than one reason. e.g. YEB, Other Aggreement etc.
/*	End of Purchases Section --------------------------------------------------------------------------------------------------------------------------------- */

/*	Cost Section --------------------------------------------------------------------------------------------------------------------------------------------- */

/*	End of Cost Section -------------------------------------------------------------------------------------------------------------------------------------- */

/*	Other FKEYs Section -------------------------------------------------------------------------------------------------------------------------------------- */
	Product_FKEY INT NULL,								-- FKEY to tb_TRGMDL_Items.Product_Code. The Item.

	Master_Product_FKEY INT NULL,						-- FKEY to tb_TRGMDL_Items.Product_Code. The Master Item.
	Parent_Product_FKEY INT NULL,						-- FKEY to tb_TRGMDL_Items.Product_Code. The Parent Item.
	Replacement_Product_FKEY INT NULL,					-- FKEY to tb_TRGMDL_Items.Product_Code. The Replacement Item.
	Bundle_Product_FKEY INT NULL,						-- FKEY to tb_TRGMDL_Items.Product_Code. The Bundle Item.

	Salesperson_FKEY INT NULL,							-- FKEY to tb_TRGMDL_HR_Employees.Employee_ID. The SalesPerson of the Sale. / -1 (none) --> for other Transaction Types)
	Cashier_FKEY INT NULL,								-- FKEY to tb_TRGMDL_HR_Employees.Employee_ID. The Cashier of the Sale.		/ -1 (none) --> for other Transaction Types).
	Customer_FKEY INT NULL,								-- FKEY to tb_TRGMDL_Customers.Customer_ID. The Customer.
	Parent_Customer_FKEY INT NULL,						-- FKEY to tb_TRGMDL_Customers.Customer_ID. The Parent Customer.
	Customer_GIS_FKEY BIGINT NULL,						-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Customer Location ID.
	Delivery_GIS_FKEY BIGINT NULL,						-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Delivery Location ID.
	Supplier_FKEY INT NULL,								-- FKEY to tb_TRGMDL_Suppliers.Supplier_ID. The Supplier.
	Supplier_GIS_FKEY BIGINT NULL,						-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Supplier Location ID.

	Transaction_Branch_FKEY INT NULL,					-- FKEY to tb_TRGMDL_Branches.Branch_ID. The Branch of Transaction.
	Order_Branch_FKEY INT NULL,							-- FKEY to tb_TRGMDL_Branches.Branch_ID. The Branch of the Order (if Transaction is Order then its the same with Transaction_Branch_FKEY).
	Invoice_Branch_FKEY INT NULL,						-- FKEY to tb_TRGMDL_Branches.Branch_ID. The Branch of the Invoice (if Transaction is Invoice then its the same with Transaction_Branch_FKEY).
	
	Transaction_Branch_GIS_FKEY BIGINT NULL,			-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Transaction Branch Location ID.
	Order_Branch_GIS_FKEY BIGINT NULL,					-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Order Branch Location ID.
	Invoice_Branch_GIS_FKEY BIGINT NULL,				-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Invoice Branch Location ID.

	Form_of_Payment_FKEY VARCHAR(100) NULL,				-- Form of Payment of Transaction (for Multiple we use "Mixed"
	Channel_FKEY VARCHAR(50) NULL,						-- Distribution Channel Type (Internet, B2B, B2C etc.) 
		
	Branch_OUT_FKEY INT NULL,							-- FKEY to tb_TRGMDL_Branches.Branch_ID. The Branch the Stock was moved OUT From (also Sales Delivery Branch)
	Branch_IN_FKEY INT NULL,							-- FKEY to tb_TRGMDL_Branches.Branch_ID. The Branch the Stock was moved IN To (also Purchase Delivery Branch)
	Branch_OUT_GIS_FKEY BIGINT NULL,					-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Branch OUT Location ID.
	Branch_IN_GIS_FKEY BIGINT NULL,						-- FKEY to tb_TRGMDL_Geographical_Info.PKEY. The Branch IN Location ID.
/*	End of Other FKEYs Section ------------------------------------------------------------------------------------------------------------------------------- */

/*	Other Form of Payment Related Fields --------------------------------------------------------------------------------------------------------------------- */
	Cash_PCT NUMERIC(18,4) NULL,
	DebitCard_PCT NUMERIC(18,4) NULL,
	CreditCard_PCT NUMERIC(18,4) NULL,
	BankLoan_PCT NUMERIC(18,4) NULL,
	PaymentDelay_1m_PCT NUMERIC(18,4) NULL,
	PaymentDelay_2m_PCT NUMERIC(18,4) NULL,
	PaymentDelay_3m_PCT NUMERIC(18,4) NULL,
	PaymentDelay_6m_PCT NUMERIC(18,4) NULL,
	PaymentDelay_9m_PCT NUMERIC(18,4) NULL,
/*	End of Other Form of Payment Related Fields -------------------------------------------------------------------------------------------------------------- */

 CONSTRAINT PK_tb_TRGMDL_Transactions PRIMARY KEY CLUSTERED 
(
	Transaction_PKEY ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]