DECLARE @Table_Name VARCHAR(100)
DECLARE @Column_Name VARCHAR(100)
DECLARE @Comment VARCHAR(MAX)
SET @Table_Name = 'tb_TRGMDL_HR_Employees'

-- DROP TABLE tb_TRGMDL_HR_Employees
/*
	ο παρακάτω πίνακας κρατάει το αρχείο των εγαζομένων.
*/
CREATE TABLE tb_TRGMDL_HR_Employees
(
	Employee_ID VARCHAR(20) NOT NULL,			-- Should be Changed if desired to the appropriate DB Datatype
	Company_ID_FKEY TINYINT NOT NULL,			-- FKEY to tb_TRGMDL_Companies.Company_ID. The Company the Employee is Hired to
	Employee_FullName VARCHAR(100) NULL,		-- The Full Name of the Employee
	Employee_FirstName VARCHAR(100) NULL,		-- The First Name of the Employee
	Employee_LastName VARCHAR(100) NULL,		-- The Last Name of the Employee
	Employee_MaidenName VARCHAR(100) NULL,		-- The Maiden Name of the Employee (Πατρικό όνομα, για Γυναίκες συνήθως)
	Employee_ID_Number VARCHAR(20) NULL,		-- The ID Number of the Employee (Αριθμός Ταυτότητας)
	Employee_TAX_Number VARCHAR(20) NULL,		-- The TAX Number of the Employee (ΑΦΜ)
	Employee_TAX_Department VARCHAR(100) NULL,	-- The TAX Department of the Employee (ΔΟΥ)

	Employee_Home_Address VARCHAR(100) NULL,	-- The Home Address of the Employee
	Employee_Home_PostCode VARCHAR(10) NULL,	-- The Home PostCode of the Employee
	Employee_Home_PhoneNumber INT NULL,			-- The Home PhoneNumber of the Employee
	Employee_Mobile_PhoneNumber INT NULL,		-- The Mobile PhoneNumber of the Employee
	Employee_email_Address VARCHAR(100) NULL,	-- The email of the Employee

	Employee_WorkHourClass VARCHAR(10) NULL,	-- The WorkHourClass of the Employee (8Hours, 4Hours, 6Hours, PartTime, Special etc.)
	Employee_HireDate DATE NULL,				-- The Date the Employee was Hired
	Employee_LeaveDate DATE NULL,				-- The Date the Employee Left the Company
	Employee_LeaveReason VARCHAR(100) NULL,		-- The Reason the Employee Left the Company (e.g. Fired, OwnDecision, Internal Movement etc.)

	Employee_Department_ID_FKEY INT NULL,		-- FKEY to tb_TRGMDL_HR_Departments.Department_ID. The Department ID of the Employee (should be the lowest level ID of the Companys Organization Chart)
	Employee_Department_CC INT NULL,			-- The Cost Center of the Employee
	Employee_Branch_ID INT NULL,				-- The Branch ID the Employee currently works in (Headquarters, Warehouse, StoreA, StoreB etc.)
	Employee_Grade VARCHAR(10) NULL,			-- The Grade of the Employee within the Company
	Employee_GrossSalary NUMERIC(10,2) NULL,	-- The Gross Salary of the Employee 
	Employee_NetSalary NUMERIC(10,2) NULL,		-- The Net Salary of the Employee 



 CONSTRAINT PK_tb_TRGMDL_HR_Employees PRIMARY KEY CLUSTERED 
(
	Employee_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]