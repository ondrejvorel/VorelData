USE Targit_Model
GO

CREATE TABLE tb_TRGMDL_Dates
(
	PKEY int NOT NULL,
	PK_Date date NOT NULL,
	CM_Date_Name varchar(20) NOT NULL,
	CM_MonthDay tinyint NOT NULL,
	CM_MonthDay_Name varchar(10) NOT NULL,
	CM_Month_Name varchar(20) NOT NULL,
	CM_Month_Abbr varchar(3) NOT NULL,
	CM_Month_Name_GR varchar(20) NOT NULL,
	CM_Month_Abbr_GR varchar(3) NOT NULL,
	CM_WeekDay_Name varchar(20) NOT NULL,
	CM_WeekDay_Abbr varchar(3) NOT NULL,
	CM_WeekDay_Name_GR varchar(20) NOT NULL,
	CM_WeekDay_Abbr_GR varchar(3) NOT NULL,
	CL_Year smallint NOT NULL,
	CL_Year_Name varchar(10) NOT NULL,
	CL_Semester tinyint NOT NULL,
	CL_Semester_Name varchar(10) NOT NULL,
	CL_Quarter tinyint NOT NULL,
	CL_Quarter_Name varchar(10) NOT NULL,
	CL_Month tinyint NOT NULL,
	CL_Week tinyint NOT NULL,
	CL_Week_Name varchar(10) NOT NULL,
	CL_WeekDay_Number tinyint NOT NULL,
	CL_Week_Of_Month tinyint NOT NULL,
	FL_Year smallint NOT NULL,
	FL_Year_Name varchar(10) NOT NULL,
	FL_Semester tinyint NOT NULL,
	FL_Semester_Name varchar(10) NOT NULL,
	FL_Quarter tinyint NOT NULL,
	FL_Quarter_Name varchar(10) NOT NULL,
	FL_Month tinyint NOT NULL,
	FL_Week tinyint NOT NULL,
	FL_Week_Name varchar(10) NOT NULL,
	FL_WeekDay_Number tinyint NOT NULL,
	FL_Week_Of_Month tinyint NOT NULL,
	ISO_Year smallint NOT NULL,
	ISO_Week tinyint NOT NULL,
	ISO_Week_Name varchar(10) NOT NULL,
	ISO_WeekDay_Number tinyint NOT NULL,
 CONSTRAINT [PK_tb_TRGMDL_Dates] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


