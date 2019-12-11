DECLARE @Table_Name VARCHAR(100)
DECLARE @Column_Name VARCHAR(100)
DECLARE @Comment VARCHAR(MAX)
SET @Table_Name = 'tb_TRGMDL_HR_Employee_Calendar'

-- DROP TABLE tb_TRGMDL_HR_Employee_Calendar
/*
	ο παρακάτω πίνακας κρατάει το ημερολόγιο των εργαζομένων με πληροφορίες όπως ωράριο, άδειες, εκπαίδευση κλπ.
*/
CREATE TABLE tb_TRGMDL_HR_Employee_Calendar
(
	PK_Date DATE NOT NULL,
	Employee_ID_FKEY VARCHAR(20) NOT NULL,		-- FKEY to tb_TRGMDL_HR_Employees.Employee_ID. Should be Changed to the tb_TRGMDLHR_Employees.Employee_ID Datatype !!!
	Company_ID_FKEY TINYINT NOT NULL,			-- FKEY to tb_TRGMDL_Companies.Company_ID. The Company the Employee is Hired to

	Day_WorkingDayType_ID_FKEY TINYINT NULL,	-- FKEY to tb_TRGMDL_HR_WorkingDayTypes.Day_WorkingDayType_ID (Working Day, Vacation, Holiday, etc.)

	Eligible_Working_Day_Flag TINYINT NULL,		-- Indicates whether the Employee is Supposed to Work (Holidays, Vacations, etc are Marked as Zero)
	Eligible_Working_Hours NUMERIC(10,2) NULL,	-- Working Hours According to Employees Contract
	Eligible_WorkHour_From VARCHAR(5) NULL,		-- hh:mm of Employees Work Start on this Date according to Contract
	Eligible_WorkHour_To VARCHAR(5) NULL,		-- hh:mm of Employees Work End on this Date according to Contract
	Actual_Working_Day_Flag TINYINT NULL,		-- Indicates whether the Employee had Worked on this Date
	Actual_Working_Hours NUMERIC(10,2) NULL,	-- Actual Hours that the Employee had Worked on this Date
	Actual_WorkHour_From VARCHAR(5) NULL,		-- hh:mm of Employees Actual Work Start on this Date
	Actual_WorkHour_To VARCHAR(5) NULL,			-- hh:mm of Employees Actual Work End on this Date 

	Actual_Vacation_Day_Flag TINYINT NULL,		-- Indicates whether the Employee had an Actual Vacation Day on this Date
	Vacation_Type_ID_FKEY VARCHAR(100) NULL,	-- FKEY to tb_TRGMDL_HR_Vacation_Types.Vacation_Type_ID. The Type of Vacation (e.g. Regular, Sickness, Educational, Other etc.). Refers ONLY to Actual Vacation Days.
	Planned_Vacation_Day_Flag TINYINT NULL,		-- Indicates whether the Employee had a Planned Vacation Day on this Date
	Available_Vacation_Days_Total TINYINT NULL,	-- The Total Vacation Days the Employee has Available on this Date
	Available_Vacation_Days_CY TINYINT NULL,	-- The Total Vacation Days the Employee has Available from Current Year on this Date
	Available_Vacation_Days_PY TINYINT NULL,	-- The Total Vacation Days the Employee has Available from Previous Years on this Date

	Education_Day_Flag TINYINT NULL,			-- Indicates whether the Employee was on an Education Programm that Day (Seminar etc.)
	Education_Reference_ID INT NULL,			-- Reference ID for the Education Record (Seminar_ID etc.)
	Presense_Day_Flag TINYINT NULL,				-- Indicates whether the Employee was Working on this Date (regardless of the Date being a working day - e.g. Holiday)
	Absense_Day_Flag TINYINT NULL,				-- Indicates whether the Employee was Absent on this Date 
	Unjustified_Absense_Day_Flag TINYINT NULL,	-- Indicates whether the Employee was Absent on this Date where he was supposed to Work, Working_Day_Flag = 1	





 CONSTRAINT PK_tb_TRGMDL_HR_Employee_Calendar PRIMARY KEY CLUSTERED 
(
	PK_Date ASC,
	Employee_ID_FKEY ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/* Start of Column Descriptions ------------------------------------------------------------------------------------------------------ */
SET @Column_Name = 'PK_Date'
SET @Comment = 'the Date of Employees Calendar'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Employee_ID'
SET @Comment = 'the Employee Identification Number'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Day_WorkingDayType_FKEY'
SET @Comment = 'FKEY to tb_TRGMDL_HR_WorkingDayTypes (Working Day, Vacation, Holiday, etc.)'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Eligible_Working_Day_Flag'
SET @Comment = 'Indicates whether the Employee is Supposed to Work (Holidays, Vacations, etc are Marked as Zero)'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Actual_Vacation_Day_Flag'
SET @Comment = 'Indicates whether the Employee had an Actual Vacation Day on this Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Planned_Vacation_Day_Flag'
SET @Comment = 'Indicates whether the Employee had a Planned Vacation Day on this Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Education_Day_Flag'
SET @Comment = 'Indicates whether the Employee was on an Education Programm that Day (Seminar etc.)'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Presense_Day_Flag'
SET @Comment = 'Indicates whether the Employee was Working on this Date (regardless of the Date being a working day - e.g. Holiday)'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Absense_Day_Flag'
SET @Comment = 'Indicates whether the Employee was Absent on this Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Unjustified_Absense_Day_Flag'
SET @Comment = 'Indicates whether the Employee was Absent on this Date where he was supposed to Work, Working_Day_Flag = 1'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name



SET @Column_Name = 'Eligible_Working_Hours'
SET @Comment = 'Working Hours According to Employees Contract'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name

SET @Column_Name = 'Actual_Working_Hours'
SET @Comment = 'Actual Hours that the Employee had Worked on this Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=@Comment , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=@Table_Name, @level2type=N'COLUMN',@level2name=@Column_Name





/* End of Column Descriptions -------------------------------------------------------------------------------------------------------- */
