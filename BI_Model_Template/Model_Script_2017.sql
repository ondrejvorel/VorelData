USE [master]
GO
/****** Object:  Database [Targit_Model_Empty]    Script Date: 27/07/2017 12:40:22 μμ ******/
CREATE DATABASE [Targit_Model_Empty]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Targit_Model', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Targit_Model_Empty.mdf' , SIZE = 587264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Targit_Model_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Targit_Model_Empty_log.ldf' , SIZE = 3828544KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [Targit_Model_Empty] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Targit_Model_Empty].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Targit_Model_Empty] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET ARITHABORT OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Targit_Model_Empty] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Targit_Model_Empty] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Targit_Model_Empty] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Targit_Model_Empty] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Targit_Model_Empty] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Targit_Model_Empty] SET  MULTI_USER 
GO
ALTER DATABASE [Targit_Model_Empty] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Targit_Model_Empty] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Targit_Model_Empty] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Targit_Model_Empty] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Targit_Model_Empty', N'ON'
GO
USE [Targit_Model_Empty]
GO
/****** Object:  User [mdl_user]    Script Date: 27/07/2017 12:40:22 μμ ******/
CREATE USER [mdl_user] FOR LOGIN [mdl_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [mdl_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [mdl_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [mdl_user]
GO
/****** Object:  Table [dbo].[tb_Dummy_DEF]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Dummy_DEF](
	[SourceFieldName] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Dummy_SRC]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Dummy_SRC](
	[SourceFieldName] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_SYSMDL_SQLAgent_ExecutionStatuses]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_SYSMDL_SQLAgent_ExecutionStatuses](
	[ExecutionStatus_ID] [tinyint] NOT NULL,
	[ExecutionStatus_Description] [varchar](15) NULL,
 CONSTRAINT [PK_tb_SYSMDL_SQLAgent_ExecutionStatuses] PRIMARY KEY CLUSTERED 
(
	[ExecutionStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_SYSMDL_SQLAgent_Job_History]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_SYSMDL_SQLAgent_Job_History](
	[PKEY] [bigint] NOT NULL,
	[Execution_PKEY] [varchar](25) NULL,
	[Job_Step_PKEY] [varchar](120) NULL,
	[Run_Date] [int] NULL,
	[Run_Time] [int] NULL,
	[Job_ID] [uniqueidentifier] NULL,
	[Step_ID] [varchar](110) NULL,
	[Step_Sorter] [int] NULL,
	[Run_Date_Full] [datetime] NULL,
	[Job_Name] [nvarchar](128) NULL,
	[Step_Name] [nvarchar](128) NULL,
	[Step_Type] [nvarchar](40) NULL,
	[History_Severity] [int] NULL,
	[History_Message] [nvarchar](4000) NULL,
	[Run_Duration_Seconds] [int] NULL,
	[Run_Duration_Time_Format] [varchar](8) NULL,
	[ExecutionStatus_ID] [tinyint] NULL,
	[Retries] [int] NULL,
 CONSTRAINT [PK_tb_SYSMDL_SQLAgent_Job_History] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_SYSMDL_SQLAgent_Jobs]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_SYSMDL_SQLAgent_Jobs](
	[Job_PKEY] [int] NOT NULL,
	[Job_ID] [uniqueidentifier] NULL,
	[Job_Name] [varchar](150) NULL,
 CONSTRAINT [PK_tb_SYSMDL_SQLAgent_Jobs] PRIMARY KEY CLUSTERED 
(
	[Job_PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Branches]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Branches](
	[Branch_ID] [int] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Branch_Code] [varchar](50) NULL,
	[Branch_Alt_Code] [varchar](50) NULL,
	[Branch_Parent_ID] [int] NULL,
	[Branch_Name] [varchar](100) NULL,
	[Branch_Type] [varchar](100) NULL,
	[Branch_Classification] [varchar](100) NULL,
	[Branch_Address] [varchar](100) NULL,
	[Branch_City] [varchar](100) NULL,
	[Branch_District] [varchar](100) NULL,
	[Branch_GIS_FKEY] [bigint] NULL,
	[Branch_Post_Code] [varchar](14) NULL,
	[Branch_Phone_1] [varchar](20) NULL,
	[Branch_Phone_2] [varchar](20) NULL,
	[Branch_email] [varchar](80) NULL,
	[Is_Active_Flag] [tinyint] NULL,
	[Custom_Value_1] [varchar](50) NULL,
	[Custom_Description_1] [varchar](50) NULL,
	[Custom_Value_2] [varchar](50) NULL,
	[Custom_Description_2] [varchar](50) NULL,
	[Custom_Value_3] [varchar](50) NULL,
	[Custom_Description_3] [varchar](50) NULL,
	[Custom_Value_4] [varchar](50) NULL,
	[Custom_Description_4] [varchar](50) NULL,
	[Custom_Value_5] [varchar](50) NULL,
	[Custom_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Branches] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Budget]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Budget](
	[Budget_PKEY] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_ID] [smallint] NULL,
	[Budget_Date] [int] NULL,
	[Budget_Product_ID] [int] NULL,
	[Budget_Customer_ID] [int] NULL,
	[Budget_Branch_ID] [int] NULL,
	[Budget_CostCenter_ID] [int] NULL,
	[Budget_GIS_ID] [bigint] NULL,
	[Budget_Transaction_Type_ID] [smallint] NULL,
	[Budget_Version] [varchar](50) NULL,
	[Budget_Value] [numeric](18, 2) NULL,
	[Budget_Quantity] [numeric](18, 2) NULL,
	[Budget_Value2] [numeric](18, 2) NULL,
	[Budget_Value3] [numeric](18, 2) NULL,
	[Budget_Value4] [numeric](18, 2) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Budget] PRIMARY KEY CLUSTERED 
(
	[Budget_PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Companies]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Companies](
	[Company_ID] [smallint] NOT NULL,
	[Company_Code] [varchar](50) NULL,
	[Company_Alt_Code] [varchar](50) NULL,
	[Company_Description_EL] [varchar](100) NULL,
	[Company_Description_EN] [varchar](100) NULL,
	[Targit_Customer_ID] [int] NULL,
	[Targit_Customer_Name] [varchar](100) NULL,
	[Company_Type] [varchar](100) NULL,
	[Parent_Company_Code] [smallint] NULL,
	[Parent_Company_Name] [varchar](100) NULL,
	[Company_Group_ID] [smallint] NULL,
	[Company_Group_Name] [varchar](100) NULL,
	[Tax_ID] [varchar](18) NULL,
	[Tax_Office] [varchar](100) NULL,
	[ARMAE] [varchar](20) NULL,
	[Company_Address] [varchar](100) NULL,
	[Company_Address_No] [varchar](10) NULL,
	[Company_Post_Code] [varchar](14) NULL,
	[District] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[Secondary_Address] [varchar](100) NULL,
	[Secondary_Address_No] [varchar](10) NULL,
	[Secondary_Post_Code] [varchar](14) NULL,
	[District_2] [varchar](30) NULL,
	[City_2] [varchar](30) NULL,
	[Company_Phone] [varchar](20) NULL,
	[Company_Phone_2] [varchar](20) NULL,
	[Email] [varchar](80) NULL,
	[Email_2] [varchar](80) NULL,
	[Fax] [varchar](14) NULL,
	[Telex] [varchar](14) NULL,
	[Internet_Site] [varchar](60) NULL,
	[Comments] [varchar](500) NULL,
	[Segmentation_Class_Value] [varchar](10) NULL,
	[Segmentation_Class_Description] [varchar](100) NULL,
	[Custom_Value_1] [varchar](50) NULL,
	[Custom_Description_1] [varchar](50) NULL,
	[Custom_Value_2] [varchar](50) NULL,
	[Custom_Description_2] [varchar](50) NULL,
	[Custom_Value_3] [varchar](50) NULL,
	[Custom_Description_3] [varchar](50) NULL,
	[Custom_Value_4] [varchar](50) NULL,
	[Custom_Description_4] [varchar](50) NULL,
	[Custom_Value_5] [varchar](50) NULL,
	[Custom_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Companies_1] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_CostCenters]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_CostCenters](
	[CC_ID] [int] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[CC_Code] [varchar](50) NULL,
	[CC_Alt_Code] [varchar](50) NULL,
	[CC_Parent_ID] [int] NULL,
	[CC_Name] [varchar](100) NULL,
	[CC_Type] [varchar](100) NULL,
	[CC_Classification] [varchar](100) NULL,
	[CC_Address] [varchar](100) NULL,
	[CC_City] [varchar](100) NULL,
	[CC_District] [varchar](100) NULL,
	[CC_GIS_FKEY] [bigint] NULL,
	[CC_Post_Code] [varchar](14) NULL,
	[CC_Phone_1] [varchar](20) NULL,
	[CC_Phone_2] [varchar](20) NULL,
	[CC_email] [varchar](80) NULL,
	[Commercial_CC_Code] [varchar](100) NULL,
	[Accounting_CC_Code] [varchar](100) NULL,
	[Is_Active_Flag] [tinyint] NULL,
	[Custom_Value_1] [varchar](50) NULL,
	[Custom_Description_1] [varchar](50) NULL,
	[Custom_Value_2] [varchar](50) NULL,
	[Custom_Description_2] [varchar](50) NULL,
	[Custom_Value_3] [varchar](50) NULL,
	[Custom_Description_3] [varchar](50) NULL,
	[Custom_Value_4] [varchar](50) NULL,
	[Custom_Description_4] [varchar](50) NULL,
	[Custom_Value_5] [varchar](50) NULL,
	[Custom_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_CostCenters] PRIMARY KEY CLUSTERED 
(
	[CC_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Customers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Customers](
	[Customer_ID] [bigint] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Customer_Code] [varchar](50) NULL,
	[Customer_Alt_Code] [varchar](50) NULL,
	[Customer_Parent_ID] [int] NULL,
	[Customer_FullName] [varchar](100) NULL,
	[Customer_FirstName] [varchar](100) NULL,
	[Customer_LastName] [varchar](100) NULL,
	[Customer_BirthDate] [date] NULL,
	[Customer_Age] [tinyint] NULL,
	[Customer_Category_Code] [bigint] NULL,
	[Customer_SubCategory_Code] [bigint] NULL,
	[Customer_Group_Code] [bigint] NULL,
	[Customer_Category] [varchar](100) NULL,
	[Customer_SubCategory] [varchar](100) NULL,
	[Customer_Group] [varchar](100) NULL,
	[Customer_Segment] [varchar](100) NULL,
	[Customer_Type] [varchar](100) NULL,
	[Customer_RFM] [smallint] NULL,
	[Is_Active_Flag] [tinyint] NULL,
	[Fav_Form_of_Payment] [varchar](50) NULL,
	[Fav_Delivery_Method] [varchar](50) NULL,
	[Fav_Branch_ID] [smallint] NULL,
	[Has_DebitCard_Flag] [tinyint] NULL,
	[Has_CreditCard_Flag] [tinyint] NULL,
	[Customer_Job] [varchar](100) NULL,
	[Tax_ID] [varchar](18) NULL,
	[Tax_Office] [varchar](100) NULL,
	[Account] [varchar](25) NULL,
	[Primary_Address] [varchar](100) NULL,
	[Primary_Address_No] [varchar](10) NULL,
	[Secondary_Address] [varchar](100) NULL,
	[Secondary_Address_No] [varchar](10) NULL,
	[Other_Address] [varchar](100) NULL,
	[Other_Address_No] [varchar](10) NULL,
	[Primary_Post_Code] [varchar](14) NULL,
	[Secondary_Post_Code] [varchar](14) NULL,
	[Other_Post_Code] [varchar](14) NULL,
	[Primary_GIS_FKEY] [bigint] NULL,
	[Secondary_GIS_FKEY] [bigint] NULL,
	[Other_GIS_FKEY] [bigint] NULL,
	[District] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Primary_Latitude] [bigint] NULL,
	[Primary_Longtitude] [bigint] NULL,
	[Mobile_Phone] [varchar](50) NULL,
	[Mobile_Phone_2] [varchar](50) NULL,
	[Phone_1] [varchar](50) NULL,
	[Phone_2] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Email_2] [varchar](100) NULL,
	[Fax] [varchar](50) NULL,
	[Internet_Site] [varchar](100) NULL,
	[Comments] [varchar](500) NULL,
	[Segmentation1_Class_Value] [varchar](100) NULL,
	[Segmentation1_Class_Description] [varchar](100) NULL,
	[Segmentation2_Class_Value] [varchar](100) NULL,
	[Segmentation2_Class_Description] [varchar](100) NULL,
	[Segmentation3_Class_Value] [varchar](100) NULL,
	[Segmentation3_Class_Description] [varchar](100) NULL,
	[Customer_Hierarchy_Level1_Code] [bigint] NULL,
	[Customer_Hierarchy_Level1_Name] [varchar](100) NULL,
	[Customer_Hierarchy_Level2_Code] [bigint] NULL,
	[Customer_Hierarchy_Level2_Name] [varchar](100) NULL,
	[Customer_Hierarchy_Level3_Code] [bigint] NULL,
	[Customer_Hierarchy_Level3_Name] [varchar](100) NULL,
	[Custom_Value_1] [varchar](50) NULL,
	[Custom_Description_1] [varchar](50) NULL,
	[Custom_Value_2] [varchar](50) NULL,
	[Custom_Description_2] [varchar](50) NULL,
	[Custom_Value_3] [varchar](50) NULL,
	[Custom_Description_3] [varchar](50) NULL,
	[Custom_Value_4] [varchar](50) NULL,
	[Custom_Description_4] [varchar](50) NULL,
	[Custom_Value_5] [varchar](50) NULL,
	[Custom_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Dates]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Dates](
	[PKEY] [int] NOT NULL,
	[PK_Date] [date] NOT NULL,
	[CM_Date_Name] [varchar](20) NOT NULL,
	[CM_MonthDay] [tinyint] NOT NULL,
	[CM_MonthDay_Name] [varchar](10) NOT NULL,
	[CM_Month_Name] [varchar](20) NOT NULL,
	[CM_Month_Abbr] [varchar](3) NOT NULL,
	[CM_Month_Name_GR] [varchar](20) NOT NULL,
	[CM_Month_Abbr_GR] [varchar](3) NOT NULL,
	[CM_WeekDay_Name] [varchar](20) NOT NULL,
	[CM_WeekDay_Abbr] [varchar](3) NOT NULL,
	[CM_WeekDay_Name_GR] [varchar](20) NOT NULL,
	[CM_WeekDay_Abbr_GR] [varchar](3) NOT NULL,
	[CL_Year] [smallint] NOT NULL,
	[CL_Year_Name] [varchar](10) NOT NULL,
	[CL_Semester] [tinyint] NOT NULL,
	[CL_Semester_Name] [varchar](10) NOT NULL,
	[CL_Trimester] [tinyint] NULL,
	[CL_Trimester_Name] [varchar](10) NULL,
	[CL_Quarter] [tinyint] NOT NULL,
	[CL_Quarter_Name] [varchar](10) NOT NULL,
	[CL_Month] [tinyint] NOT NULL,
	[CL_Week] [tinyint] NOT NULL,
	[CL_Week_Name] [varchar](10) NOT NULL,
	[CL_WeekDay_Number] [tinyint] NOT NULL,
	[CL_Week_Of_Month] [tinyint] NOT NULL,
	[FL_Year] [smallint] NOT NULL,
	[FL_Year_Name] [varchar](10) NOT NULL,
	[FL_Semester] [tinyint] NOT NULL,
	[FL_Semester_Name] [varchar](10) NOT NULL,
	[FL_Trimester] [tinyint] NULL,
	[FL_Trimester_Name] [varchar](10) NULL,
	[FL_Quarter] [tinyint] NOT NULL,
	[FL_Quarter_Name] [varchar](10) NOT NULL,
	[FL_Month] [tinyint] NOT NULL,
	[FL_Week] [tinyint] NOT NULL,
	[FL_Week_Name] [varchar](10) NOT NULL,
	[FL_WeekDay_Number] [tinyint] NOT NULL,
	[FL_Week_Of_Month] [tinyint] NOT NULL,
	[ISO_Year] [smallint] NOT NULL,
	[ISO_Week] [tinyint] NOT NULL,
	[ISO_Week_Name] [varchar](10) NOT NULL,
	[ISO_WeekDay_Number] [tinyint] NOT NULL,
 CONSTRAINT [PK_tb_TRGMDL_Dates] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Dates_Holidays]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Dates_Holidays](
	[PKEY] [int] NOT NULL,
	[PK_Date] [datetime] NOT NULL,
	[Holiday_Name] [varchar](100) NOT NULL,
	[Holiday_Name_2] [varchar](100) NOT NULL,
	[Holiday_Group] [varchar](100) NOT NULL,
	[Holiday_Group_2] [varchar](100) NOT NULL,
	[Holiday_Flag_RetailHQ] [tinyint] NOT NULL,
	[Holiday_Flag_RetailStores] [tinyint] NOT NULL,
	[Holiday_Flag_ShippingHQ] [tinyint] NOT NULL,
	[Holiday_Flag_ShippingShips] [tinyint] NOT NULL,
 CONSTRAINT [PK_tb_TRGMDL_Dates_Holidays] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Dates_SALES_Periods]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Dates_SALES_Periods](
	[PKEY] [int] NOT NULL,
	[PK_Date] [date] NOT NULL,
	[SALES_Description] [varchar](100) NULL,
	[SALES_Group_L1] [varchar](100) NULL,
	[SALES_Group_L2] [varchar](100) NULL,
	[SALES_Group_L3] [varchar](100) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Dates_SALES_Periods] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Dates_Special_Events]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Dates_Special_Events](
	[PKEY] [int] NOT NULL,
	[PK_Date] [date] NOT NULL,
	[Special_Date_Description] [varchar](100) NULL,
	[Special_Date_Group_L1] [varchar](100) NULL,
	[Special_Date_Group_L2] [varchar](100) NULL,
	[Special_Date_Group_L3] [varchar](100) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Dates_Special_Events] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Dates_Working_Sundays]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Dates_Working_Sundays](
	[PKEY] [int] NOT NULL,
	[PK_Date] [date] NOT NULL,
	[Working_Sunday_Stores_Flag] [tinyint] NULL,
	[Working_Sunday_HQ_Flag] [tinyint] NULL,
 CONSTRAINT [PK_tb_TRGMDL_Dates_Working_Sundays] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TRGMDL_Document_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Document_Types](
	[Document_Type_ID] [smallint] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Document_Type_Code] [varchar](50) NULL,
	[Document_Type_Alt_Code] [varchar](50) NULL,
	[Document_Type_Description] [varchar](100) NULL,
	[Document_Type_SignFactor] [smallint] NULL,
	[Document_Type_Order_Flag] [tinyint] NULL,
	[Document_Type_Invoice_Flag] [tinyint] NULL,
	[Document_Type_Order_SignFactor] [smallint] NULL,
	[Document_Type_Invoice_SignFactor] [smallint] NULL,
 CONSTRAINT [PK_tb_TRGMDL_Document_Types] PRIMARY KEY CLUSTERED 
(
	[Document_Type_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Employees]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Employees](
	[Employee_ID] [int] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Employee_Code] [varchar](50) NULL,
	[Employee_Alt_Code] [varchar](50) NULL,
	[Employee_Parent_ID] [int] NULL,
	[Employee_FullName] [varchar](110) NULL,
	[Employee_FirstName] [varchar](50) NULL,
	[Employee_LastName] [varchar](50) NULL,
	[Employee_MaidenName] [varchar](100) NULL,
	[Employee_ID_Number] [varchar](20) NULL,
	[Employee_TAX_Number] [varchar](20) NULL,
	[Employee_TAX_Department] [varchar](100) NULL,
	[Employee_Home_Address] [varchar](100) NULL,
	[Employee_Home_PostCode] [varchar](10) NULL,
	[Employee_Home_PhoneNumber] [varchar](20) NULL,
	[Employee_Mobile_PhoneNumber] [varchar](20) NULL,
	[Employee_email] [varchar](100) NULL,
	[Employee_WorkHourClass] [varchar](10) NULL,
	[Employee_HireDate] [date] NULL,
	[Employee_LeaveDate] [date] NULL,
	[Employee_LeaveReason] [varchar](100) NULL,
	[Employee_Department_ID_FKEY] [int] NULL,
	[Employee_Department_CC] [int] NULL,
	[Employee_Branch_ID] [int] NULL,
	[Employee_Grade] [varchar](10) NULL,
	[Employee_Specialty] [varchar](100) NULL,
	[Employee_GrossSalary] [numeric](10, 2) NULL,
	[Employee_NetSalary] [numeric](10, 2) NULL,
	[Employee_Eligible_Vacation_Days] [tinyint] NULL,
	[Is_Active_Flag] [tinyint] NULL,
 CONSTRAINT [PK_tb_TRGMDL_Employees] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Geographical_Info]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Geographical_Info](
	[PKEY] [bigint] NOT NULL,
	[Country_ID] [varchar](10) NULL,
	[Country_Description] [varchar](50) NULL,
	[Geographical_Region_ID] [varchar](10) NULL,
	[Geographical_Region_Description_EL] [varchar](50) NULL,
	[Geographical_Region_Description_EN] [varchar](50) NULL,
	[County_ID] [varchar](10) NULL,
	[County_Description_EL] [varchar](50) NULL,
	[County_Description_EN] [varchar](50) NULL,
	[Prefecture_ID] [varchar](15) NULL,
	[Prefecture_Description_EL] [varchar](50) NULL,
	[Prefecture_Description_EN] [varchar](50) NULL,
	[Municipality_ID] [varchar](15) NULL,
	[Municipality_Description_EL] [varchar](50) NULL,
	[Municipality_Description_EN] [varchar](50) NULL,
	[City_ID] [varchar](20) NULL,
	[City_Description] [varchar](50) NULL,
	[Area_ID] [varchar](25) NULL,
	[Area_Description] [varchar](50) NULL,
	[Post_Code] [varchar](14) NULL,
	[Post_Code_MAPKEY] [varchar](14) NULL,
	[Country_CID] [varchar](10) NULL,
	[Geographical_Depart_CID] [varchar](10) NULL,
	[County_CID] [varchar](10) NULL,
	[Municipality_CID] [varchar](10) NULL,
	[City_CID] [varchar](10) NULL,
	[Area_CID] [varchar](10) NULL,
	[Classified_Value_1] [varchar](50) NULL,
	[Classified_Description_1] [varchar](50) NULL,
	[Classified_Value_2] [varchar](50) NULL,
	[Classified_Description_2] [varchar](50) NULL,
	[Classified_Value_3] [varchar](50) NULL,
	[Classified_Description_3] [varchar](50) NULL,
	[Classified_Value_4] [varchar](50) NULL,
	[Classified_Description_4] [varchar](50) NULL,
	[Classified_Value_5] [varchar](50) NULL,
	[Classified_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Geographical_Info] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Numbers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Numbers](
	[PKEY] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Group_by_50_ID] [int] NULL,
	[Group_by_50_Name] [varchar](50) NULL,
	[Group_by_100_ID] [int] NULL,
	[Group_by_100_Name] [varchar](50) NULL,
	[Group_by_150_ID] [int] NULL,
	[Group_by_150_Name] [varchar](50) NULL,
	[Group_by_250_ID] [int] NULL,
	[Group_by_250_Name] [varchar](50) NULL,
	[Group_by_500_ID] [int] NULL,
	[Group_by_500_Name] [varchar](50) NULL,
	[Group_by_1000_ID] [int] NULL,
	[Group_by_1000_Name] [varchar](50) NULL,
	[Custom_Group_1_ID] [int] NULL,
	[Custom_Group_1_Name] [varchar](50) NULL,
	[Custom_Group_2_ID] [int] NULL,
	[Custom_Group_2_Name] [varchar](50) NULL,
	[Custom_Group_3_ID] [int] NULL,
	[Custom_Group_3_Name] [varchar](50) NULL,
	[Custom_Group_4_ID] [int] NULL,
	[Custom_Group_4_Name] [varchar](50) NULL,
	[Custom_Group_5_ID] [int] NULL,
	[Custom_Group_5_Name] [varchar](50) NULL,
	[Custom_Group_6_ID] [int] NULL,
	[Custom_Group_6_Name] [varchar](50) NULL,
	[Custom_Group_7_ID] [int] NULL,
	[Custom_Group_7_Name] [varchar](50) NULL,
	[Custom_Group_8_ID] [int] NULL,
	[Custom_Group_8_Name] [varchar](50) NULL,
	[Custom_Group_9_ID] [int] NULL,
	[Custom_Group_9_Name] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Numbers] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Products]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Products](
	[Product_ID] [int] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Product_Code] [varchar](100) NULL,
	[Product_Alt_Code] [varchar](100) NULL,
	[Product_Parent_ID] [int] NULL,
	[Product_Master_ID] [int] NULL,
	[Product_Replacement_ID] [int] NULL,
	[Product_Bundle_ID] [int] NULL,
	[Product_Name_EL] [varchar](100) NULL,
	[Product_Name_EN] [varchar](100) NULL,
	[Barcode] [varchar](40) NULL,
	[EAN] [varchar](40) NULL,
	[Product_Type] [varchar](40) NULL,
	[Product_Status] [varchar](40) NULL,
	[Product_Category_Code] [bigint] NULL,
	[Product_Category_Description] [varchar](100) NULL,
	[Product_SubCategory_Code] [bigint] NULL,
	[Product_SubCategory_Description] [varchar](100) NULL,
	[Product_Group_Code] [bigint] NULL,
	[Product_Group_Description] [varchar](100) NULL,
	[Product_Hierarchy_Level_1_Code] [bigint] NULL,
	[Product_Hierarchy_Level_1_Name] [varchar](100) NULL,
	[Product_Hierarchy_Level_2_Code] [bigint] NULL,
	[Product_Hierarchy_Level_2_Name] [varchar](100) NULL,
	[Product_Hierarchy_Level_3_Code] [bigint] NULL,
	[Product_Hierarchy_Level_3_Name] [varchar](100) NULL,
	[Product_Hierarchy_Level_4_Code] [bigint] NULL,
	[Product_Hierarchy_Level_4_Name] [varchar](100) NULL,
	[Product_Hierarchy_Level_5_Code] [bigint] NULL,
	[Product_Hierarchy_Level_5_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_1_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_1_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_2_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_2_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_3_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_3_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_4_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_4_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_5_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_5_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_6_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_6_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_7_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_7_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_8_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_8_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_9_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_9_Name] [varchar](100) NULL,
	[Product_Hierarchy2_Level_10_Code] [varchar](50) NULL,
	[Product_Hierarchy2_Level_10_Name] [varchar](100) NULL,
	[Basic_Supplier] [varchar](10) NULL,
	[Supplier_Product_Code] [varchar](20) NULL,
	[Supplier_Description] [varchar](40) NULL,
	[Manufacture_Country] [varchar](50) NULL,
	[Origin_Country] [varchar](50) NULL,
	[Manufacturer] [varchar](50) NULL,
	[Product_Brand] [varchar](50) NULL,
	[Product_Model] [varchar](50) NULL,
	[Stock_Method] [varchar](50) NULL,
	[Cost_Method] [varchar](50) NULL,
	[TaxClass] [varchar](50) NULL,
	[Product_Life_Cycle_State] [varchar](50) NULL,
	[Measurement_Unit] [varchar](50) NULL,
	[Volume] [numeric](15, 5) NULL,
	[Net_Weight] [numeric](10, 3) NULL,
	[Gross_Weight] [numeric](10, 3) NULL,
	[Current_Stock_Quantity] [int] NULL,
	[Current_Discount] [numeric](15, 2) NULL,
	[Current_Discount_PCT] [numeric](15, 2) NULL,
	[Current_Cost] [numeric](15, 2) NULL,
	[Current_Ticket_Price] [numeric](15, 2) NULL,
	[Current_Retail_Price] [numeric](15, 2) NULL,
	[Current_Wholesale_Price] [numeric](15, 2) NULL,
	[Current_Purchase_Price] [numeric](15, 2) NULL,
	[Is_Active_Flag] [tinyint] NULL,
	[Spare_Flag1] [tinyint] NULL,
	[Spare_Flag1_Name] [varchar](50) NULL,
	[Spare_Flag2] [tinyint] NULL,
	[Spare_Flag2_Name] [varchar](50) NULL,
	[Spare_Flag3] [tinyint] NULL,
	[Spare_Flag3_Name] [varchar](50) NULL,
	[Custom_Value_1] [varchar](50) NULL,
	[Custom_Description_1] [varchar](50) NULL,
	[Custom_Value_2] [varchar](50) NULL,
	[Custom_Description_2] [varchar](50) NULL,
	[Custom_Value_3] [varchar](50) NULL,
	[Custom_Description_3] [varchar](50) NULL,
	[Custom_Value_4] [varchar](50) NULL,
	[Custom_Description_4] [varchar](50) NULL,
	[Custom_Value_5] [varchar](50) NULL,
	[Custom_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Stock_Current]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Stock_Current](
	[Company_ID] [smallint] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Warehouse_ID] [int] NOT NULL,
	[Stock_Date] [int] NOT NULL,
	[Stock_Quantity] [numeric](18, 4) NULL,
	[Stock_Quantity_2] [numeric](18, 4) NULL,
	[Stock_Value] [numeric](18, 4) NULL,
	[Stock_Value_2] [numeric](18, 4) NULL,
	[Stock_Value_3] [numeric](18, 4) NULL,
	[Stock_Value_4] [numeric](18, 4) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Stock_Current] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC,
	[Product_ID] ASC,
	[Warehouse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TRGMDL_Stock_Historical]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Stock_Historical](
	[Company_ID] [smallint] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Warehouse_ID] [int] NOT NULL,
	[Stock_Date] [int] NOT NULL,
	[Stock_Quantity] [numeric](18, 4) NULL,
	[Stock_Quantity_2] [numeric](18, 4) NULL,
	[Stock_Value] [numeric](18, 4) NULL,
	[Stock_Value_2] [numeric](18, 4) NULL,
	[Stock_Value_3] [numeric](18, 4) NULL,
	[Stock_Value_4] [numeric](18, 4) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Stock_Historical] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC,
	[Product_ID] ASC,
	[Warehouse_ID] ASC,
	[Stock_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TRGMDL_Suppliers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Suppliers](
	[Supplier_ID] [bigint] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Supplier_Code] [varchar](50) NULL,
	[Supplier_Alt_Code] [varchar](50) NULL,
	[Supplier_Parent_ID] [int] NULL,
	[Supplier_FullName] [varchar](100) NULL,
	[Supplier_FirstName] [varchar](100) NULL,
	[Supplier_LastName] [varchar](100) NULL,
	[Supplier_BirthDate] [date] NULL,
	[Supplier_Age] [tinyint] NULL,
	[Supplier_Category_Code] [bigint] NULL,
	[Supplier_SubCategory_Code] [bigint] NULL,
	[Supplier_Group_Code] [bigint] NULL,
	[Supplier_Category] [varchar](100) NULL,
	[Supplier_SubCategory] [varchar](100) NULL,
	[Supplier_Group] [varchar](100) NULL,
	[Supplier_Segment] [varchar](100) NULL,
	[Supplier_Type] [varchar](100) NULL,
	[Supplier_RFM] [smallint] NULL,
	[Is_Active_Flag] [tinyint] NULL,
	[Fav_Form_of_Payment] [varchar](50) NULL,
	[Fav_Delivery_Method] [varchar](50) NULL,
	[Fav_Branch_ID] [smallint] NULL,
	[Has_DebitCard_Flag] [tinyint] NULL,
	[Has_CreditCard_Flag] [tinyint] NULL,
	[Supplier_Job] [varchar](100) NULL,
	[Tax_ID] [varchar](18) NULL,
	[Tax_Office] [varchar](100) NULL,
	[Account] [varchar](25) NULL,
	[Primary_Address] [varchar](100) NULL,
	[Primary_Address_No] [varchar](10) NULL,
	[Secondary_Address] [varchar](100) NULL,
	[Secondary_Address_No] [varchar](10) NULL,
	[Other_Address] [varchar](100) NULL,
	[Other_Address_No] [varchar](10) NULL,
	[Primary_Post_Code] [varchar](14) NULL,
	[Secondary_Post_Code] [varchar](14) NULL,
	[Other_Post_Code] [varchar](14) NULL,
	[Primary_GIS_FKEY] [bigint] NULL,
	[Secondary_GIS_FKEY] [bigint] NULL,
	[Other_GIS_FKEY] [bigint] NULL,
	[District] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Primary_Latitude] [bigint] NULL,
	[Primary_Longtitude] [bigint] NULL,
	[Mobile_Phone] [varchar](50) NULL,
	[Mobile_Phone_2] [varchar](50) NULL,
	[Phone_1] [varchar](50) NULL,
	[Phone_2] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Email_2] [varchar](100) NULL,
	[Fax] [varchar](50) NULL,
	[Internet_Site] [varchar](100) NULL,
	[Comments] [varchar](500) NULL,
	[Segmentation1_Class_Value] [varchar](100) NULL,
	[Segmentation1_Class_Description] [varchar](100) NULL,
	[Segmentation2_Class_Value] [varchar](100) NULL,
	[Segmentation2_Class_Description] [varchar](100) NULL,
	[Segmentation3_Class_Value] [varchar](100) NULL,
	[Segmentation3_Class_Description] [varchar](100) NULL,
	[Supplier_Hierarchy_Level1_Code] [bigint] NULL,
	[Supplier_Hierarchy_Level1_Name] [varchar](100) NULL,
	[Supplier_Hierarchy_Level2_Code] [bigint] NULL,
	[Supplier_Hierarchy_Level2_Name] [varchar](100) NULL,
	[Supplier_Hierarchy_Level3_Code] [bigint] NULL,
	[Supplier_Hierarchy_Level3_Name] [varchar](100) NULL,
	[Custom_Value_1] [varchar](50) NULL,
	[Custom_Description_1] [varchar](50) NULL,
	[Custom_Value_2] [varchar](50) NULL,
	[Custom_Description_2] [varchar](50) NULL,
	[Custom_Value_3] [varchar](50) NULL,
	[Custom_Description_3] [varchar](50) NULL,
	[Custom_Value_4] [varchar](50) NULL,
	[Custom_Description_4] [varchar](50) NULL,
	[Custom_Value_5] [varchar](50) NULL,
	[Custom_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Time]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Time](
	[PKEY] [int] NOT NULL,
	[TM_Hour] [smallint] NULL,
	[TM_Minute] [smallint] NULL,
	[TM_Second] [smallint] NULL,
	[TM_Description] [varchar](20) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Time] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Transaction_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Transaction_Types](
	[Transaction_Type_ID] [smallint] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Transaction_Type_Description] [varchar](50) NULL,
	[Transaction_Type_Group_Level1_ID] [tinyint] NULL,
	[Transaction_Type_Group_Level1_Description] [varchar](50) NULL,
	[Transaction_Type_Group_Level2_ID] [tinyint] NULL,
	[Transaction_Type_Group_Level2_Description] [varchar](50) NULL,
	[Transaction_Type_Group_Level3_ID] [tinyint] NULL,
	[Transaction_Type_Group_Level3_Description] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Transaction_Types_1] PRIMARY KEY CLUSTERED 
(
	[Transaction_Type_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Transactions]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Transactions](
	[Transaction_PKEY] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_ID] [smallint] NULL,
	[Transaction_Type_FKEY] [smallint] NULL,
	[Transaction_Document_Type_FKEY] [smallint] NULL,
	[Order_Document_Type_FKEY] [smallint] NULL,
	[Product_FKEY] [int] NULL,
	[Master_Product_FKEY] [int] NULL,
	[Parent_Product_FKEY] [int] NULL,
	[Replacement_Product_FKEY] [int] NULL,
	[Bundle_Product_FKEY] [int] NULL,
	[Salesperson_FKEY] [int] NULL,
	[Cashier_FKEY] [int] NULL,
	[Customer_FKEY] [bigint] NULL,
	[Parent_Customer_FKEY] [bigint] NULL,
	[Supplier_FKEY] [bigint] NULL,
	[Transaction_Warehouse_FKEY] [int] NULL,
	[Order_Warehouse_FKEY] [int] NULL,
	[Invoice_Warehouse_FKEY] [int] NULL,
	[Transaction_Branch_FKEY] [int] NULL,
	[Order_Branch_FKEY] [int] NULL,
	[Invoice_Branch_FKEY] [int] NULL,
	[Branch_OUT_FKEY] [int] NULL,
	[Branch_IN_FKEY] [int] NULL,
	[Channel_FKEY] [smallint] NULL,
	[Form_of_Payment_FKEY] [smallint] NULL,
	[Delivery_GIS_FKEY] [bigint] NULL,
	[Customer_GIS_FKEY] [bigint] NULL,
	[Supplier_GIS_FKEY] [bigint] NULL,
	[Transaction_Branch_GIS_FKEY] [bigint] NULL,
	[Order_Branch_GIS_FKEY] [bigint] NULL,
	[Invoice_Branch_GIS_FKEY] [bigint] NULL,
	[Branch_OUT_GIS_FKEY] [bigint] NULL,
	[Branch_IN_GIS_FKEY] [bigint] NULL,
	[Order_Flag] [smallint] NULL,
	[Invoice_Flag] [smallint] NULL,
	[Order_SignFactor] [smallint] NULL,
	[Invoice_SignFactor] [smallint] NULL,
	[Transaction_Document_No] [varchar](50) NULL,
	[Order_Document_No] [varchar](50) NULL,
	[Basket_Gross_Value] [int] NULL,
	[Basket_Net_Value] [int] NULL,
	[Basket_Discount_Value] [int] NULL,
	[Record_Creation_Date] [int] NULL,
	[Transaction_Date] [int] NULL,
	[Order_Date] [int] NULL,
	[Invoice_Date] [int] NULL,
	[Delivery_Date] [int] NULL,
	[Estimated_Pay_Date] [int] NULL,
	[Actual_Pay_Date] [int] NULL,
	[Record_Creation_Time] [int] NULL,
	[Transaction_Time] [int] NULL,
	[Order_Time] [int] NULL,
	[Delivery_Time] [int] NULL,
	[Transaction_Quantity] [numeric](18, 0) NULL,
	[Transaction_Quantity_2] [numeric](18, 0) NULL,
	[Transaction_Quantity_IN] [numeric](18, 0) NULL,
	[Transaction_Quantity_OUT] [numeric](18, 0) NULL,
	[Transaction_Gross_Value] [numeric](18, 4) NULL,
	[Transaction_Net_Value] [numeric](18, 4) NULL,
	[Transaction_Cost] [numeric](18, 4) NULL,
	[Sales_Quantity] [numeric](18, 0) NULL,
	[Sales_Quantity_2] [numeric](18, 0) NULL,
	[Sales_Gross_Value_Initial] [numeric](18, 4) NULL,
	[Sales_Gross_Value_Final] [numeric](18, 4) NULL,
	[Sales_VAT_Value_Initial] [numeric](18, 4) NULL,
	[Sales_VAT_Value_Final] [numeric](18, 4) NULL,
	[Sales_Gross_Discount_Value] [numeric](18, 4) NULL,
	[Sales_Net_Value_Initial] [numeric](18, 4) NULL,
	[Sales_Net_Value_Final] [numeric](18, 4) NULL,
	[Sales_Net_Discount_Value] [numeric](18, 4) NULL,
	[Sales_Net_Discount_Value_1] [numeric](18, 4) NULL,
	[Sales_Net_Discount_Value_2] [numeric](18, 4) NULL,
	[Sales_Net_Discount_Value_3] [numeric](18, 4) NULL,
	[Sales_Net_Discount_Value_4] [numeric](18, 4) NULL,
	[Sales_Net_Discount_Value_5] [numeric](18, 4) NULL,
	[Sales_Other_Income] [numeric](18, 4) NULL,
	[Sales_Cost] [numeric](18, 4) NULL,
	[Sales_Gross_Margin] [numeric](18, 4) NULL,
	[Sales_Other_Profit] [numeric](18, 4) NULL,
	[Sales_Total_Margin] [numeric](18, 4) NULL,
	[Purchase_Quantity] [numeric](18, 0) NULL,
	[Purchase_Quantity_2] [numeric](18, 0) NULL,
	[Purchase_Gross_Value_Initial] [numeric](18, 4) NULL,
	[Purchase_Gross_Value_Final] [numeric](18, 4) NULL,
	[Purchase_VAT_Value_Initial] [numeric](18, 4) NULL,
	[Purchase_VAT_Value_Final] [numeric](18, 4) NULL,
	[Purchase_Net_Value_Initial] [numeric](18, 4) NULL,
	[Purchase_Net_Value_Final] [numeric](18, 4) NULL,
	[Purchase_Net_Discount_Value] [numeric](18, 4) NULL,
	[Purchase_Net_Discount_Value_1] [numeric](18, 4) NULL,
	[Purchase_Net_Discount_Value_2] [numeric](18, 4) NULL,
	[Purchase_Net_Discount_Value_3] [numeric](18, 4) NULL,
	[Purchase_Net_Discount_Value_4] [numeric](18, 4) NULL,
	[Purchase_Net_Discount_Value_5] [numeric](18, 4) NULL,
	[Cash_PCT] [numeric](18, 4) NULL,
	[DebitCard_PCT] [numeric](18, 4) NULL,
	[CreditCard_PCT] [numeric](18, 4) NULL,
	[BankLoan_PCT] [numeric](18, 4) NULL,
	[PaymentDelay_1m_PCT] [numeric](18, 4) NULL,
	[PaymentDelay_2m_PCT] [numeric](18, 4) NULL,
	[PaymentDelay_3m_PCT] [numeric](18, 4) NULL,
	[PaymentDelay_6m_PCT] [numeric](18, 4) NULL,
	[PaymentDelay_9m_PCT] [numeric](18, 4) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Transactions] PRIMARY KEY CLUSTERED 
(
	[Transaction_PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_TRGMDL_Warehouses]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_TRGMDL_Warehouses](
	[Warehouse_ID] [int] NOT NULL,
	[Company_ID] [smallint] NOT NULL,
	[Warehouse_Code] [varchar](50) NULL,
	[Warehouse_Alt_Code] [varchar](50) NULL,
	[Warehouse_Parent_ID] [int] NULL,
	[Warehouse_Name] [varchar](100) NULL,
	[Warehouse_Type] [varchar](100) NULL,
	[Warehouse_Classification] [varchar](100) NULL,
	[Warehouse_Address] [varchar](100) NULL,
	[Warehouse_City] [varchar](100) NULL,
	[Warehouse_District] [varchar](100) NULL,
	[Warehouse_GIS_FKEY] [bigint] NULL,
	[Warehouse_Post_Code] [varchar](14) NULL,
	[Warehouse_Phone_1] [varchar](20) NULL,
	[Warehouse_Phone_2] [varchar](20) NULL,
	[Warehouse_email] [varchar](80) NULL,
	[Is_Active_Flag] [tinyint] NULL,
	[Custom_Value_1] [varchar](50) NULL,
	[Custom_Description_1] [varchar](50) NULL,
	[Custom_Value_2] [varchar](50) NULL,
	[Custom_Description_2] [varchar](50) NULL,
	[Custom_Value_3] [varchar](50) NULL,
	[Custom_Description_3] [varchar](50) NULL,
	[Custom_Value_4] [varchar](50) NULL,
	[Custom_Description_4] [varchar](50) NULL,
	[Custom_Value_5] [varchar](50) NULL,
	[Custom_Description_5] [varchar](50) NULL,
 CONSTRAINT [PK_tb_TRGMDL_Warehouses] PRIMARY KEY CLUSTERED 
(
	[Warehouse_ID] ASC,
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_tb_TRGMDL_Document_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_tb_TRGMDL_Document_Types](
	[Document_Type_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Document_Type_Code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_temp_tb_TRGMDL_Document_Types] PRIMARY KEY CLUSTERED 
(
	[Document_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VIEW_DIM_Time]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DIM_Time] AS
SELECT TOP 100 PERCENT
	CAST(RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + RIGHT('00' + CAST(TM_Minute AS VARCHAR(10)),2) AS INT) AS PKEY, 
	TM_Hour, 
	TM_Minute, 
	RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) AS Hour_Text,
	RIGHT('00' + CAST(TM_Minute AS VARCHAR(10)),2) AS Minute_Text,
	CASE 
		WHEN TM_Minute BETWEEN 0 AND 29 THEN RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + ':00' 
		WHEN TM_Minute BETWEEN 30 AND 59 THEN RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + ':30'
	END AS HalfHour_Text,
	CASE 
		WHEN TM_Minute BETWEEN 0 AND 14 THEN RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + ':00' 
		WHEN TM_Minute BETWEEN 15 AND 29 THEN RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + ':15'
		WHEN TM_Minute BETWEEN 30 AND 44 THEN RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + ':30'
		WHEN TM_Minute BETWEEN 45 AND 59 THEN RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + ':45'
	END AS Quarter_Text,
	RIGHT('00' + CAST(TM_Hour AS VARCHAR(10)),2) + ':' + RIGHT('00' + CAST(TM_Minute AS VARCHAR(10)),2) AS TM_Description,
	CASE WHEN MAX(A.PKEY) BETWEEN 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, DATEADD(MINUTE, -5, GETDATE())) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, DATEADD(MINUTE, -5, GETDATE())) AS VARCHAR(10)),2) + ':00'
	) 
	AND 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, GETDATE()) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, GETDATE()) AS VARCHAR(10)),2) + ':00'
	) 
	THEN 1 ELSE 0 END
	AS Last_05_Min_Flag,
	CASE WHEN MAX(A.PKEY) BETWEEN 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, DATEADD(MINUTE, -15, GETDATE())) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, DATEADD(MINUTE, -15, GETDATE())) AS VARCHAR(10)),2) + ':00'
	) 
	AND 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, GETDATE()) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, GETDATE()) AS VARCHAR(10)),2) + ':00'
	) 
	THEN 1 ELSE 0 END
	AS Last_15_Min_Flag,
	CASE WHEN MAX(A.PKEY) BETWEEN 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, DATEADD(MINUTE, -30, GETDATE())) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, DATEADD(MINUTE, -30, GETDATE())) AS VARCHAR(10)),2) + ':00'
	) 
	AND 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, GETDATE()) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, GETDATE()) AS VARCHAR(10)),2) + ':00'
	) 
	THEN 1 ELSE 0 END
	AS Last_30_Min_Flag,
	CASE WHEN MAX(A.PKEY) BETWEEN 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, DATEADD(MINUTE, -60, GETDATE())) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, DATEADD(MINUTE, -60, GETDATE())) AS VARCHAR(10)),2) + ':00'
	) 
	AND 
	(
		SELECT PKEY FROM tb_TRGMDL_Time WITH (NOLOCK) WHERE TM_Description = 
		RIGHT('00' + CAST(DATEPART(HOUR, GETDATE()) AS VARCHAR(10)),2) + ':' 
		+ RIGHT('00' + CAST(DATEPART(MINUTE, GETDATE()) AS VARCHAR(10)),2) + ':00'
	) 
	THEN 1 ELSE 0 END
	AS Last_60_Min_Flag,
	CASE 
		WHEN TM_Hour BETWEEN 0 AND 5 THEN 1
		WHEN TM_Hour BETWEEN 6 AND 11 THEN 2
		WHEN TM_Hour BETWEEN 12 AND 17 THEN 3
		WHEN TM_Hour BETWEEN 18 AND 23 THEN 4
	END AS DayPart_ID,
	CASE 
		WHEN TM_Hour BETWEEN 0 AND 5 THEN 'After Midnight'
		WHEN TM_Hour BETWEEN 6 AND 11 THEN 'Morning'
		WHEN TM_Hour BETWEEN 12 AND 17 THEN 'Afternoon'
		WHEN TM_Hour BETWEEN 18 AND 23 THEN 'Evening'
	END AS DayPart_Name,
	CASE 
		WHEN TM_Hour BETWEEN 0 AND 5 THEN 'Μεσάνυχτα - Ξημέρωμα'
		WHEN TM_Hour BETWEEN 6 AND 11 THEN 'Πρωί'
		WHEN TM_Hour BETWEEN 12 AND 17 THEN 'Μεσημέρι'
		WHEN TM_Hour BETWEEN 18 AND 23 THEN 'Απογευμα - Βράδυ'
	END AS DayPart_Name_GR
FROM 
	tb_TRGMDL_Time A WITH (NOLOCK)
GROUP BY
	TM_Hour, TM_Minute
ORDER BY 1, 2





GO
/****** Object:  View [dbo].[VIEW_SAGENT_FACT_SQLAgent_History_Logs]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VIEW_SAGENT_FACT_SQLAgent_History_Logs] AS
SELECT 
	PKEY,
	Execution_PKEY,
	Job_Step_PKEY,  
	Job_ID,
	Step_ID,
	Run_Date AS Date_PKEY, 
	Run_Date_Full, 
	RIGHT('00' + CAST(DATEPART(DAY, Run_Date_Full) AS VARCHAR(10)), 2) + '/' + RIGHT('00' + CAST(DATEPART(MONTH, Run_Date_Full) AS VARCHAR(10)), 2) + ' ' +
	RIGHT('00' + CAST(DATEPART(HH, Run_Date_Full) AS VARCHAR(10)), 2) + ':' + RIGHT('00' + CAST(DATEPART(MM, Run_Date_Full) AS VARCHAR(10)) ,2)
	AS Run_Date_Full_Text_DDMMHHMI,
	RIGHT('00' + CAST(DATEPART(DAY, Run_Date_Full) AS VARCHAR(10)), 2) + '/' + RIGHT('00' + CAST(DATEPART(MONTH, Run_Date_Full) AS VARCHAR(10)), 2) + ' - ' +
	RIGHT('00' + CAST(DATEPART(HH, Run_Date_Full) AS VARCHAR(10)), 2) + ':00' +'-' + RIGHT('00' + CAST(DATEPART(HH, Run_Date_Full) AS VARCHAR(10)), 2) + ':59'
	AS Run_Date_Full_Text_DDMMHH,
	CAST(Run_Date_Full AS DATE) AS Run_Date,
	CONVERT(VARCHAR(20), Run_Date_Full, 103) AS Run_Date_Text,
	CONVERT(VARCHAR(20), Run_Date_Full, 108) AS Start_Time,
	CONVERT(VARCHAR(20), DATEADD(SECOND, Run_Duration_Seconds, Run_Date_Full), 108) AS End_Time,
	Job_Name,  
	Step_Name,  
	Step_Sorter,  
	History_Severity,  
	History_Message,  
	Run_Duration_Seconds,  
	Run_Duration_Seconds/60 AS 	Run_Duration_Minutes,
	Run_Duration_Time_Format, 
	ExecutionStatus_ID,
	Retries,
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	CASE WHEN Run_Date_Full BETWEEN DATEADD(HOUR, -24, GETDATE()) AND GETDATE() THEN 1 ELSE 0 END AS Last_24H_Run_FLAG,
	CASE WHEN ExecutionStatus_ID IN (0,3) THEN 1 ELSE 0 END AS Failed_FLAG,
	CASE WHEN ExecutionStatus_ID = 1 THEN 1 ELSE 0 END AS Succeded_FLAG
FROM tb_SYSMDL_SQLAgent_Job_History WITH (NOLOCK)












GO
/****** Object:  View [dbo].[VIEW_SAGENT_FACT_SQLAgent_History_Logs_Over_Time]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [dbo].[VIEW_SAGENT_FACT_SQLAgent_History_Logs_Over_Time] AS
SELECT 
	A.PKEY, 
	A.Execution_PKEY,
	A.Job_Step_PKEY,
	A.Date_PKEY,
	SRC.PKEY AS Time_PKEY,
	A.ExecutionStatus_ID,
	A.Run_Date_Full, 
	A.Run_Duration_Seconds,
	A.Run_Duration_Time_Format,
	LEFT(CONVERT(VARCHAR(20), Run_Date_Full, 108),5) AS Start_Time_HHMM,
	LEFT(CONVERT(VARCHAR(20), DATEADD(SECOND, Run_Duration_Seconds, Run_Date_Full), 108),5) AS End_Time_HHMM,
	A.Last_24H_Run_FLAG,
	--CASE WHEN A.Run_Date_Full BETWEEN DATEADD(MINUTE, -40, GETDATE()) AND GETDATE() THEN 1 ELSE 0 END AS Last_30_Minutes_FLAG,
	A.Succeded_FLAG,
	A.Failed_FLAG,
	A.Run_Date_Full_Text_DDMMHHMI,
	A.Run_Date_Full_Text_DDMMHH,
	1 AS Duration_Minutes
FROM 
	VIEW_SAGENT_FACT_SQLAgent_History_Logs A WITH (NOLOCK)
	INNER JOIN VIEW_DIM_Time S WITH (NOLOCK) ON DATEPART(MINUTE, Run_Date_Full) = S.TM_Minute AND DATEPART(HOUR, Run_Date_Full) = S.TM_Hour
	INNER JOIN VIEW_DIM_Time E WITH (NOLOCK) ON DATEPART(MINUTE, DATEADD(SECOND, Run_Duration_Seconds, Run_Date_Full)) = E.TM_Minute AND DATEPART(HOUR, DATEADD(SECOND, Run_Duration_Seconds, Run_Date_Full)) = E.TM_Hour
	INNER JOIN VIEW_DIM_Time SRC WITH (NOLOCK) ON SRC.PKEY BETWEEN S.PKEY AND E.PKEY











GO
/****** Object:  View [dbo].[VIEW_FACT_Transactions]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_FACT_Transactions] AS
/*
	Default for GIS FKEYS --> 1
	Default for Other FKEYS --> -1
	Default for Measures --> 0
*/
SELECT 
	TR.Transaction_PKEY, 
	ISNULL(TR.Transaction_Type_FKEY,-1) AS Transaction_Type_FKEY,
	ISNULL(TR.Transaction_Document_Type_FKEY,-1) AS Transaction_Document_Type_FKEY,
	ISNULL(TR.Order_Document_Type_FKEY,-1) AS Order_Document_Type_FKEY,
	ISNULL(TR.Company_ID,-1) AS Company_FKEY,

	ISNULL(TR.Record_Creation_Date,'20501231') AS Record_Creation_Date, 
	ISNULL(TR.Transaction_Date,'20501231') AS Transaction_Date, 
	ISNULL(TR.Order_Date,'20501231') AS Order_Date, 
	ISNULL(TR.Invoice_Date,'20501231') AS Invoice_Date, 
	ISNULL(TR.Delivery_Date,'20501231') AS Delivery_Date, 
	ISNULL(TR.Estimated_Pay_Date,'20501231') AS Estimated_Pay_Date, 
	ISNULL(TR.Actual_Pay_Date,'20501231') AS Actual_Pay_Date,

	ISNULL(TR.Record_Creation_Time,0) AS Record_Creation_Time, 
	ISNULL(TR.Transaction_Time,0) AS Transaction_Time, 
	ISNULL(TR.Order_Time,0) AS Order_Time, 
	ISNULL(TR.Delivery_Time,0) AS Delivery_Time, 

	ISNULL(TR.Transaction_Quantity,0) AS Transaction_Quantity,
	ISNULL(TR.Transaction_Quantity_2,0) AS Transaction_Quantity_2,
	ISNULL(TR.Transaction_Quantity_IN,0) AS Transaction_Quantity_IN,
	ISNULL(TR.Transaction_Quantity_OUT,0) AS Transaction_Quantity_OUT,
	ISNULL(TR.Transaction_Gross_Value,0) AS Transaction_Gross_Value,
	ISNULL(TR.Transaction_Net_Value,0) AS Transaction_Net_Value,
	ISNULL(TR.Transaction_Cost,0) AS Transaction_Cost,

/* ------------------------------------------------------------------------------- */
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Quantity,0) AS Sales_Order_Quantity,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Quantity_2,0) AS Sales_Order_Quantity_2,  
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Gross_Value_Initial,0) AS Sales_Order_Gross_Value_Initial,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Gross_Value_Final,0) AS Sales_Order_Gross_Value_Final,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_VAT_Value_Initial,0) AS Sales_Order_VAT_Value_Initial,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_VAT_Value_Final,0) AS Sales_Order_VAT_Value_Final,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Gross_Discount_Value,0) AS Sales_Order_Gross_Discount_Value,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Value_Initial,0) AS Sales_Order_Net_Value_Initial,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Value_Final,0) AS Sales_Order_Net_Value_Final,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value,0) AS Sales_Order_Net_Discount_Value,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_1,0) AS Sales_Order_Net_Discount_Value_1,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_2,0) AS Sales_Order_Net_Discount_Value_2,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_3,0) AS Sales_Order_Net_Discount_Value_3,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_4,0) AS Sales_Order_Net_Discount_Value_4,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_5,0) AS Sales_Order_Net_Discount_Value_5,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Other_Income,0) AS Sales_Order_Other_Income,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Cost,0) AS Sales_Order_Cost,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Gross_Margin,0) AS Sales_Order_Gross_Margin,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Other_Profit,0) AS Sales_Order_Other_Profit,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Sales_Total_Margin,0) AS Sales_Order_Total_Margin,

	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Quantity,0) AS Sales_Invoiced_Quantity, 
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Quantity_2,0) AS Sales_Invoiced_Quantity_2, 
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Gross_Value_Initial,0) AS Sales_Invoiced_Gross_Value_Initial,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Gross_Value_Final,0) AS Sales_Invoiced_Gross_Value_Final,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Gross_Discount_Value,0) AS Sales_Invoiced_Gross_Discount_Value,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_VAT_Value_Initial,0) AS Sales_Invoiced_VAT_Value_Initial,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_VAT_Value_Final,0) AS Sales_Invoiced_VAT_Value_Final,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Value_Initial,0) AS Sales_Invoiced_Net_Value_Initial,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Value_Final,0) AS Sales_Invoiced_Net_Value_Final,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value,0) AS Sales_Invoiced_Net_Discount_Value,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_1,0) AS Sales_Invoiced_Net_Discount_Value_1,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_2,0) AS Sales_Invoiced_Net_Discount_Value_2,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_3,0) AS Sales_Invoiced_Net_Discount_Value_3,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_4,0) AS Sales_Invoiced_Net_Discount_Value_4,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Net_Discount_Value_5,0) AS Sales_Invoiced_Net_Discount_Value_5,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Other_Income,0) AS Sales_Invoiced_Other_Income,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Cost,0) AS Sales_Invoiced_Cost,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Gross_Margin,0) AS Sales_Invoiced_Gross_Margin,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Other_Profit,0) AS Sales_Invoiced_Other_Profit,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Sales_Total_Margin,0) AS Sales_Invoiced_Total_Margin,

/* ------------------------------------------------------------------------------- */

	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Quantity,0) AS Purchase_Order_Quantity,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Quantity_2,0) AS Purchase_Order_Quantity_2,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Gross_Value_Initial,0) AS Purchase_Order_Gross_Value_Initial,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Gross_Value_Final,0) AS Purchase_Order_Gross_Value_Final,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_VAT_Value_Initial,0) AS Purchase_Order_VAT_Value_Initial,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_VAT_Value_Final,0) AS Purchase_Order_VAT_Value_Final,
	--ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Gross_Discount_Value,0) AS Purchase_Order_Gross_Discount_Value,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Value_Initial,0) AS Purchase_Order_Net_Value_Initial,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Value_Final,0) AS Purchase_Order_Net_Value_Final,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value,0) AS Purchase_Order_Net_Discount_Value,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_1,0) AS Purchase_Order_Net_Discount_Value_1,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_2,0) AS Purchase_Order_Net_Discount_Value_2,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_3,0) AS Purchase_Order_Net_Discount_Value_3,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_4,0) AS Purchase_Order_Net_Discount_Value_4,
	ISNULL(TR.Order_Flag,0) * ISNULL(TR.Order_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_5,0) AS Purchase_Order_Net_Discount_Value_5,

	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Quantity,0) AS Purchase_Invoiced_Quantity,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Quantity_2,0) AS Purchase_Invoiced_Quantity_2,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Gross_Value_Initial,0) AS Purchase_Invoice_Gross_Value_Initial,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Gross_Value_Final,0) AS Purchase_Invoice_Gross_Value_Final,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_VAT_Value_Initial,0) AS Purchase_Invoice_VAT_Value_Initial,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_VAT_Value_Final,0) AS Purchase_Invoice_VAT_Value_Final,
	--ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Gross_Discount_Value,0) AS Purchase_Invoice_Gross_Discount_Value,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Value_Initial,0) AS Purchase_Invoiced_Net_Value_Initial,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Value_Final,0) AS Purchase_Invoiced_Net_Value_Final,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value,0) AS Purchase_Invoiced_Net_Discount_Value,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_1,0) AS Purchase_Invoiced_Net_Discount_Value_1,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_2,0) AS Purchase_Invoiced_Net_Discount_Value_2,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_3,0) AS Purchase_Invoiced_Net_Discount_Value_3,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_4,0) AS Purchase_Invoiced_Net_Discount_Value_4,
	ISNULL(TR.Invoice_Flag,0) * ISNULL(TR.Invoice_SignFactor,0) * ISNULL(TR.Purchase_Net_Discount_Value_5,0) AS Purchase_Invoiced_Net_Discount_Value_5,

/* ------------------------------------------------------------------------------- */

	ISNULL(TR.Product_FKEY,-1) AS Product_FKEY,
	ISNULL(TR.Master_Product_FKEY,-1) AS Master_Product_FKEY,
	ISNULL(TR.Parent_Product_FKEY,-1) AS Parent_Product_FKEY,
	ISNULL(TR.Bundle_Product_FKEY,-1) AS Bundle_Product_FKEY,
	ISNULL(TR.Replacement_Product_FKEY,-1) AS Replacement_Product_FKEY,

	ISNULL(TR.Salesperson_FKEY,-1) AS Salesperson_FKEY,
	ISNULL(TR.Cashier_FKEY,-1) AS Cashier_FKEY,
	ISNULL(TR.Customer_FKEY,-1) AS Customer_FKEY,
	ISNULL(TR.Parent_Customer_FKEY,-1) AS Parent_Customer_FKEY,
	ISNULL(TR.Supplier_FKEY,-1) AS Supplier_FKEY,
	ISNULL(TR.Channel_FKEY,-1) AS Channel_FKEY,

	ISNULL(TR.Transaction_Warehouse_FKEY,-1) AS Transaction_Warehouse_FKEY,
	ISNULL(TR.Order_Warehouse_FKEY,-1) AS Order_Warehouse_FKEY,
	ISNULL(TR.Invoice_Warehouse_FKEY,-1) AS Invoice_Warehouse_FKEY,

	ISNULL(TR.Transaction_Branch_FKEY,-1) AS Transaction_Branch_FKEY,
	ISNULL(TR.Order_Branch_FKEY,-1) AS Order_Branch_FKEY,
	ISNULL(TR.Invoice_Branch_FKEY,-1) AS Invoice_Branch_FKEY,
	ISNULL(TR.Branch_OUT_FKEY,-1) AS Branch_OUT_FKEY,
	ISNULL(TR.Branch_IN_FKEY,-1) AS Branch_IN_FKEY,

	ISNULL(TR.Customer_GIS_FKEY,1) AS Customer_GIS_FKEY,
	ISNULL(TR.Delivery_GIS_FKEY,1) AS Delivery_GIS_FKEY,
	ISNULL(TR.Supplier_GIS_FKEY,1) AS Supplier_GIS_FKEY,

	ISNULL(TR.Transaction_Branch_GIS_FKEY,1) AS Transaction_Branch_GIS_FKEY,
	ISNULL(TR.Order_Branch_GIS_FKEY,1) AS Order_Branch_GIS_FKEY,
	ISNULL(TR.Invoice_Branch_GIS_FKEY,1) AS Invoice_Branch_GIS_FKEY,
	ISNULL(TR.Branch_OUT_GIS_FKEY,1) AS Branch_OUT_GIS_FKEY,
	ISNULL(TR.Branch_IN_GIS_FKEY,1) AS Branch_IN_GIS_FKEY,

	ISNULL(TR.Form_of_Payment_FKEY,-1) AS Form_of_Payment_FKEY,
	ISNULL(TR.Basket_Gross_Value,0) AS Basket_Gross_Value,
	ISNULL(TR.Basket_Net_Value,0) AS Basket_Net_Value,
	ISNULL(TR.Basket_Discount_Value,0) AS Basket_Discount_Value,
	
	ISNULL(TR.Transaction_Document_No,'N/A') AS Transaction_Document_No,
	ISNULL(TR.Order_Document_No,'N/A') AS Order_Document_No

FROM tb_TRGMDL_Transactions TR WITH (NOLOCK)












GO
/****** Object:  View [dbo].[VIEWPRT_FACT_Transactions_PR01]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[VIEWPRT_FACT_Transactions_PR01] AS
SELECT * FROM VIEW_FACT_Transactions TR WITH (NOLOCK)
WHERE TR.Transaction_Date BETWEEN 20000101 AND 20501231

GO
/****** Object:  View [dbo].[VIEW_SRC_Customers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VIEW_SRC_Customers] AS
SELECT 
	ISNULL(CAST((REPLACE(SS.PersonID,'-','')) AS BIGINT), -1) AS Customer_ID,
	1 AS Company_ID,
	ISNULL(SS.PersonID, '-1') AS Customer_Code,
	'-1' AS Customer_Alt_Code,
	-1 AS Customer_Parent_ID,
	ISNULL(SS.Name, 'N/A') AS Customer_FullName,
	'N/A' AS Customer_FirstName,
	'N/A' AS Customer_LastName,

	'20501231' AS Customer_BirthDate,
	0 AS Customer_Age,
	-1 AS Customer_Category_Code,
	-1 AS Customer_SubCategory_Code,
	-1 AS Customer_Group_Code,
	'N/A' AS Customer_Category,
	'N/A' AS Customer_SubCategory,
	'N/A' AS Customer_Group,
	'N/A' AS Customer_Segment,
	ISNULL(TT.Descr,'N/A') AS Customer_Type,
	-1 AS Customer_RFM,
	1 AS Is_Active_Flag,
	'N/A' AS Fav_Form_of_Payment,
	'N/A' AS Fav_Delivery_Method,
	-1 AS Fav_Branch_ID,
	255 AS Has_DebitCard_Flag,
	255 AS Has_CreditCard_Flag,
	'N/A' AS Customer_Job,
	ISNULL(SS.AFM, 'N/A') AS Tax_ID,
	ISNULL(SS.DoyID, 'N/A') AS Tax_Office,
	ISNULL(SS.Acode, 'N/A') AS Account,
	ISNULL(IIF(Address1 IS NULL, 'N/A', Address1 + IIF(SS.Address2 IS NULL,'',', ') + ISNULL(SS.Address2,'')),'N/A') AS Primary_Address,
	'N/A' AS Primary_Address_No,
	'N/A' AS Secondary_Address,
	'N/A' AS Secondary_Address_No,
	'N/A' AS Other_Address,
	'N/A' AS Other_Address_No,

	ISNULL(GI.Post_Code,'00000') AS Primary_Post_Code,
	'N/A' AS Secondary_Post_Code,
	'N/A' AS Other_Post_Code,

	ISNULL(GI.PKEY,1) AS Primary_GIS_FKEY,
	1 AS Secondary_GIS_FKEY,
	1 AS Other_GIS_FKEY,

	'N/A' AS District,
	ISNULL(SS.City,'N/A') AS City,
	-1 AS Primary_Latitude,
	-1 AS Primary_Longtitude,
	'N/A' AS Mobile_Phone,
	'N/A' AS Mobile_Phone_2,
	ISNULL(SS.Telephone1, 'N/A') AS Phone_1,
	ISNULL(SS.Telephone2, 'N/A') AS Phone_2,
	ISNULL(SS.Email, 'N/A') AS Email,
	'N/A' AS Email_2,
	ISNULL(SS.Fax, 'N/A') AS Fax,
	ISNULL(SS.WebSite,'N/A') AS Internet_Site,
	ISNULL(SS.Cmmnt, 'N/A') AS Comments,
	'N/A' AS Segmentation1_Class_Value,
	'N/A' AS Segmentation1_Class_Description,
	'N/A' AS Segmentation2_Class_Value,
	'N/A' AS Segmentation2_Class_Description,
	'N/A' AS Segmentation3_Class_Value,
	'N/A' AS Segmentation3_Class_Description,
	-1 AS Customer_Hierarchy_Level1_Code,
	'N/A' AS Customer_Hierarchy_Level1_Name,
	-1 AS Customer_Hierarchy_Level2_Code,
	'N/A' AS Customer_Hierarchy_Level2_Name,
	-1 AS Customer_Hierarchy_Level3_Code,
	'N/A' AS Customer_Hierarchy_Level3_Name,
	'N/A' AS Custom_Value_1,
	'N/A' AS Custom_Description_1,
	'N/A' AS Custom_Value_2,
	'N/A' AS Custom_Description_2,
	'N/A' AS Custom_Value_3,
	'N/A' AS Custom_Description_3,
	'N/A' AS Custom_Value_4,
	'N/A' AS Custom_Description_4,
	'N/A' AS Custom_Value_5,
	'N/A' AS Custom_Description_5
FROM
	AINOS.clroot.Client AS SS WITH(NOLOCK)
	LEFT OUTER JOIN AINOS.clroot.CompType AS TT WITH(NOLOCK) ON SS.CmpTypeID=TT.ID  
	LEFT OUTER JOIN Targit_Model.dbo.tb_TRGMDL_Geographical_Info GI WITH(NOLOCK) ON  
	CASE WHEN SS.ZipCode NOT LIKE '%[0-9]%' OR SS.ZipCode LIKE '%[Α-Ω]%' OR SS.ZipCode LIKE '%[α-ω]%' OR SS.ZipCode LIKE '%`%' THEN '00000' ELSE ISNULL(REPLACE (SS.ZipCode,' ',''),'00000') END COLLATE Greek_CI_AS = GI.Post_Code












GO
/****** Object:  View [dbo].[VIEW_SRC_Document_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VIEW_SRC_Document_Types] AS
SELECT 
	DTID.Document_Type_ID AS Document_Type_ID,
	1 AS Company_ID,
	ISNULL(DT.Code, '-1') AS Document_Type_Code,
	'-1' AS Document_Type_Alt_Code,
	ISNULL(DT.Title, 'N/A') AS Document_Type_Description,
	0 AS Document_Type_SignFactor,
	0 AS Document_Type_Order_Flag,
	0 AS Document_Type_Invoice_Flag,
	0 AS Document_Type_Order_SignFactor,
	0 AS Document_Type_Invoice_SignFactor
FROM
	[AINOS].[clroot].[SKDocSeries] AS DT WITH (NOLOCK)
	LEFT JOIN [Targit_Model_Empty].[dbo].[temp_tb_TRGMDL_Document_Types] AS DTID WITH (NOLOCK)
	ON DT.Code COLLATE Greek_CI_AS = DTID.Document_Type_Code COLLATE Greek_CI_AS




GO
/****** Object:  View [dbo].[VIEW_SRC_Products]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[VIEW_SRC_Products] AS
SELECT 
	ISNULL(CAST((REPLACE(MM.CODE,'-','')) AS BIGINT), -1) AS Product_ID,
    1 AS Company_ID,
    ISNULL(MM.CODE, '-1') AS Product_Code,
    ISNULL(MM.AltCode, '-1') AS Product_Alt_Code,
	-1 AS Product_Parent_ID,
	-1 AS Product_Master_ID,
	-1 AS Product_Replacement_ID,
	-1 AS Product_Bundle_ID,
	ISNULL(MM.Description, 'N/A') AS Product_Name_EL,
	'N/A' AS Product_Name_EN,
	ISNULL(MM.BarCode, 'N/A') AS Barcode,
	'N/A' AS EAN,
	ISNULL(MM.MatType, 'N/A') AS Product_Type,
	ISNULL(MM.MatStatus, 'N/A') AS Product_Status,
	ISNULL(MM.CategID, -1) AS Product_Category_Code,
	'N/A' AS Product_Category_Description,
	-1 AS Product_SubCategory_Code,
	'N/A' AS Product_SubCategory_Description,
	-1 AS Product_Group_Code,
	'N/A' AS Product_Group_Description,
	-1 AS Product_Hierarchy_Level_1_Code,
	'N/A' AS Product_Hierarchy_Level_1_Name,
	-1 AS Product_Hierarchy_Level_2_Code,
	'N/A' AS Product_Hierarchy_Level_2_Name,
	-1 AS Product_Hierarchy_Level_3_Code,
	'N/A' AS Product_Hierarchy_Level_3_Name,
	-1 AS Product_Hierarchy_Level_4_Code,
	'N/A' AS Product_Hierarchy_Level_4_Name,
	-1 AS Product_Hierarchy_Level_5_Code,
	'N/A' AS Product_Hierarchy_Level_5_Name,
	ISNULL(AA.ID, -1) AS Product_Hierarchy2_Level_1_Code,
	ISNULL(AA.Descr, 'N/A') AS Product_Hierarchy2_Level_1_Name,
	ISNULL(AB.ID, -1) AS Product_Hierarchy2_Level_2_Code,
	ISNULL(AB.Descr, 'N/A') AS Product_Hierarchy2_Level_2_Name,
	ISNULL(AC.ID, -1) AS Product_Hierarchy2_Level_3_Code,
	ISNULL(AC.Descr, 'N/A') AS Product_Hierarchy2_Level_3_Name,
	ISNULL(AD.ID, -1) AS Product_Hierarchy2_Level_4_Code,
	ISNULL(AD.Descr, 'N/A') AS Product_Hierarchy2_Level_4_Name,
	-1 AS Product_Hierarchy2_Level_5_Code,
	'N/A' AS Product_Hierarchy2_Level_5_Name,
	-1 AS Product_Hierarchy2_Level_6_Code,
	'N/A' AS Product_Hierarchy2_Level_6_Name,
	-1 AS Product_Hierarchy2_Level_7_Code,
	'N/A' AS Product_Hierarchy2_Level_7_Name,
	-1 AS Product_Hierarchy2_Level_8_Code,
	'N/A' AS Product_Hierarchy2_Level_8_Name,
	-1 AS Product_Hierarchy2_Level_9_Code,
	'N/A' AS Product_Hierarchy2_Level_9_Name,
	'-1' AS Product_Hierarchy2_Level_10_Code,
	'N/A' AS Product_Hierarchy2_Level_10_Name,
	'N/A' AS Basic_Supplier,
	'N/A' AS Supplier_Product_Code,
	'N/A' AS Supplier_Description,
	'N/A' AS Manufacture_Country,
	'N/A' AS Origin_Country,
	'N/A' AS Manufacturer,
	'N/A' AS Product_Brand,
	'N/A' AS Product_Model,
	ISNULL(CAST(MM.StockChr AS VARCHAR(20)), 'N/A') AS Stock_Method,
	'N/A' AS Cost_Method,
	'N/A' AS TaxClass,
	'N/A' AS Product_Life_Cycle_State,
	'N/A' AS Measurement_Unit,
	0 AS Volume,
	0 AS Net_Weight,
	0 AS Gross_Weight,
	0 AS Current_Stock_Quantity,
	0 AS Current_Discount,
	0 AS Current_Discount_PCT,
	CAST(ISNULL(MM.[RMStdCost],0) AS NUMERIC(18,4)) AS Current_Cost,
	0 AS Current_Ticket_Price,
	0 AS Current_Retail_Price,
	0 AS Current_Wholesale_Price,
	CAST(ISNULL(MM.[LastPurchPr],0) AS NUMERIC(15,2)) AS Current_Purchase_Price,
	0 AS Is_Active_Flag,
	0 AS Spare_Flag1,
	'N/A' AS Spare_Flag1_Name,
	0 AS Spare_Flag2,
	'N/A' AS Spare_Flag2_Name,
	0   AS Spare_Flag3,
	'N/A' AS Spare_Flag3_Name,
	'N/A' AS Custom_Value_1,
	'N/A' AS Custom_Description_1,
	'N/A' AS Custom_Value_2,
	'N/A' AS Custom_Description_2,
	'N/A' AS Custom_Value_3,
	'N/A' AS Custom_Description_3,
	'N/A' AS Custom_Value_4,
	'N/A' AS Custom_Description_4,
	'N/A' AS Custom_Value_5,
	'N/A' AS Custom_Description_5
FROM
	AINOS.clroot.MATERIAL AS MM WITH(NOLOCK)
	LEFT JOIN  [AINOS].[clroot].[Ctgry1] AS AA WITH(NOLOCK) ON MM.Ctgry1=AA.ID
	LEFT JOIN  [AINOS].[clroot].[Ctgry2] AS AB WITH(NOLOCK) ON MM.Ctgry2=AB.ID
	LEFT JOIN  [AINOS].[clroot].[Ctgry3] AS AC WITH(NOLOCK) ON MM.Ctgry3=AC.ID
	LEFT JOIN  [AINOS].[clroot].[Ctgry4] AS AD WITH(NOLOCK) ON MM.Ctgry4=AD.ID















GO
/****** Object:  View [dbo].[VIEW_SRC_Sales]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[VIEW_SRC_Sales] AS
SELECT
	1 AS Company_ID,
	1 AS Transaction_Type_FKEY,
	ISNULL(DT.Document_Type_ID, -1) AS Transaction_Document_Type_FKEY,
	-1 AS Order_Document_Type_FKEY,
	ISNULL(PR.Product_ID, -1) AS Product_FKEY,
	-1 AS Master_Product_FKEY,
	-1 AS Parent_Product_FKEY,
	-1 AS Replacement_Product_FKEY,
	-1 AS Bundle_Product_FKEY,
	ISNULL(SAL.SalesmanAA, -1) AS Salesperson_FKEY,
	-1 AS Cashier_FKEY,
	ISNULL(CU.Customer_ID, -1) AS Customer_FKEY,
	-1 AS Parent_Customer_FKEY,
	-1 AS Supplier_FKEY,
	ISNULL(DOC.WareHouseAA, -1) AS Transaction_Warehouse_FKEY,
	-1 AS Order_Warehouse_FKEY,
	-1 AS Invoice_Warehouse_FKEY,
	-1 AS Transaction_Branch_FKEY,
	-1 AS Order_Branch_FKEY,
	-1 AS Invoice_Branch_FKEY,
	-1 AS Branch_OUT_FKEY,
	-1 AS Branch_IN_FKEY,
	-1 AS Channel_FKEY,
	-1 AS Form_of_Payment_FKEY,
	1 AS Delivery_GIS_FKEY,
	ISNULL(CU.Primary_GIS_FKEY, 1) AS Customer_GIS_FKEY,
	1 AS Supplier_GIS_FKEY,
	1 AS Transaction_Branch_GIS_FKEY,
	1 AS Order_Branch_GIS_FKEY,
	1 AS Invoice_Branch_GIS_FKEY,
	1 AS Branch_OUT_GIS_FKEY,
	1 AS Branch_IN_GIS_FKEY,
	1 AS Order_Flag,
	1 AS Invoice_Flag,
	1 AS Order_SignFactor,
	1 AS Invoice_SignFactor,
	ISNULL(DOC.[ID], 'N/A') AS Transaction_Document_No,
	'N/A' AS Order_Document_No,
	0 AS Basket_Gross_Value,
	0 AS Basket_Net_Value,
	0 AS Basket_Discount_Value,
	20500101 AS Record_Creation_Date,
	ISNULL(CAST(CONVERT(VARCHAR(20), DOC.Date1, 112) AS INT), 20500101) AS Transaction_Date,
	20500101 AS Order_Date,
	20500101 AS Invoice_Date,
	ISNULL(CAST(CONVERT(VARCHAR(20), SAL.DelivDate, 112) AS INT), 20500101) AS Delivery_Date,
	20500101 AS Estimated_Pay_Date,
	20500101 AS Actual_Pay_Date,
	0 AS Record_Creation_Time,
	ISNULL(CONVERT(INT, REPLACE(CONVERT(VARCHAR(8), DOC.Date1, 108),':','')), 0) AS Transaction_Time,
	0 AS Order_Time,
	ISNULL(CONVERT(INT, REPLACE(CONVERT(VARCHAR(8), SAL.DelivDate, 108),':','')), 0) AS Delivery_Time,
	0 AS Transaction_Quantity,
	0 AS Transaction_Quantity_2,
	0 AS Transaction_Quantity_IN,
	0 AS Transaction_Quantity_OUT,
	0 AS Transaction_Gross_Value,
	0 AS Transaction_Net_Value,
	0 AS Transaction_Cost,
	ISNULL(CAST(ROUND(SAL.Quantity,0) AS NUMERIC(18,4)), 0) AS Sales_Quantity,
	0 AS Sales_Quantity_2,
	0 AS Sales_Gross_Value_Initial,
	ISNULL(CAST(SAL.TotalValue AS NUMERIC(18,4)), 0) AS Sales_Gross_Value_Final,
	0 AS Sales_VAT_Value_Initial,
	ISNULL(CAST(SAL.VATValue AS NUMERIC(18,4)), 0) AS Sales_VAT_Value_Final,
	0 AS Sales_Gross_Discount_Value,
	0 AS Sales_Net_Value_Initial,
	ISNULL(CAST(SAL.NetValue AS NUMERIC(18,4)), 0) AS Sales_Net_Value_Final,
	ISNULL(CAST(SAL.DiscVal AS NUMERIC(18,4)), 0) AS Sales_Net_Discount_Value,
	0 AS Sales_Net_Discount_Value_1,
	0 AS Sales_Net_Discount_Value_2,
	0 AS Sales_Net_Discount_Value_3,
	0 AS Sales_Net_Discount_Value_4,
	0 AS Sales_Net_Discount_Value_5,
	0 AS Sales_Other_Income,
	0 AS Sales_Cost,
	0 AS Sales_Gross_Margin,
	0 AS Sales_Other_Profit,
	0 AS Sales_Total_Margin,
	0 AS Purchase_Quantity,
	0 AS Purchase_Quantity_2,
	0 AS Purchase_Gross_Value_Initial,
	0 AS Purchase_Gross_Value_Final,
	0 AS Purchase_VAT_Value_Initial,
	0 AS Purchase_VAT_Value_Final,
	0 AS Purchase_Net_Value_Initial,
	0 AS Purchase_Net_Value_Final,
	0 AS Purchase_Net_Discount_Value,
	0 AS Purchase_Net_Discount_Value_1,
	0 AS Purchase_Net_Discount_Value_2,
	0 AS Purchase_Net_Discount_Value_3,
	0 AS Purchase_Net_Discount_Value_4,
	0 AS Purchase_Net_Discount_Value_5,
	0 AS Cash_PCT,
	0 AS DebitCard_PCT,
	0 AS CreditCard_PCT,
	0 AS BankLoan_PCT,
	0 AS PaymentDelay_1m_PCT,
	0 AS PaymentDelay_2m_PCT,
	0 AS PaymentDelay_3m_PCT,
	0 AS PaymentDelay_6m_PCT,
	0 AS PaymentDelay_9m_PCT
FROM AINOS.clroot.LItmSale AS SAL WITH(NOLOCK)
INNER JOIN AINOS.clroot.DocHdSal AS DOC WITH(NOLOCK) 
	ON SAL.DocumentAA = DOC.AA
LEFT JOIN Targit_Model_Empty.dbo.VIEW_SRC_Document_Types AS DT WITH(NOLOCK) 
	ON DOC.SeriesCode = DT.Document_Type_Code
LEFT JOIN Targit_Model_Empty.dbo.VIEW_SRC_Customers AS CU WITH(NOLOCK) 
	ON DOC.PersonID = CU.Customer_Code
LEFT JOIN Targit_Model_Empty.dbo.VIEW_SRC_Products AS PR WITH(NOLOCK) 
	ON SAL.LinkID = PR.Product_Code










GO
/****** Object:  View [dbo].[VIEW_SRC_Suppliers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VIEW_SRC_Suppliers] AS
SELECT 
	ISNULL(CAST((REPLACE(SS.PersonID,'-','')) AS BIGINT), -1) AS Supplier_ID,
	1 AS Company_ID,
	ISNULL(SS.PersonID, '-1') AS Supplier_Code,
	'-1' AS Supplier_Alt_Code,
	-1 AS Supplier_Parent_ID,
	ISNULL(SS.Name, 'N/A') AS Supplier_FullName,
	'N/A' AS Supplier_FirstName,
	'N/A' AS Supplier_LastName,

	'20501231' AS Supplier_BirthDate,
	0 AS Supplier_Age,
	-1 AS Supplier_Category_Code,
	-1 AS Supplier_SubCategory_Code,
	-1 AS Supplier_Group_Code,
	'N/A' AS Supplier_Category,
	'N/A' AS Supplier_SubCategory,
	'N/A' AS Supplier_Group,
	'N/A' AS Supplier_Segment,
	ISNULL(TT.Descr,'N/A') AS Supplier_Type,
	-1 AS Supplier_RFM,
	1 AS Is_Active_Flag,
	'N/A' AS Fav_Form_of_Payment,
	'N/A' AS Fav_Delivery_Method,
	-1 AS Fav_Branch_ID,
	255 AS Has_DebitCard_Flag,
	255 AS Has_CreditCard_Flag,
	'N/A' AS Supplier_Job,
	ISNULL(SS.AFM, 'N/A') AS Tax_ID,
	ISNULL(SS.DoyID, 'N/A') AS Tax_Office,
	ISNULL(SS.Acode, 'N/A') AS Account,
	ISNULL(IIF(Address1 IS NULL, 'N/A', Address1 + IIF(SS.Address2 IS NULL,'',', ') + ISNULL(SS.Address2,'')),'N/A') AS Primary_Address,
	'N/A' AS Primary_Address_No,
	'N/A' AS Secondary_Address,
	'N/A' AS Secondary_Address_No,
	'N/A' AS Other_Address,
	'N/A' AS Other_Address_No,

	ISNULL(GI.Post_Code,'00000') AS Primary_Post_Code,
	'N/A' AS Secondary_Post_Code,
	'N/A' AS Other_Post_Code,

	ISNULL(GI.PKEY,1) AS Primary_GIS_FKEY,
	1 AS Secondary_GIS_FKEY,
	1 AS Other_GIS_FKEY,

	'N/A' AS District,
	ISNULL(SS.City,'N/A') AS City,
	-1 AS Primary_Latitude,
	-1 AS Primary_Longtitude,
	'N/A' AS Mobile_Phone,
	'N/A' AS Mobile_Phone_2,
	ISNULL(SS.Telephone1, 'N/A') AS Phone_1,
	ISNULL(SS.Telephone2, 'N/A') AS Phone_2,
	ISNULL(SS.Email, 'N/A') AS Email,
	'N/A' AS Email_2,
	ISNULL(SS.Fax, 'N/A') AS Fax,
	ISNULL(SS.WebSite,'N/A') AS Internet_Site,
	ISNULL(SS.Cmmnt, 'N/A') AS Comments,
	'N/A' AS Segmentation1_Class_Value,
	'N/A' AS Segmentation1_Class_Description,
	'N/A' AS Segmentation2_Class_Value,
	'N/A' AS Segmentation2_Class_Description,
	'N/A' AS Segmentation3_Class_Value,
	'N/A' AS Segmentation3_Class_Description,
	-1 AS Supplier_Hierarchy_Level1_Code,
	'N/A' AS Supplier_Hierarchy_Level1_Name,
	-1 AS Supplier_Hierarchy_Level2_Code,
	'N/A' AS Supplier_Hierarchy_Level2_Name,
	-1 AS Supplier_Hierarchy_Level3_Code,
	'N/A' AS Supplier_Hierarchy_Level3_Name,
	'N/A' AS Custom_Value_1,
	'N/A' AS Custom_Description_1,
	'N/A' AS Custom_Value_2,
	'N/A' AS Custom_Description_2,
	'N/A' AS Custom_Value_3,
	'N/A' AS Custom_Description_3,
	'N/A' AS Custom_Value_4,
	'N/A' AS Custom_Description_4,
	'N/A' AS Custom_Value_5,
	'N/A' AS Custom_Description_5
FROM
	AINOS.clroot.Supplier AS SS WITH(NOLOCK)
	LEFT OUTER JOIN AINOS.clroot.CompType AS TT WITH(NOLOCK) ON SS.CmpTypeID=TT.ID  
	LEFT OUTER JOIN Targit_Model.dbo.tb_TRGMDL_Geographical_Info GI WITH(NOLOCK) ON  
	CASE WHEN SS.ZipCode NOT LIKE '%[0-9]%' OR SS.ZipCode LIKE '%[Α-Ω]%' OR SS.ZipCode LIKE '%[α-ω]%' OR SS.ZipCode LIKE '%`%' THEN '00000' ELSE ISNULL(REPLACE (SS.ZipCode,' ',''),'00000') END COLLATE Greek_CI_AS = GI.Post_Code












GO
/****** Object:  View [dbo].[VIEW_SRC_Purchases]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[VIEW_SRC_Purchases] AS
SELECT
	1 AS Company_ID,
	2 AS Transaction_Type_FKEY,
	ISNULL(DT.Document_Type_ID, -1) AS Transaction_Document_Type_FKEY,
	-1 AS Order_Document_Type_FKEY,
	ISNULL(PR.Product_ID, -1) AS Product_FKEY,
	-1 AS Master_Product_FKEY,
	-1 AS Parent_Product_FKEY,
	-1 AS Replacement_Product_FKEY,
	-1 AS Bundle_Product_FKEY,
	-1 AS Salesperson_FKEY,
	-1 AS Cashier_FKEY,
	-1 AS Customer_FKEY,
	-1 AS Parent_Customer_FKEY,
	ISNULL(SP.Supplier_ID, -1) AS Supplier_FKEY,
	ISNULL(DOC.WareHouseAA, -1) AS Transaction_Warehouse_FKEY,
	-1 AS Order_Warehouse_FKEY,
	-1 AS Invoice_Warehouse_FKEY,
	-1 AS Transaction_Branch_FKEY,
	-1 AS Order_Branch_FKEY,
	-1 AS Invoice_Branch_FKEY,
	-1 AS Branch_OUT_FKEY,
	-1 AS Branch_IN_FKEY,
	-1 AS Channel_FKEY,
	-1 AS Form_of_Payment_FKEY,
	1 AS Delivery_GIS_FKEY,
	1 AS Customer_GIS_FKEY,
	ISNULL(SP.Primary_GIS_FKEY, 1) AS Supplier_GIS_FKEY,
	1 AS Transaction_Branch_GIS_FKEY,
	1 AS Order_Branch_GIS_FKEY,
	1 AS Invoice_Branch_GIS_FKEY,
	1 AS Branch_OUT_GIS_FKEY,
	1 AS Branch_IN_GIS_FKEY,
	1 AS Order_Flag,
	1 AS Invoice_Flag,
	1 AS Order_SignFactor,
	1 AS Invoice_SignFactor,
	ISNULL(DOC.[ID], 'N/A') AS Transaction_Document_No,
	'N/A' AS Order_Document_No,
	0 AS Basket_Gross_Value,
	0 AS Basket_Net_Value,
	0 AS Basket_Discount_Value,
	20500101 AS Record_Creation_Date,
	ISNULL(CAST(CONVERT(VARCHAR(20), DOC.Date1, 112) AS INT), 20500101) AS Transaction_Date,
	20500101 AS Order_Date,
	20500101 AS Invoice_Date,
	ISNULL(CAST(CONVERT(VARCHAR(20), PUR.DelivDate, 112) AS INT), 20500101) AS Delivery_Date,
	20500101 AS Estimated_Pay_Date,
	20500101 AS Actual_Pay_Date,
	0 AS Record_Creation_Time,
	ISNULL(CONVERT(INT, REPLACE(CONVERT(VARCHAR(8), DOC.Date1, 108),':','')), 0) AS Transaction_Time,
	0 AS Order_Time,
	ISNULL(CONVERT(INT, REPLACE(CONVERT(VARCHAR(8), PUR.DelivDate, 108),':','')), 0) AS Delivery_Time,
	0 AS Transaction_Quantity,
	0 AS Transaction_Quantity_2,
	0 AS Transaction_Quantity_IN,
	0 AS Transaction_Quantity_OUT,
	0 AS Transaction_Gross_Value,
	0 AS Transaction_Net_Value,
	0 AS Transaction_Cost,
	0 AS Sales_Quantity,
	0 AS Sales_Quantity_2,
	0 AS Sales_Gross_Value_Initial,
	0 AS Sales_Gross_Value_Final,
	0 AS Sales_VAT_Value_Initial,
	0 AS Sales_VAT_Value_Final,
	0 AS Sales_Gross_Discount_Value,
	0 AS Sales_Net_Value_Initial,
	0 AS Sales_Net_Value_Final,
	0 AS Sales_Net_Discount_Value,
	0 AS Sales_Net_Discount_Value_1,
	0 AS Sales_Net_Discount_Value_2,
	0 AS Sales_Net_Discount_Value_3,
	0 AS Sales_Net_Discount_Value_4,
	0 AS Sales_Net_Discount_Value_5,
	0 AS Sales_Other_Income,
	0 AS Sales_Cost,
	0 AS Sales_Gross_Margin,
	0 AS Sales_Other_Profit,
	0 AS Sales_Total_Margin,
	ISNULL(CAST(ROUND(PUR.Quantity,0) AS NUMERIC(18,4)), 0) AS Purchase_Quantity,
	0 AS Purchase_Quantity_2,
	0 AS Purchase_Gross_Value_Initial,
	ISNULL(CAST(PUR.TotalValue AS NUMERIC(18,4)), 0) AS Purchase_Gross_Value_Final,
	0 AS Purchase_VAT_Value_Initial,
	ISNULL(CAST(PUR.VATValue AS NUMERIC(18,4)), 0) AS Purchase_VAT_Value_Final,
	0 AS Purchase_Net_Value_Initial,
	ISNULL(CAST(PUR.NetValue AS NUMERIC(18,4)), 0) AS Purchase_Net_Value_Final,
	ISNULL(CAST(PUR.DiscVal AS NUMERIC(18,4)), 0) AS Purchase_Net_Discount_Value,
	0 AS Purchase_Net_Discount_Value_1,
	0 AS Purchase_Net_Discount_Value_2,
	0 AS Purchase_Net_Discount_Value_3,
	0 AS Purchase_Net_Discount_Value_4,
	0 AS Purchase_Net_Discount_Value_5,
	0 AS Cash_PCT,
	0 AS DebitCard_PCT,
	0 AS CreditCard_PCT,
	0 AS BankLoan_PCT,
	0 AS PaymentDelay_1m_PCT,
	0 AS PaymentDelay_2m_PCT,
	0 AS PaymentDelay_3m_PCT,
	0 AS PaymentDelay_6m_PCT,
	0 AS PaymentDelay_9m_PCT
FROM AINOS.clroot.LItmPurc AS PUR WITH(NOLOCK)
INNER JOIN AINOS.clroot.DocHdPur AS DOC WITH(NOLOCK)
	ON PUR.DocumentAA = DOC.AA
LEFT JOIN Targit_Model_Empty.dbo.VIEW_SRC_Document_Types AS DT WITH(NOLOCK) 
	ON DOC.SeriesCode = DT.Document_Type_Code
LEFT JOIN Targit_Model_Empty.dbo.VIEW_SRC_Suppliers AS SP WITH(NOLOCK) 
	ON DOC.PersonID = SP.Supplier_Code
LEFT JOIN Targit_Model_Empty.dbo.VIEW_SRC_Products AS PR WITH(NOLOCK) 
	ON PUR.LinkID = PR.Product_Code



















GO
/****** Object:  View [dbo].[VIEW_DEF_Branches]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VIEW_DEF_Branches] AS
SELECT  
	-1 AS Branch_ID,
	CMP.Company_ID AS Company_ID,
	ISNULL(SourceFieldName, '-1') AS Branch_Code,
	ISNULL(SourceFieldName, '-1') AS Branch_Alt_Code,
	ISNULL(SourceFieldName, -1) AS Branch_Parent_ID,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Name,
	
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
	ISNULL(SourceFieldName, 255) AS Is_Active_Flag,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_5,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_5
FROM
	tb_Dummy_DEF WITH (NOLOCK),
	tb_TRGMDL_Companies CMP WITH (NOLOCK)








GO
/****** Object:  View [dbo].[VIEW_DEF_Companies]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DEF_Companies] AS
SELECT  
	-1 AS Company_ID,
	ISNULL(SourceFieldName, '-1') AS Company_Code,
	ISNULL(SourceFieldName, '-1') AS Company_Alt_Code,
	ISNULL(SourceFieldName, 'N/A') AS Company_Description_EL,
	ISNULL(SourceFieldName, 'N/A') AS Company_Description_EN,
	ISNULL(SourceFieldName, -1) AS Targit_Customer_ID,
	ISNULL(SourceFieldName, 'Default') AS Targit_Customer_Name,
	ISNULL(SourceFieldName, 'N/A') AS Company_Type,
	ISNULL(SourceFieldName, -1) AS Parent_Company_Code,
	ISNULL(SourceFieldName, 'N/A') AS Parent_Company_Name,
	ISNULL(SourceFieldName, -1) AS Company_Group_ID,
	ISNULL(SourceFieldName, 'N/A') AS Company_Group_Name,
	ISNULL(SourceFieldName, 'N/A') AS Tax_ID,
	ISNULL(SourceFieldName, 'N/A') AS Tax_Office,
	ISNULL(SourceFieldName, 'N/A') AS ARMAE,
	ISNULL(SourceFieldName, 'N/A') AS Company_Address,
	ISNULL(SourceFieldName, 'N/A') AS Company_Address_No,
	ISNULL(SourceFieldName, 'N/A') AS Company_Post_Code,
	ISNULL(SourceFieldName, 'N/A') AS District,
	ISNULL(SourceFieldName, 'N/A') AS City,
	ISNULL(SourceFieldName, 'N/A') AS Secondary_Address,
	ISNULL(SourceFieldName, 'N/A') AS Secondary_Address_No,
	ISNULL(SourceFieldName, 'N/A') AS Secondary_Post_Code,
	ISNULL(SourceFieldName, 'N/A') AS District_2,
	ISNULL(SourceFieldName, 'N/A') AS City_2,
	ISNULL(SourceFieldName, 'N/A') AS Company_Phone,
	ISNULL(SourceFieldName, 'N/A') AS Company_Phone_2,
	ISNULL(SourceFieldName, 'N/A') AS Email,
	ISNULL(SourceFieldName, 'N/A') AS Email_2,
	ISNULL(SourceFieldName, 'N/A') AS Fax,
	ISNULL(SourceFieldName, 'N/A') AS Telex,
	ISNULL(SourceFieldName, 'N/A') AS Internet_Site,
	ISNULL(SourceFieldName, 'N/A') AS Comments,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation_Class_Value,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation_Class_Description,
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
	tb_Dummy_DEF WITH (NOLOCK)




GO
/****** Object:  View [dbo].[VIEW_DEF_Customers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_DEF_Customers] AS
SELECT 
	-1 AS Customer_ID,
	CMP.Company_ID AS Company_ID,
	ISNULL(SourceFieldName, '-1') AS Customer_Code,
	ISNULL(SourceFieldName, '-1') AS Customer_Alt_Code,
	ISNULL(SourceFieldName, -1) AS Customer_Parent_ID,
	ISNULL(SourceFieldName, 'N/A') AS Customer_FullName,
	ISNULL(SourceFieldName, 'N/A') AS Customer_FirstName,
	ISNULL(SourceFieldName, 'N/A') AS Customer_LastName,
	ISNULL(SourceFieldName, '20501231') AS Customer_BirthDate,
	ISNULL(SourceFieldName, 0) AS Customer_Age,
	ISNULL(SourceFieldName, -1) AS Customer_Category_Code,
	ISNULL(SourceFieldName, -1) AS Customer_SubCategory_Code,
	ISNULL(SourceFieldName, -1) AS Customer_Group_Code,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Category,
	ISNULL(SourceFieldName, 'N/A') AS Customer_SubCategory,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Group,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Segment,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Type,
	ISNULL(SourceFieldName, -1) AS Customer_RFM,
	ISNULL(SourceFieldName, 1) AS Is_Active_Flag,
	ISNULL(SourceFieldName, 'N/A') AS Fav_Form_of_Payment,
	ISNULL(SourceFieldName, 'N/A') AS Fav_Delivery_Method,
	ISNULL(SourceFieldName, -1) AS Fav_Branch_ID,
	ISNULL(SourceFieldName, 255) AS Has_DebitCard_Flag,
	ISNULL(SourceFieldName, 255) AS Has_CreditCard_Flag,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Job,
	ISNULL(SourceFieldName, 'N/A') AS Tax_ID,
	ISNULL(SourceFieldName, 'N/A') AS Tax_Office,
	ISNULL(SourceFieldName, 'N/A') AS Account,
	ISNULL(SourceFieldName, 'N/A') AS Primary_Address,
	ISNULL(SourceFieldName, 'N/A') AS Primary_Address_No,
	ISNULL(SourceFieldName, 'N/A') AS Secondary_Address,
	ISNULL(SourceFieldName, 'N/A') AS Secondary_Address_No,
	ISNULL(SourceFieldName, 'N/A') AS Other_Address,
	ISNULL(SourceFieldName, 'N/A') AS Other_Address_No,

	ISNULL(SourceFieldName, 'N/A') AS Primary_Post_Code,
	ISNULL(SourceFieldName, 'N/A') AS Secondary_Post_Code,
	ISNULL(SourceFieldName, 'N/A') AS Other_Post_Code,

	ISNULL(SourceFieldName, 1) AS Primary_GIS_FKEY,
	ISNULL(SourceFieldName, 1) AS Secondary_GIS_FKEY,
	ISNULL(SourceFieldName, 1) AS Other_GIS_FKEY,

	ISNULL(SourceFieldName, 'N/A') AS District,
	ISNULL(SourceFieldName, 'N/A') AS City,
	ISNULL(SourceFieldName, -1) AS Primary_Latitude,
	ISNULL(SourceFieldName, -1) AS Primary_Longtitude,
	ISNULL(SourceFieldName, 'N/A') AS Mobile_Phone,
	ISNULL(SourceFieldName, 'N/A') AS Mobile_Phone_2,
	ISNULL(SourceFieldName, 'N/A') AS Phone_1,
	ISNULL(SourceFieldName, 'N/A') AS Phone_2,
	ISNULL(SourceFieldName, 'N/A') AS Email,
	ISNULL(SourceFieldName, 'N/A') AS Email_2,
	ISNULL(SourceFieldName, 'N/A') AS Fax,
	ISNULL(SourceFieldName, 'N/A') AS Internet_Site,
	ISNULL(SourceFieldName, 'N/A') AS Comments,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation1_Class_Value,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation1_Class_Description,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation2_Class_Value,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation2_Class_Description,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation3_Class_Value,
	ISNULL(SourceFieldName, 'N/A') AS Segmentation3_Class_Description,
	ISNULL(SourceFieldName, -1) AS Customer_Hierarchy_Level1_Code,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Hierarchy_Level1_Name,
	ISNULL(SourceFieldName, -1) AS Customer_Hierarchy_Level2_Code,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Hierarchy_Level2_Name,
	ISNULL(SourceFieldName, -1) AS Customer_Hierarchy_Level3_Code,
	ISNULL(SourceFieldName, 'N/A') AS Customer_Hierarchy_Level3_Name,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_5,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_5
FROM
	tb_Dummy_DEF WITH (NOLOCK),
	tb_TRGMDL_Companies CMP WITH (NOLOCK)










GO
/****** Object:  View [dbo].[VIEW_DEF_Document_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_DEF_Document_Types] AS
SELECT 
	-1 AS Document_Type_ID,
	CMP.Company_ID AS Company_ID,
	ISNULL(SourceFieldName, '-1') AS Document_Type_Code,
	ISNULL(SourceFieldName, '-1') AS Document_Type_Alt_Code,
	ISNULL(SourceFieldName, 'N/A') AS Document_Type_Description,
	ISNULL(SourceFieldName, 0) AS Document_Type_SignFactor,
	ISNULL(SourceFieldName, 0) AS Document_Type_Order_Flag,
	ISNULL(SourceFieldName, 0) AS Document_Type_Invoice_Flag,
	ISNULL(SourceFieldName, 0) AS Document_Type_Order_SignFactor,
	ISNULL(SourceFieldName, 0) AS Document_Type_Invoice_SignFactor
FROM
	tb_Dummy_DEF WITH (NOLOCK),
	tb_TRGMDL_Companies CMP WITH (NOLOCK)




GO
/****** Object:  View [dbo].[VIEW_DEF_Employees]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_DEF_Employees] AS
SELECT
	-1 AS Employee_ID,
	CMP.Company_ID AS Company_ID,
	ISNULL(SourceFieldName, '-1') AS Employee_Code,
	ISNULL(SourceFieldName, '-1') AS Employee_Alt_Code,
	ISNULL(SourceFieldName, -1) AS Employee_Parent_ID,
	ISNULL(SourceFieldName, 'N/A') AS Employee_FullName,
	ISNULL(SourceFieldName, 'N/A') AS Employee_FirstName,
	ISNULL(SourceFieldName, 'N/A') AS Employee_LastName,
	ISNULL(SourceFieldName, 'N/A') AS Employee_MaidenName,
	ISNULL(SourceFieldName, 'N/A') AS Employee_ID_Number,
	ISNULL(SourceFieldName, 'N/A') AS Employee_TAX_Number,
	ISNULL(SourceFieldName, 'N/A') AS Employee_TAX_Department,
	ISNULL(SourceFieldName, 'N/A') AS Employee_Home_Address,
	ISNULL(SourceFieldName, 'N/A') AS Employee_Home_PostCode,
	ISNULL(SourceFieldName, 'N/A') AS Employee_Home_PhoneNumber,
	ISNULL(SourceFieldName, 'N/A') AS Employee_Mobile_PhoneNumber,
	ISNULL(SourceFieldName, 'N/A') AS Employee_email_Address,
	ISNULL(SourceFieldName, 'N/A') AS Employee_WorkHourClass,
	ISNULL(SourceFieldName, '20501231') AS Employee_HireDate,
	ISNULL(SourceFieldName, '20501231') AS Employee_LeaveDate,
	ISNULL(SourceFieldName, 'N/A') AS Employee_LeaveReason,
	ISNULL(SourceFieldName, -1) AS Employee_Department_ID_FKEY,
	ISNULL(SourceFieldName, -1) AS Employee_Department_CC,
	ISNULL(SourceFieldName, -1) AS Employee_Branch_ID,
	ISNULL(SourceFieldName, 'N/A') AS Employee_Grade,
	ISNULL(SourceFieldName, 'N/A') AS Employee_Specialty,
	ISNULL(SourceFieldName, 0) AS Employee_GrossSalary,
	ISNULL(SourceFieldName, 0) AS Employee_NetSalary,
	ISNULL(SourceFieldName, 0) AS Employee_Eligible_Vacation_Days,
	ISNULL(SourceFieldName, 255) AS Is_Active_Flag
FROM
	tb_Dummy_DEF WITH (NOLOCK),
	tb_TRGMDL_Companies CMP WITH (NOLOCK)



GO
/****** Object:  View [dbo].[VIEW_DEF_Products]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[VIEW_DEF_Products] AS
SELECT 
	-1 AS Product_ID,
	CMP.Company_ID AS Company_ID,
	ISNULL(SourceFieldName, -1) AS Product_Code,
	ISNULL(SourceFieldName, -1) AS Product_Alt_Code,
	ISNULL(SourceFieldName, -1) AS Product_Parent_ID,
	ISNULL(SourceFieldName, -1) AS Product_Master_ID,
	ISNULL(SourceFieldName, -1) AS Product_Replacement_ID,
	ISNULL(SourceFieldName, -1) AS Product_Bundle_ID,
	
	ISNULL(SourceFieldName, 'N/A') AS Product_Name_EL,
	ISNULL(SourceFieldName, 'N/A') AS Product_Name_EN,
	ISNULL(SourceFieldName, 'N/A') AS Barcode,
	ISNULL(SourceFieldName, 'N/A') AS EAN,
	ISNULL(SourceFieldName, 'N/A') AS Product_Type,
	ISNULL(SourceFieldName, 'N/A') AS Product_Status,

	ISNULL(SourceFieldName, -1) AS Product_Category_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Category_Description,
	ISNULL(SourceFieldName, -1) AS Product_SubCategory_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_SubCategory_Description,
	ISNULL(SourceFieldName, -1) AS Product_Group_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Group_Description,

	ISNULL(SourceFieldName, -1) AS Product_Hierarchy_Level_1_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy_Level_1_Name,
	ISNULL(SourceFieldName, -1) AS Product_Hierarchy_Level_2_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy_Level_2_Name,
	ISNULL(SourceFieldName, -1) AS Product_Hierarchy_Level_3_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy_Level_3_Name,
	ISNULL(SourceFieldName, -1) AS Product_Hierarchy_Level_4_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy_Level_4_Name,
	ISNULL(SourceFieldName, -1) AS Product_Hierarchy_Level_5_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy_Level_5_Name,

	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_1_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_1_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_2_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_2_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_3_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_3_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_4_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_4_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_5_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_5_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_6_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_6_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_7_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_7_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_8_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_8_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_9_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_9_Name,
	ISNULL(SourceFieldName, '-1') AS Product_Hierarchy2_Level_10_Code,
	ISNULL(SourceFieldName, 'N/A') AS Product_Hierarchy2_Level_10_Name,

	ISNULL(SourceFieldName, 'N/A') AS Basic_Supplier,
	ISNULL(SourceFieldName, 'N/A') AS Supplier_Product_Code,
	ISNULL(SourceFieldName, 'N/A') AS Supplier_Description,
	ISNULL(SourceFieldName, 'N/A') AS Manufacture_Country,
	ISNULL(SourceFieldName, 'N/A') AS Origin_Country,
	ISNULL(SourceFieldName, 'N/A') AS Manufacturer,
	ISNULL(SourceFieldName, 'N/A') AS Product_Brand,
	ISNULL(SourceFieldName, 'N/A') AS Product_Model,
	ISNULL(SourceFieldName, 'N/A') AS Stock_Method,
	ISNULL(SourceFieldName, 'N/A') AS Cost_Method,
	ISNULL(SourceFieldName, 'N/A') AS TaxClass,
	ISNULL(SourceFieldName, 'N/A') AS Product_Life_Cycle_State,
	ISNULL(SourceFieldName, 'N/A') AS Measurement_Unit,
	ISNULL(SourceFieldName, 0) AS Volume,
	ISNULL(SourceFieldName, 0) AS Net_Weight,
	ISNULL(SourceFieldName, 0) AS Gross_Weight,
	ISNULL(SourceFieldName, 0) AS Current_Stock_Quantity,
	ISNULL(SourceFieldName, 0) AS Current_Discount,
	ISNULL(SourceFieldName, 0) AS Current_Discount_PCT,
	ISNULL(SourceFieldName, 0) AS Current_Cost,
	ISNULL(SourceFieldName, 0) AS Current_Ticket_Price,
	ISNULL(SourceFieldName, 0) AS Current_Retail_Price,
	ISNULL(SourceFieldName, 0) AS Current_Wholesale_Price,
	ISNULL(SourceFieldName, 0) AS Current_Purchase_Price,
	ISNULL(SourceFieldName, 1) AS Is_Active_Flag,
	ISNULL(SourceFieldName, 0) AS Spare_Flag1,
	ISNULL(SourceFieldName, 'N/A') AS Spare_Flag1_Name,
	ISNULL(SourceFieldName, 0) AS Spare_Flag2,
	ISNULL(SourceFieldName, 'N/A') AS Spare_Flag2_Name,
	ISNULL(SourceFieldName, 0) AS Spare_Flag3,
	ISNULL(SourceFieldName, 'N/A') AS Spare_Flag3_Name,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_5,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_5
FROM
	tb_Dummy_DEF WITH (NOLOCK),
	tb_TRGMDL_Companies CMP WITH (NOLOCK)








GO
/****** Object:  View [dbo].[VIEW_DEF_Transaction_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DEF_Transaction_Types] AS
SELECT 
	-1 AS Transaction_Type_ID,
	CMP.Company_ID AS Company_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Description,
	ISNULL(SourceFieldName, 255) AS Transaction_Type_Group_Level1_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Group_Level1_Description,
	ISNULL(SourceFieldName, 255) AS Transaction_Type_Group_Level2_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Group_Level2_Description,
	ISNULL(SourceFieldName, 255) AS Transaction_Type_Group_Level3_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Group_Level3_Description
FROM
	tb_Dummy_DEF WITH (NOLOCK),
	tb_TRGMDL_Companies CMP WITH (NOLOCK)




GO
/****** Object:  View [dbo].[VIEW_DEF_Warehouses]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_DEF_Warehouses] AS
SELECT  
	-1 AS WarehouseID,
	CMP.Company_ID AS Company_ID,
	ISNULL(SourceFieldName, '-1') AS WarehouseCode,
	ISNULL(SourceFieldName, '-1') AS WarehouseAlt_Code,
	ISNULL(SourceFieldName, -1) AS WarehouseParent_ID,
	ISNULL(SourceFieldName, 'N/A') AS WarehouseName,
	
	ISNULL(SourceFieldName, 'N/A') AS WarehouseType,
	ISNULL(SourceFieldName, 'N/A') AS WarehouseClassification,
	ISNULL(SourceFieldName, 'N/A') AS WarehouseAddress,
	ISNULL(SourceFieldName, 'N/A') AS WarehouseCity,
	ISNULL(SourceFieldName, 'N/A') AS WarehouseDistrict,
	ISNULL(SourceFieldName, 1) AS WarehouseGIS_FKEY,
	ISNULL(SourceFieldName, '00000') AS WarehousePost_Code,
	ISNULL(SourceFieldName, 'N/A') AS WarehousePhone_1,
	ISNULL(SourceFieldName, 'N/A') AS WarehousePhone_2,
	ISNULL(SourceFieldName, 'N/A') AS Warehouseemail,
	ISNULL(SourceFieldName, 255) AS Is_Active_Flag,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_5,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_5
FROM
	tb_Dummy_DEF WITH (NOLOCK),
	tb_TRGMDL_Companies CMP WITH (NOLOCK)








GO
/****** Object:  View [dbo].[VIEW_DIM_Branches]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_DIM_Branches] AS
SELECT 
	 BR.Branch_ID,
	 ISNULL(BR.Company_ID,-1) AS Company_ID,
	 ISNULL(BR.Branch_Code, '-1') AS Branch_Code,
	 ISNULL(BR.Branch_Parent_ID, -1) AS Branch_Parent_ID,
	 ISNULL(BR.Branch_Name, 'N/A') AS Branch_Name,
	 ISNULL(BR.Branch_Code, 'N/A') + '-' + ISNULL(BR.Branch_Name, 'N/A') AS Branch_Code_and_Name,
	 ISNULL(BR.Branch_Type, 'N/A') AS Branch_Type,
	 ISNULL(BR.Branch_Classification, 'N/A') AS Branch_Classification,
	 ISNULL(BR.Branch_Address, 'N/A') AS Branch_Address,
	 ISNULL(BR.Branch_City, 'N/A') AS Branch_City,
	 ISNULL(BR.Branch_District, 'N/A') AS Branch_District,
	 ISNULL(BR.Branch_GIS_FKEY, 0) AS Branch_GIS_FKEY,
	 ISNULL(BR.Branch_Post_Code, '00000') AS Branch_Post_Code,
	 ISNULL(BR.Branch_Phone_1, 'N/A') AS Branch_Phone_1,
	 ISNULL(BR.Branch_Phone_2, 'N/A') AS Branch_Phone_2,
	 ISNULL(BR.Branch_email, 'N/A') AS Branch_email,
	 ISNULL(BR.Is_Active_Flag, 255) AS Is_Active_Flag,

	 ISNULL(BR.Custom_Value_1, 'N/A') AS Custom_Value_1,
	 ISNULL(BR.Custom_Description_1, 'N/A') AS Custom_Description_1,
	 ISNULL(BR.Custom_Value_2, 'N/A') AS Custom_Value_2,
	 ISNULL(BR.Custom_Description_2, 'N/A') AS Custom_Description_2,
	 ISNULL(BR.Custom_Value_3, 'N/A') AS Custom_Value_3,
	 ISNULL(BR.Custom_Description_3, 'N/A') AS Custom_Description_3,
	 ISNULL(BR.Custom_Value_4, 'N/A') AS Custom_Value_4,
	 ISNULL(BR.Custom_Description_4, 'N/A') AS Custom_Description_4,
	 ISNULL(BR.Custom_Value_5, 'N/A') AS Custom_Value_5,
	 ISNULL(BR.Custom_Description_5, 'N/A') AS Custom_Description_5
FROM 
	tb_TRGMDL_BranchES BR WITH (NOLOCK)




GO
/****** Object:  View [dbo].[VIEW_DIM_Companies]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VIEW_DIM_Companies] AS
SELECT
	CMP.Company_ID, 
	ISNULL(CMP.Company_Code,'-1') AS Company_Code,
	ISNULL(CMP.Company_Alt_Code,'-1') AS Company_Alt_Code,
	ISNULL(CMP.Company_Description_EL, 'N/A') AS Company_Name,
	CAST(CMP.Company_Code AS VARCHAR(20)) + '-' + CMP.Company_Description_EL AS Company_Code_and_Name,
	ISNULL(CMP.Parent_Company_Code, CMP.Company_Code) AS Parent_Company_Code,
	ISNULL(CMP.Parent_Company_Name, CMP.Company_Description_EL) AS Parent_Company_Name,
	ISNULL(CMP.Company_Group_ID, CMP.Company_ID) AS Company_Group_ID,
	ISNULL(CMP.Company_Group_Name, CMP.Company_Description_EL) AS Company_Group_Name,
	CMP.Company_Type,
	CMP.Tax_ID,
	CMP.Tax_Office,
	ISNULL(CMP.Company_Post_Code,1) AS Company_Post_Code
FROM tb_TRGMDL_Companies CMP WITH (NOLOCK)






GO
/****** Object:  View [dbo].[VIEW_DIM_CostCenters]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DIM_CostCenters] AS
SELECT 
	 CC.CC_ID AS Cost_Center_ID,
	 ISNULL(CC.Company_ID,-1) AS Company_ID,
	 ISNULL(CC.CC_Code, 'N/A') AS Cost_Center_Code,
	 ISNULL(CC.CC_Alt_Code, 'N/A') AS Cost_Center_Alt_Code,
	 ISNULL(CC.CC_Parent_ID, -1) AS Cost_Center_Parent_ID,
	 
	 ISNULL(CC.CC_Name, 'N/A') AS Cost_Center_Name,
	 ISNULL(CC.CC_Code, 'N/A') + '-' + ISNULL(CC.CC_Name, 'N/A') AS Cost_Center_Code_and_Name,
	 ISNULL(CC.CC_Type, 'N/A') AS Cost_Center_Type,
	 ISNULL(CC.CC_Classification, 'N/A') AS Cost_Center_Classification,
	 ISNULL(CC.CC_Address, 'N/A') AS Cost_Center_Address,
	 ISNULL(CC.CC_City, 'N/A') AS Cost_Center_City,
	 ISNULL(CC.CC_District, 'N/A') AS Cost_Center_District,
	 ISNULL(CC.CC_GIS_FKEY, 0) AS Cost_Center_GIS_FKEY,
	 ISNULL(CC.CC_Post_Code, '00000') AS Cost_Center_Post_Code,
	 ISNULL(CC.CC_Phone_1, 'N/A') AS Cost_Center_Phone_1,
	 ISNULL(CC.CC_Phone_2, 'N/A') AS Cost_Center_Phone_2,
	 ISNULL(CC.CC_email, 'N/A') AS Cost_Center_email,
	 ISNULL(CC.Commercial_CC_Code, 'N/A') AS Commercial_CC_Code,
	 ISNULL(CC.Accounting_CC_Code, 'N/A') AS Accounting_CC_Code,
	 ISNULL(CC.Is_Active_Flag, 255) AS Is_Active_Flag,

	 ISNULL(CC.Custom_Value_1, 'N/A') AS Custom_Value_1,
	 ISNULL(CC.Custom_Description_1, 'N/A') AS Custom_Description_1,
	 ISNULL(CC.Custom_Value_2, 'N/A') AS Custom_Value_2,
	 ISNULL(CC.Custom_Description_2, 'N/A') AS Custom_Description_2,
	 ISNULL(CC.Custom_Value_3, 'N/A') AS Custom_Value_3,
	 ISNULL(CC.Custom_Description_3, 'N/A') AS Custom_Description_3,
	 ISNULL(CC.Custom_Value_4, 'N/A') AS Custom_Value_4,
	 ISNULL(CC.Custom_Description_4, 'N/A') AS Custom_Description_4,
	 ISNULL(CC.Custom_Value_5, 'N/A') AS Custom_Value_5,
	 ISNULL(CC.Custom_Description_5, 'N/A') AS Custom_Description_5
FROM 
	tb_TRGMDL_CostCenters CC WITH (NOLOCK)


GO
/****** Object:  View [dbo].[VIEW_DIM_Customers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DIM_Customers] AS
SELECT 
	CS.Customer_ID,
	ISNULL(CS.Company_ID,-1) AS Company_ID,
	ISNULL(CS.Customer_Code, 'N/A') AS Customer_Code,
	ISNULL(CS.Customer_Alt_Code, '-1') AS Customer_Alt_Code,
	ISNULL(CS.Customer_Parent_ID, -1) AS Customer_Parent_ID,

	ISNULL(CS.Customer_FullName, 'N/A') AS Customer_FullName,
	ISNULL(CS.Customer_Code, 'N/A') + '-' + ISNULL(CS.Customer_FullName, 'N/A') AS Customer_Code_and_Name,
	ISNULL(CS.Customer_FirstName, 'N/A') AS Customer_FirstName,
	ISNULL(CS.Customer_LastName, 'N/A') AS Customer_LastName,
	ISNULL(CS.Customer_BirthDate, '20501231') AS Customer_BirthDate,
	ISNULL(CS.Customer_Age, 0) AS Customer_Age,

	ISNULL(CS.Customer_Category_Code, -1) AS Customer_Category_Code,
	ISNULL(CS.Customer_SubCategory_Code, -1) AS Customer_SubCategory_Code,
	ISNULL(CS.Customer_Group_Code, -1) AS Customer_Group_Code,
	ISNULL(CS.Customer_Category, 'N/A') AS Customer_Category,
	ISNULL(CS.Customer_SubCategory, 'N/A') AS Customer_SubCategory,
	ISNULL(CS.Customer_Group, 'N/A') AS Customer_Group,

	ISNULL(CS.Customer_Segment, 'N/A') AS Customer_Segment,
	ISNULL(CS.Customer_Type, 'N/A') AS Customer_Type,
	ISNULL(CS.Customer_RFM, -1) AS Customer_RFM,
	ISNULL(CS.Is_Active_Flag,1) AS Is_Active_Flag,
	ISNULL(CS.Fav_Form_of_Payment, 'N/A') AS Fav_Form_of_Payment,
	ISNULL(CS.Fav_Delivery_Method, 'N/A') AS Fav_Delivery_Method,
	ISNULL(CS.Fav_Branch_ID,-1) AS Fav_Branch_ID,
	ISNULL(CS.Has_DebitCard_Flag,255) AS Has_DeditCard_Flag,
	ISNULL(CS.Has_CreditCard_Flag,255) AS Has_CreditCard_Flag,

	ISNULL(CS.Customer_Job, 'N/A') AS Customer_Job,
	ISNULL(CS.Tax_ID, 'N/A') AS Tax_ID,
	ISNULL(CS.Tax_Office, 'N/A') AS Tax_Office,
	ISNULL(CS.Account, 'N/A') AS Account,
	ISNULL(CS.Primary_Address, 'N/A') AS Primary_Address,
	ISNULL(CS.Primary_Address_No, 'N/A') AS Primary_Address_No,
	ISNULL(CS.Primary_GIS_FKEY, 0) AS Primary_GIS_FKEY,
	ISNULL(CS.Secondary_Address, 'N/A') AS Secondary_Address,
	ISNULL(CS.Secondary_Address_No, 'N/A') AS Secondary_Address_No,
	ISNULL(CS.Secondary_GIS_FKEY, 0) AS Secondary_GIS_FKEY,
	ISNULL(CS.District, 'N/A') AS District,
	ISNULL(CS.City, 'N/A') AS City,

	ISNULL(CS.Mobile_Phone, 'N/A') AS Mobile_Phone,
	ISNULL(CS.Phone_1, 'N/A') AS Other_Phone,
	ISNULL(CS.Email, 'N/A') AS Email,

	ISNULL(CS.Segmentation1_Class_Value, 'N/A') AS Segmentation1_Class_Value,
	ISNULL(CS.Segmentation1_Class_Description, 'N/A') AS Segmentation1_Class_Description,
	ISNULL(CS.Segmentation2_Class_Value, 'N/A') AS Segmentation2_Class_Value,
	ISNULL(CS.Segmentation2_Class_Description, 'N/A') AS Segmentation2_Class_Description,
	ISNULL(CS.Segmentation3_Class_Value, 'N/A') AS Segmentation3_Class_Value,
	ISNULL(CS.Segmentation3_Class_Description, 'N/A') AS Segmentation3_Class_Description,

	ISNULL(CS.Customer_Hierarchy_Level1_Code, -1) AS Customer_Hierarchy_Level1_Code,
	ISNULL(CS.Customer_Hierarchy_Level1_Name, 'N/A') AS Customer_Hierarchy_Level1_Name,
	ISNULL(CS.Customer_Hierarchy_Level2_Code, -1) AS Customer_Hierarchy_Level2_Code,
	ISNULL(CS.Customer_Hierarchy_Level2_Name, 'N/A') AS Customer_Hierarchy_Level2_Name,
	ISNULL(CS.Customer_Hierarchy_Level3_Code, -1) AS Customer_Hierarchy_Level3_Code,
	ISNULL(CS.Customer_Hierarchy_Level3_Name, 'N/A') AS Customer_Hierarchy_Level3_Name,

	ISNULL(CS.Custom_Value_1, 'N/A') AS Custom_Value_1,
	ISNULL(CS.Custom_Description_1, 'N/A') AS Custom_Description_1,
	ISNULL(CS.Custom_Value_2, 'N/A') AS Custom_Value_2,
	ISNULL(CS.Custom_Description_2, 'N/A') AS Custom_Description_2,
	ISNULL(CS.Custom_Value_3, 'N/A') AS Custom_Value_3,
	ISNULL(CS.Custom_Description_3, 'N/A') AS Custom_Description_3,
	ISNULL(CS.Custom_Value_4, 'N/A') AS Custom_Value_4,
	ISNULL(CS.Custom_Description_4, 'N/A') AS Custom_Description_4,
	ISNULL(CS.Custom_Value_5, 'N/A') AS Custom_Value_5,
	ISNULL(CS.Custom_Description_5, 'N/A') AS Custom_Description_5
 FROM 
	tb_TRGMDL_Customers CS WITH (NOLOCK)






GO
/****** Object:  View [dbo].[VIEW_DIM_Dates]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DIM_Dates] AS
SELECT  
	T.PKEY AS PKEY,
	T.PK_Date,
	T.CM_Date_Name,
	T.CM_MonthDay,
	T.CM_MonthDay_Name,
	T.CM_Month_Name,
	T.CM_Month_Abbr,
	T.CM_Month_Name_GR,
	T.CM_Month_Abbr_GR,
	T.CM_WeekDay_Name,
	T.CM_WeekDay_Abbr,
	T.CM_WeekDay_Name_GR,
	T.CM_WeekDay_Abbr_GR,
	T.CL_Year,
	T.CL_Year_Name,
	T.CL_Semester,
	T.CL_Semester_Name,
	T.CL_Trimester,
	T.CL_Trimester_Name,
	T.CL_Quarter,
	T.CL_Quarter_Name,
	T.CL_Month,
	T.CL_Week,
	T.CL_Week_Name,
	T.CL_WeekDay_Number,
	T.CL_Week_Of_Month,
	T.FL_Year,
	T.FL_Year_Name,
	T.FL_Semester,
	T.FL_Semester_Name,
	T.FL_Trimester,
	T.FL_Trimester_Name,
	T.FL_Quarter,
	T.FL_Quarter_Name,
	T.FL_Month,
	T.FL_Week,
	T.FL_Week_Name,
	T.FL_WeekDay_Number,
	T.FL_Week_Of_Month,
	T.ISO_Year,
	T.[ISO_Week],
	T.ISO_Week_Name,
	T.ISO_WeekDay_Number,

	ISNULL(WS.Working_Sunday_Stores_Flag,0) AS Working_Sunday_Flag,
	CASE WHEN CM_WeekDay_Abbr IN ('Sat', 'Sun') THEN 1 ELSE 0 END AS Weekend_Flag,
	CASE 
		WHEN ISNULL(WS.Working_Sunday_Stores_Flag,0) = 1 THEN 1
		WHEN CM_WeekDay_Abbr IN ('Sat', 'Sun') OR H.Holiday_Flag_RetailStores = 1 THEN 0 
		ELSE 1 
	END AS WorkingDay_Flag_1, -- Excluding Weekends & Major Holidays & Including Working Sundays (Retail Stores)
	CASE WHEN CM_WeekDay_Abbr IN ('Sat', 'Sun') OR H.Holiday_Flag_RetailStores = 1 THEN 0 ELSE 1 END AS WorkingDay_Flag_2, -- Excluding Weekends & Major Holidays (Retail HQ)
	ISNULL(H.Holiday_Name,'Not Holiday') AS Holiday_Name, 
	ISNULL(H.Holiday_Name_2,'Not Holiday') AS Holiday_Name_2, 
	ISNULL(H.Holiday_Group,'Not Holiday') AS Holiday_Group, 
	ISNULL(H.Holiday_Group_2,'Not Holiday') AS Holiday_Group_2, 
	ISNULL(H.Holiday_Flag_RetailHQ,0) AS Holiday_Flag_RetailHQ, 
	ISNULL(H.Holiday_Flag_RetailStores,0) AS Holiday_Flag_RetailStores,
	ISNULL(H.Holiday_Flag_ShippingHQ,0) AS Holiday_Flag_ShippingHQ,
	ISNULL(H.Holiday_Flag_ShippingShips,0) AS Holiday_Flag_ShippingShips,

	ISNULL(SE.Special_Date_Description, 'No Special Event') AS Special_Date_Description,
	ISNULL(SE.Special_Date_Group_L1, 'No Special Event') AS Special_Date_Group_L1,
	ISNULL(SE.Special_Date_Group_L2, 'No Special Event') AS Special_Date_Group_L2,
	ISNULL(SE.Special_Date_Group_L3, 'No Special Event') AS Special_Date_Group_L3,

	ISNULL(SP.SALES_Description, 'No SALES') AS SALES_Description,
	ISNULL(SP.SALES_Group_L1, 'No SALES') AS SALES_Group_L1,
	ISNULL(SP.SALES_Group_L2, 'No SALES') AS SALES_Group_L2,
	ISNULL(SP.SALES_Group_L3, 'No SALES') AS SALES_Group_L3

FROM 
	tb_TRGMDL_Dates T WITH (NOLOCK) 
	LEFT OUTER JOIN tb_TRGMDL_Dates_Holidays H WITH (NOLOCK) ON T.PKEY = H.PKEY
	LEFT OUTER JOIN tb_TRGMDL_Dates_Working_Sundays WS WITH (NOLOCK) ON WS.PKEY = T.PKEY
	LEFT OUTER JOIN tb_TRGMDL_Dates_Special_Events SE WITH (NOLOCK) ON SE.PKEY = T.PKEY
	LEFT OUTER JOIN tb_TRGMDL_Dates_SALES_Periods SP WITH (NOLOCK) ON SP.PKEY = T.PKEY

--WHERE T.PKEY BETWEEN 20170701 AND 20170731 ORDER BY 1






GO
/****** Object:  View [dbo].[VIEW_DIM_Document_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_DIM_Document_Types] AS
SELECT 
 DT.Document_Type_ID,
 ISNULL(DT.Company_ID,-1) AS Company_ID,
 ISNULL(DT.Document_Type_Code, 'N/A') AS Document_Type_Code,
 ISNULL(DT.Document_Type_Alt_Code, 'N/A') AS Document_Type_Alt_Code,
 ISNULL(DT.Document_Type_Description, 'N/A') AS Document_Type_Description,
 ISNULL(DT.Document_Type_SignFactor,0) AS Document_Type_SignFactor,
 ISNULL(DT.Document_Type_Order_Flag,0) AS Document_Type_Order_Flag,
 ISNULL(DT.Document_Type_Invoice_Flag,0) AS Document_Type_Invoice_Flag,
 ISNULL(DT.Document_Type_Order_SignFactor,0) AS Document_Type_Order_SignFactor,
 ISNULL(DT.Document_Type_Invoice_SignFactor,0) AS Document_Type_Invoice_SignFactor
FROM 
	tb_TRGMDL_Document_Types DT WITH (NOLOCK)



GO
/****** Object:  View [dbo].[VIEW_DIM_Employees]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DIM_Employees] AS
SELECT 
	EMP.Employee_ID,
	EMP.Company_ID,
	ISNULL(EMP.Employee_FullName, 'N/A') FullName,
	ISNULL(EMP.Employee_FirstName, 'N/A') FirstName,
	ISNULL(EMP.Employee_LastName, 'N/A') LastName,
	ISNULL(EMP.Employee_MaidenName, 'N/A') MaidenName,
	ISNULL(EMP.Employee_ID_Number, 'N/A') ID_Number,
	ISNULL(EMP.Employee_TAX_Number, 'N/A') TAX_Number,
	ISNULL(EMP.Employee_TAX_Department, 'N/A') TAX_Department,
	ISNULL(EMP.Employee_Home_Address, 'N/A') Home_Address,
	ISNULL(EMP.Employee_Home_PostCode, 'N/A') Home_PostCode,
	ISNULL(EMP.Employee_Home_PhoneNumber, 'N/A') Home_PhoneNumber,
	ISNULL(EMP.Employee_Mobile_PhoneNumber, 'N/A') Mobile_PhoneNumber,
	ISNULL(EMP.Employee_email, 'N/A') email,
	ISNULL(EMP.Employee_WorkHourClass, 'N/A') WorkHourClass,
	ISNULL(EMP.Employee_HireDate, '20501231') HireDate,
	ISNULL(EMP.Employee_LeaveDate, '20501231') LeaveDate,
	ISNULL(EMP.Employee_LeaveReason, 'N/A') LeaveReason,
	ISNULL(EMP.Employee_Department_ID_FKEY, -1) Department_ID_FKEY,
	ISNULL(EMP.Employee_Department_CC, -1) Department_CC,
	ISNULL(EMP.Employee_Branch_ID, -1) Branch_ID,
	ISNULL(EMP.Employee_Grade, 'N/A') Grade,
	ISNULL(EMP.Employee_Specialty, 'N/A') Specialty,
	ISNULL(EMP.Employee_GrossSalary, 0) GrossSalary,
	ISNULL(EMP.Employee_NetSalary, 0) NetSalary,
	ISNULL(EMP.Employee_Eligible_Vacation_Days, 0) Eligible_Vacation_Days,
	ISNULL(EMP.Is_Active_Flag, 0) Is_Active_Flag
FROM 
	tb_TRGMDL_Employees EMP WITH (NOLOCK)



GO
/****** Object:  View [dbo].[VIEW_DIM_GIS]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VIEW_DIM_GIS] AS
SELECT 
	PKEY,
	Country_ID,
	Country_Description,
	Geographical_Region_ID,
	Geographical_Region_Description_EL,
	Geographical_Region_Description_EN,
	County_ID,
	County_Description_EL,
	County_Description_EN,
	Prefecture_ID,
	Prefecture_Description_EL,
	Prefecture_Description_EN,
	Municipality_ID,
	Municipality_Description_EL,
	Municipality_Description_EN,
	City_ID,
	City_Description,
	Area_ID,
	Area_Description,
	Post_Code,
	Country_CID,
	Geographical_Depart_CID,
	County_CID,
	Municipality_CID,
	City_CID,
	Area_CID,
	Classified_Value_1,
	Classified_Description_1,
	Classified_Value_2,
	Classified_Description_2,
	Classified_Value_3,
	Classified_Description_3,
	Classified_Value_4,
	Classified_Description_4,
	Classified_Value_5,
	Classified_Description_5
FROM 
	tb_TRGMDL_Geographical_Info A WITH (NOLOCK)




GO
/****** Object:  View [dbo].[VIEW_DIM_Numbers]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_DIM_Numbers] AS
SELECT 
	PKEY, Number, 
	Group_by_50_ID, Group_by_50_Name, 
	Group_by_100_ID, Group_by_100_Name, 
	Group_by_150_ID, Group_by_150_Name, 
	Group_by_250_ID, Group_by_250_Name, 
	Group_by_500_ID, Group_by_500_Name,
	Group_by_1000_ID, Group_by_1000_Name,
	ISNULL(Custom_Group_1_ID, -1) AS Custom_Group_1_ID, ISNULL(Custom_Group_1_Name, 'N/A') AS Custom_Group_1_Name,
	ISNULL(Custom_Group_2_ID, -1) AS Custom_Group_2_ID, ISNULL(Custom_Group_2_Name, 'N/A') AS Custom_Group_2_Name,
	ISNULL(Custom_Group_3_ID, -1) AS Custom_Group_3_ID, ISNULL(Custom_Group_3_Name, 'N/A') AS Custom_Group_3_Name,
	ISNULL(Custom_Group_4_ID, -1) AS Custom_Group_4_ID, ISNULL(Custom_Group_4_Name, 'N/A') AS Custom_Group_4_Name,
	ISNULL(Custom_Group_5_ID, -1) AS Custom_Group_5_ID, ISNULL(Custom_Group_5_Name, 'N/A') AS Custom_Group_5_Name,
	ISNULL(Custom_Group_6_ID, -1) AS Custom_Group_6_ID, ISNULL(Custom_Group_6_Name, 'N/A') AS Custom_Group_6_Name,
	ISNULL(Custom_Group_7_ID, -1) AS Custom_Group_7_ID, ISNULL(Custom_Group_7_Name, 'N/A') AS Custom_Group_7_Name,
	ISNULL(Custom_Group_8_ID, -1) AS Custom_Group_8_ID, ISNULL(Custom_Group_8_Name, 'N/A') AS Custom_Group_8_Name,
	ISNULL(Custom_Group_9_ID, -1) AS Custom_Group_9_ID, ISNULL(Custom_Group_9_Name, 'N/A') AS Custom_Group_9_Name
FROM tb_TRGMDL_Numbers TN WITH (NOLOCK)

GO
/****** Object:  View [dbo].[VIEW_DIM_Products]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_DIM_Products] AS
SELECT 
	PR.Product_ID, 
	PR.Company_ID,
	ISNULL(PR.Product_Code, 'N/A') AS Product_Code,
	ISNULL(PR.Product_Alt_Code, 'N/A') AS Product_Alt_Code,
	ISNULL(PR.Product_Parent_ID, -1) AS Parent_Product_ID,
	ISNULL(PR.Product_Bundle_ID, -1) AS Bundle_Product_ID,
	ISNULL(PR.Product_Master_ID, -1) AS Master_Product_ID,
	ISNULL(PR.Product_Replacement_ID, -1) AS Replacement_Product_ID,

	ISNULL(PR.Product_Name_EL, 'N/A') AS Product_Name_EL,
	ISNULL(PR.Product_Code, 'N/A') + '-' + ISNULL(PR.Product_Name_EL, 'N/A') AS Product_Code_and_Name,

	ISNULL(PR.Product_Name_EN, 'N/A') AS Product_Name_EN, 
	ISNULL(PR.Barcode, 'N/A') AS Barcode,
	ISNULL(PR.EAN, 'N/A') AS EAN,
	ISNULL(PR.Product_Type, 'N/A') AS Product_Type,
	ISNULL(PR.Product_Status, 'N/A') AS Product_Status,

	ISNULL(PR.Product_Category_Code,-1) AS Product_Category_Code, ISNULL(PR.Product_Category_Description, 'N/A') AS Product_Category_Description,
	ISNULL(PR.Product_SubCategory_Code,-1) AS Product_SubCategory_Code, ISNULL(PR.Product_SubCategory_Description, 'N/A') AS Product_SubCategory_Description,
	ISNULL(PR.Product_Group_Code,-1) AS Product_Group_Code, ISNULL(PR.Product_Group_Description, 'N/A') AS Product_Group_Description,

	ISNULL(PR.Product_Hierarchy_Level_1_Code,-1) AS Product_Hierarchy_Level_1_Code, ISNULL(PR.Product_Hierarchy_Level_1_Name, 'N/A') AS Product_Hierarchy_Level_1_Name,
	ISNULL(PR.Product_Hierarchy_Level_2_Code,-1) AS Product_Hierarchy_Level_2_Code, ISNULL(PR.Product_Hierarchy_Level_2_Name, 'N/A') AS Product_Hierarchy_Level_2_Name,
	ISNULL(PR.Product_Hierarchy_Level_3_Code,-1) AS Product_Hierarchy_Level_3_Code, ISNULL(PR.Product_Hierarchy_Level_3_Name, 'N/A') AS Product_Hierarchy_Level_3_Name,
	ISNULL(PR.Product_Hierarchy_Level_4_Code,-1) AS Product_Hierarchy_Level_4_Code, ISNULL(PR.Product_Hierarchy_Level_4_Name, 'N/A') AS Product_Hierarchy_Level_4_Name,
	ISNULL(PR.Product_Hierarchy_Level_5_Code,-1) AS Product_Hierarchy_Level_5_Code, ISNULL(PR.Product_Hierarchy_Level_5_Name, 'N/A') AS Product_Hierarchy_Level_5_Name,

	ISNULL(PR.Product_Hierarchy2_Level_1_Code,'-1') AS Product_Hierarchy2_Level_1_Code, ISNULL(PR.Product_Hierarchy2_Level_1_Name, 'N/A') AS Product_Hierarchy2_Level_1_Name,
	ISNULL(PR.Product_Hierarchy2_Level_2_Code,'-1') AS Product_Hierarchy2_Level_2_Code, ISNULL(PR.Product_Hierarchy2_Level_2_Name, 'N/A') AS Product_Hierarchy2_Level_2_Name,
	ISNULL(PR.Product_Hierarchy2_Level_3_Code,'-1') AS Product_Hierarchy2_Level_3_Code, ISNULL(PR.Product_Hierarchy2_Level_3_Name, 'N/A') AS Product_Hierarchy2_Level_3_Name,
	ISNULL(PR.Product_Hierarchy2_Level_4_Code,'-1') AS Product_Hierarchy2_Level_4_Code, ISNULL(PR.Product_Hierarchy2_Level_4_Name, 'N/A') AS Product_Hierarchy2_Level_4_Name,
	ISNULL(PR.Product_Hierarchy2_Level_5_Code,'-1') AS Product_Hierarchy2_Level_5_Code, ISNULL(PR.Product_Hierarchy2_Level_5_Name, 'N/A') AS Product_Hierarchy2_Level_5_Name,
	ISNULL(PR.Product_Hierarchy2_Level_6_Code,'-1') AS Product_Hierarchy2_Level_6_Code, ISNULL(PR.Product_Hierarchy2_Level_6_Name, 'N/A') AS Product_Hierarchy2_Level_6_Name,
	ISNULL(PR.Product_Hierarchy2_Level_7_Code,'-1') AS Product_Hierarchy2_Level_7_Code, ISNULL(PR.Product_Hierarchy2_Level_7_Name, 'N/A') AS Product_Hierarchy2_Level_7_Name,
	ISNULL(PR.Product_Hierarchy2_Level_8_Code,'-1') AS Product_Hierarchy2_Level_8_Code, ISNULL(PR.Product_Hierarchy2_Level_8_Name, 'N/A') AS Product_Hierarchy2_Level_8_Name,
	ISNULL(PR.Product_Hierarchy2_Level_9_Code,'-1') AS Product_Hierarchy2_Level_9_Code, ISNULL(PR.Product_Hierarchy2_Level_9_Name, 'N/A') AS Product_Hierarchy2_Level_9_Name,
	ISNULL(PR.Product_Hierarchy2_Level_10_Code,'-1') AS Product_Hierarchy2_Level_10_Code, ISNULL(PR.Product_Hierarchy2_Level_10_Name, 'N/A') AS Product_Hierarchy2_Level_10_Name,

	ISNULL(PR.Basic_Supplier, 'N/A') AS Basic_Supplier, 
	ISNULL(PR.Supplier_Product_Code, 'N/A') AS Supplier_Product_Code, 
	ISNULL(PR.Supplier_Description, 'N/A') AS Supplier_Description,
	ISNULL(PR.Manufacture_Country, 'N/A') AS Manufacture_Country, 
	ISNULL(PR.Origin_Country, 'N/A') AS Origin_Country, 
	ISNULL(PR.Manufacturer, 'N/A') AS Manufacturer,
	ISNULL(PR.Product_Brand, 'N/A') AS Product_Brand, 
	ISNULL(PR.Product_Model, 'N/A') AS Product_Model, 
	
	ISNULL(PR.Stock_Method, 'N/A') AS Stock_Method, 
	ISNULL(PR.Cost_Method, 'N/A') AS Cost_Method, 
	ISNULL(PR.TaxClass, 'N/A') AS TaxClass,
	ISNULL(PR.Product_Life_Cycle_State, 'N/A') AS Product_Life_Cycle_State,
	ISNULL(PR.Measurement_Unit, 'N/A') AS Measurement_Unit,
	ISNULL(PR.Volume, 0) AS Volume, 
	ISNULL(PR.Net_Weight, 0) AS Net_Weight, 
	ISNULL(PR.Gross_Weight, 0) AS Gross_Weight,
	ISNULL(PR.Current_Stock_Quantity, 0) AS Current_Stock_Quantity, 
	ISNULL(PR.Current_Discount, 0) AS Current_Discount, 
	ISNULL(PR.Current_Cost, 0) AS Current_Cost, 
	ISNULL(PR.Current_Ticket_Price, 0) AS Current_Ticket_Price, 
	ISNULL(PR.Current_Retail_Price, 0) AS Current_Retail_Price, 
	ISNULL(PR.Current_Wholesale_Price, 0) AS Current_Wholesale_Price,
	ISNULL(PR.Current_Purchase_Price, 0) AS Current_Purchase_Price,
	
	ISNULL(PR.Is_Active_Flag, 0) AS Is_Active_Flag,
	ISNULL(PR.Spare_Flag1, 0) AS Spare_Flag1, ISNULL(PR.Spare_Flag1_Name, 'N/A') AS Spare_Flag1_Name,
	ISNULL(PR.Spare_Flag2, 0) AS Spare_Flag2, ISNULL(PR.Spare_Flag2_Name, 'N/A') AS Spare_Flag2_Name,
	ISNULL(PR.Spare_Flag3, 0) AS Spare_Flag3, ISNULL(PR.Spare_Flag3_Name, 'N/A') AS Spare_Flag3_Name,
	ISNULL(PR.Custom_Value_1, 'N/A') AS Custom_Value_1, ISNULL(PR.Custom_Description_1, 'N/A') AS Custom_Description_1,
	ISNULL(PR.Custom_Value_2, 'N/A') AS Custom_Value_2, ISNULL(PR.Custom_Description_2, 'N/A') AS Custom_Description_2,
	ISNULL(PR.Custom_Value_3, 'N/A') AS Custom_Value_3, ISNULL(PR.Custom_Description_3, 'N/A') AS Custom_Description_3,
	ISNULL(PR.Custom_Value_4, 'N/A') AS Custom_Value_4, ISNULL(PR.Custom_Description_4, 'N/A') AS Custom_Description_4,
	ISNULL(PR.Custom_Value_5, 'N/A') AS Custom_Value_5, ISNULL(PR.Custom_Description_5, 'N/A') AS Custom_Description_5
FROM 
	tb_TRGMDL_Products PR WITH (NOLOCK)







GO
/****** Object:  View [dbo].[VIEW_DIM_Transaction_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_DIM_Transaction_Types] AS
SELECT 
	TRT.Transaction_Type_ID,
	TRT.Transaction_Type_Description,
	TRT.Transaction_Type_Group_Level1_ID,
	TRT.Transaction_Type_Group_Level1_Description,
	TRT.Transaction_Type_Group_Level2_ID,
	TRT.Transaction_Type_Group_Level2_Description,
	TRT.Transaction_Type_Group_Level3_ID,
	TRT.Transaction_Type_Group_Level3_Description
FROM
	tb_TRGMDL_Transaction_Types TRT WITH (NOLOCK)





GO
/****** Object:  View [dbo].[VIEW_DIM_Warehouses]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VIEW_DIM_Warehouses] AS
SELECT 
	 WR.Warehouse_ID,
	 ISNULL(WR.Company_ID,-1) AS Company_ID,
	 ISNULL(WR.Warehouse_Code, '-1') AS Warehouse_Code,
	 ISNULL(WR.Warehouse_Parent_ID, -1) AS Warehouse_Parent_ID,
	 ISNULL(WR.Warehouse_Name, 'N/A') AS Warehouse_Name,
	 ISNULL(WR.Warehouse_Code, 'N/A') + '-' + ISNULL(WR.Warehouse_Name, 'N/A') AS Warehouse_Code_and_Name,
	 ISNULL(WR.Warehouse_Type, 'N/A') AS Warehouse_Type,
	 ISNULL(WR.Warehouse_Classification, 'N/A') AS Warehouse_Classification,
	 ISNULL(WR.Warehouse_Address, 'N/A') AS Warehouse_Address,
	 ISNULL(WR.Warehouse_City, 'N/A') AS Warehouse_City,
	 ISNULL(WR.Warehouse_District, 'N/A') AS Warehouse_District,
	 ISNULL(WR.Warehouse_GIS_FKEY, 0) AS Warehouse_GIS_FKEY,
	 ISNULL(WR.Warehouse_Post_Code, '00000') AS Warehouse_Post_Code,
	 ISNULL(WR.Warehouse_Phone_1, 'N/A') AS Warehouse_Phone_1,
	 ISNULL(WR.Warehouse_Phone_2, 'N/A') AS Warehouse_Phone_2,
	 ISNULL(WR.Warehouse_email, 'N/A') AS Warehouse_email,
	 ISNULL(WR.Is_Active_Flag, 255) AS Is_Active_Flag,

	 ISNULL(WR.Custom_Value_1, 'N/A') AS Custom_Value_1,
	 ISNULL(WR.Custom_Description_1, 'N/A') AS Custom_Description_1,
	 ISNULL(WR.Custom_Value_2, 'N/A') AS Custom_Value_2,
	 ISNULL(WR.Custom_Description_2, 'N/A') AS Custom_Description_2,
	 ISNULL(WR.Custom_Value_3, 'N/A') AS Custom_Value_3,
	 ISNULL(WR.Custom_Description_3, 'N/A') AS Custom_Description_3,
	 ISNULL(WR.Custom_Value_4, 'N/A') AS Custom_Value_4,
	 ISNULL(WR.Custom_Description_4, 'N/A') AS Custom_Description_4,
	 ISNULL(WR.Custom_Value_5, 'N/A') AS Custom_Value_5,
	 ISNULL(WR.Custom_Description_5, 'N/A') AS Custom_Description_5
FROM 
	tb_TRGMDL_Warehouses WR WITH (NOLOCK)





GO
/****** Object:  View [dbo].[VIEW_FACT_Budget]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_FACT_Budget] AS
SELECT 
	BGT.Budget_PKEY,
	ISNULL(BGT.Budget_Date, '20501231') AS Budget_Date,
	ISNULL(BGT.Company_ID, -1) AS Company_ID,
	ISNULL(BGT.Budget_Product_ID, -1) AS Budget_Product_ID,
	ISNULL(BGT.Budget_Customer_ID, -1) AS Budget_Customer_ID,
	ISNULL(BGT.Budget_Branch_ID, -1) AS Budget_Branch_ID,
	ISNULL(BGT.Budget_CostCenter_ID, -1) AS Budget_CostCenter_ID,
	ISNULL(BGT.Budget_GIS_ID, -1) AS Budget_GIS_ID,
	ISNULL(BGT.Budget_Transaction_Type_ID, -1) AS Budget_Transaction_Type,
	ISNULL(BGT.Budget_Version, 'Default') AS Budget_Version,
	ISNULL(BGT.Budget_Value, 0) AS Budget_Value,
	ISNULL(BGT.Budget_Quantity, 0) AS Budget_Quantity,
	ISNULL(BGT.Budget_Value2, 0) AS Budget_Value2,
	ISNULL(BGT.Budget_Value3, 0) AS Budget_Value3,
	ISNULL(BGT.Budget_Value4, 0) AS Budget_Value4
FROM tb_TRGMDL_Budget BGT WITH (NOLOCK)



GO
/****** Object:  View [dbo].[VIEW_FACT_Stock_Current]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_FACT_Stock_Current] AS
SELECT 
	ISNULL(STK.Company_ID, -1) AS Company_ID,
	ISNULL(STK.Product_ID, -1) AS Product_ID,
	ISNULL(STK.Warehouse_ID, -1) AS Warehouse_ID,
	ISNULL(STK.Stock_Date, 20501231) AS Stock_Date,
	ISNULL(STK.Stock_Quantity, 0) AS Stock_Quantity,
	ISNULL(STK.Stock_Quantity_2, 0) AS Stock_Quantity_2,
	ISNULL(STK.Stock_Value, 0) AS Stock_Value,
	ISNULL(STK.Stock_Value_2, 0) AS Stock_Value_2,
	ISNULL(STK.Stock_Value_3, 0) AS Stock_Value_3,
	ISNULL(STK.Stock_Value_4, 0) AS Stock_Value_4
FROM 
	tb_TRGMDL_Stock_Current STK WITH (NOLOCK)


GO
/****** Object:  View [dbo].[VIEW_FACT_Stock_Historical]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_FACT_Stock_Historical] AS
SELECT 
	ISNULL(STK.Company_ID, -1) AS Company_ID,
	ISNULL(STK.Product_ID, -1) AS Product_ID,
	ISNULL(STK.Warehouse_ID, -1) AS Warehouse_ID,
	ISNULL(STK.Stock_Date, 20501231) AS Stock_Date,
	ISNULL(STK.Stock_Quantity, 0) AS Stock_Quantity,
	ISNULL(STK.Stock_Quantity_2, 0) AS Stock_Quantity_2,
	ISNULL(STK.Stock_Value, 0) AS Stock_Value,
	ISNULL(STK.Stock_Value_2, 0) AS Stock_Value_2,
	ISNULL(STK.Stock_Value_3, 0) AS Stock_Value_3,
	ISNULL(STK.Stock_Value_4, 0) AS Stock_Value_4
FROM 
	tb_TRGMDL_Stock_Historical STK WITH (NOLOCK)


GO
/****** Object:  View [dbo].[VIEW_SAGENT_DIM_ExecutionStatuses]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_SAGENT_DIM_ExecutionStatuses] AS
SELECT * FROM tb_SYSMDL_SQLAgent_ExecutionStatuses WITH (NOLOCK)



GO
/****** Object:  View [dbo].[VIEW_SAGENT_DIM_Jobs_And_Steps]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VIEW_SAGENT_DIM_Jobs_And_Steps] AS
SELECT DISTINCT
	A.Job_Step_PKEY AS PKEY,
	A.Job_Step_PKEY,
	B.Job_PKEY AS Job_ID, 
	A.Step_ID AS Step_ID,
	A.Step_Sorter,
	A.Job_Name,
	A.Step_Name
FROM 
	tb_SYSMDL_SQLAgent_Job_History A WITH (NOLOCK) 
	INNER JOIN tb_SYSMDL_SQLAgent_Jobs B WITH (NOLOCK) ON A.Job_ID = B.Job_ID







GO
/****** Object:  View [dbo].[VIEW_SRC_Branches]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VIEW_SRC_Branches] AS
SELECT  
	SourceFieldName AS Branch_ID,
	ISNULL(SourceFieldName, -1) AS Company_ID,
	ISNULL(SourceFieldName, '-1') AS Branch_Code,
	ISNULL(SourceFieldName, '-1') AS Branch_Alt_Code,
	ISNULL(SourceFieldName, -1) AS Branch_Parent_ID,
	ISNULL(SourceFieldName, 'N/A') AS Branch_Name,
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
	ISNULL(SourceFieldName, 255) AS Is_Active_Flag,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_1,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_2,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_3,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_4,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Value_5,
	ISNULL(SourceFieldName, 'N/A') AS Custom_Description_5
FROM
	tb_Dummy_SRC WITH (NOLOCK)







GO
/****** Object:  View [dbo].[VIEW_SRC_Companies]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VIEW_SRC_Companies] AS
SELECT  
		1 AS Company_ID,
		'-1' AS Company_Code,
		'-1' AS Company_Alt_Code,
		'ΑΙΝΟΣ Α.Ε.Β.Ε.' AS Company_Description_EL,
		'AINOS S.A.' AS Company_Description_EN,
		'-1' AS Targit_Customer_ID,
		'N/A' AS Targit_Customer_Name,
		'ΕΜΠΟΡΙΟ ΚΑΤ/ΝΩΝ ΠΡΟΙΟΝΤΩΝ' AS Company_Type,
		-1 AS Parent_Company_Code,
		'N/A' AS Parent_Company_Name,
		-1 AS Company_Group_ID,
		'N/A' AS Company_Group_Name,
		'094265390' AS Tax_ID,
		'N/A' AS Tax_Office,
		'N/A' AS ARMAE,
		'Πειραιώς' AS Company_Address,
		'88' AS Company_Address_No,
		'18346' AS Company_Post_Code,
		'N/A' AS District,
		'ΜΟΣΧΑΤΟ' AS City,
		'N/A' AS Secondary_Address,
		'N/A' AS Secondary_Address_No,
		'N/A' AS Secondary_Post_Code,
		'N/A' AS District_2,
		'N/A' AS City_2,
		'2104810706' AS Company_Phone,
		'N/A' AS Company_Phone_2,
		'N/A' AS Email,
		'N/A' AS Email_2,
		'N/A' AS Fax,
		'N/A' AS Telex,
		'www.ainos.gr' AS Internet_Site,
		'N/A' AS Comments,
		'N/A' AS Segmentation_Class_Value,
		'N/A' AS Segmentation_Class_Description,
		'N/A' AS Custom_Value_1,
		'N/A' AS Custom_Description_1,
		'N/A' AS Custom_Value_2,
		'N/A' AS Custom_Description_2,
		'N/A' AS Custom_Value_3,
		'N/A' AS Custom_Description_3,
		'N/A' AS Custom_Value_4,
		'N/A' AS Custom_Description_4,
		'N/A' AS Custom_Value_5,
		'N/A' AS Custom_Description_5








GO
/****** Object:  View [dbo].[VIEW_SRC_Current_Stock]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_SRC_Current_Stock] AS
SELECT 
	ISNULL(A.SourceFieldName,-1) AS Company_ID,
	ISNULL(A.SourceFieldName,-1) AS Product_ID,
	ISNULL(A.SourceFieldName,-1) AS Warehouse_ID,
	ISNULL(A.SourceFieldName,20501231) AS Stock_Date,
	ISNULL(A.SourceFieldName,0) AS Stock_Quantity,
	ISNULL(A.SourceFieldName,0) AS Stock_Quantity_2,
	ISNULL(A.SourceFieldName,0) AS Stock_Value,
	ISNULL(A.SourceFieldName,0) AS Stock_Value_2,
	ISNULL(A.SourceFieldName,0) AS Stock_Value_3,
	ISNULL(A.SourceFieldName,0) AS Stock_Value_4
FROM 
	tb_Dummy_SRC A WITH (NOLOCK)

GO
/****** Object:  View [dbo].[VIEW_SRC_Employees]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VIEW_SRC_Employees] AS
SELECT
	ISNULL(CAST(SL.AA AS BIGINT), -1) AS Employee_ID,
	1 AS Company_ID,
	ISNULL(SL.PrCenCd, '-1') AS Employee_Code,
	'-1' AS Employee_Alt_Code,
	-1 AS Employee_Parent_ID,
	ISNULL(SL.Name, 'N/A') AS Employee_FullName,
	'N/A' AS Employee_FirstName,
	'N/A' AS Employee_LastName,
	ISNULL(SL.FthrName, 'N/A') AS Employee_MaidenName,
	'N/A' AS Employee_ID_Number,
	ISNULL(SL.AFM, 'N/A') AS Employee_TAX_Number,
	ISNULL(SL.DoyID, 'N/A') AS Employee_TAX_Department,
	ISNULL(SL.Address1, 'N/A') AS Employee_Home_Address,
	ISNULL(SL.ZipCode, 'N/A') AS Employee_Home_PostCode,
	ISNULL(SL.Telephone1, 'N/A') AS Employee_Home_PhoneNumber,
	ISNULL(SL.Mobile, 'N/A') AS Employee_Mobile_PhoneNumber,
	ISNULL(SL.Email, 'N/A') AS Employee_email,
	'N/A' AS Employee_WorkHourClass,
	'20501231' AS Employee_HireDate,
	'20501231' AS Employee_LeaveDate,
	'N/A' AS Employee_LeaveReason,
	-1 AS Employee_Department_ID_FKEY,
	-1 AS Employee_Department_CC,
	-1 AS Employee_Branch_ID,
	'N/A' AS Employee_Grade,
	-- ISNULL(SL.Speciality, 'N/A') AS Employee_Specialty,
	'Sales Person' AS Employee_Specialty,
	0 AS Employee_GrossSalary,
	0 AS Employee_NetSalary,
	0 AS Employee_Eligible_Vacation_Days,
	255 AS Is_Active_Flag
FROM 
	AINOS.clroot.Salesman SL WITH (NOLOCK)


GO
/****** Object:  View [dbo].[VIEW_SRC_Salesmen]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[VIEW_SRC_Salesmen] AS
SELECT
	ISNULL(CAST(SL.AA AS BIGINT), -1) AS Employee_ID,
	1 AS Company_ID,
	ISNULL(SL.PrCenCd, '-1') AS Employee_Code,
	'-1' AS Employee_Alt_Code,
	-1 AS Employee_Parent_ID,
	ISNULL(SL.Name, 'N/A') AS Employee_FullName,
	'N/A' AS Employee_FirstName,
	'N/A' AS Employee_LastName,
	ISNULL(SL.FthrName, 'N/A') AS Employee_MaidenName,
	'N/A' AS Employee_ID_Number,
	ISNULL(SL.AFM, 'N/A') AS Employee_TAX_Number,
	ISNULL(SL.DoyID, 'N/A') AS Employee_TAX_Department,
	ISNULL(SL.Address1, 'N/A') AS Employee_Home_Address,
	ISNULL(SL.ZipCode, 'N/A') AS Employee_Home_PostCode,
	ISNULL(SL.Telephone1, 'N/A') AS Employee_Home_PhoneNumber,
	ISNULL(SL.Mobile, 'N/A') AS Employee_Mobile_PhoneNumber,
	ISNULL(SL.Email, 'N/A') AS Employee_email,
	'N/A' AS Employee_WorkHourClass,
	'20501231' AS Employee_HireDate,
	'20501231' AS Employee_LeaveDate,
	'N/A' AS Employee_LeaveReason,
	-1 AS Employee_Department_ID_FKEY,
	-1 AS Employee_Department_CC,
	-1 AS Employee_Branch_ID,
	'N/A' AS Employee_Grade,
	-- ISNULL(SL.Speciality, 'N/A') AS Employee_Specialty,
	'Salesman' AS Employee_Specialty,
	0 AS Employee_GrossSalary,
	0 AS Employee_NetSalary,
	0 AS Employee_Eligible_Vacation_Days,
	255 AS Is_Active_Flag
FROM 
	AINOS.clroot.Salesman SL WITH (NOLOCK)






GO
/****** Object:  View [dbo].[VIEW_SRC_Transaction_Types]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_SRC_Transaction_Types] AS
SELECT 
	SourceFieldName AS Transaction_Type_ID,
	ISNULL(SourceFieldName, -1) AS Company_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Description,
	ISNULL(SourceFieldName, 255) AS Transaction_Type_Group_Level1_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Group_Level1_Description,
	ISNULL(SourceFieldName, 255) AS Transaction_Type_Group_Level2_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Group_Level2_Description,
	ISNULL(SourceFieldName, 255) AS Transaction_Type_Group_Level3_ID,
	ISNULL(SourceFieldName, 'N/A') AS Transaction_Type_Group_Level3_Description
FROM
	tb_Dummy_SRC WITH (NOLOCK)


GO
/****** Object:  View [dbo].[VIEW_SRC_Warehouses]    Script Date: 27/07/2017 12:40:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VIEW_SRC_Warehouses] AS
SELECT  
	ISNULL(WH.AA ,-1) AS Warehouse_ID,
	1 AS Company_ID,
	ISNULL(WH.AA, 'N/A') AS Warehouse_Code,
	'-1' AS Warehouse_Alt_Code,
	-1 AS Warehouse_Parent_ID,
	ISNULL(WH.Description, 'N/A') AS Warehouse_Name,
	'N/A' AS Warehouse_Type,
	'N/A' AS Warehouse_Classification,
	ISNULL(Address1, 'N/A') AS Warehouse_Address,
	'N/A' AS Warehouse_City,
	'N/A' AS Warehouse_District,
	ISNULL(GI.PKEY, 1) AS Warehouse_GIS_FKEY,
	ISNULL(GI.Post_Code, '00000') AS Warehouse_Post_Code,
	ISNULL(WH.Tel1, 'N/A') AS Warehouse_Phone_1,
	ISNULL(WH.Tel2, 'N/A') AS Warehouse_Phone_2,
	ISNULL(WH.Email, 'N/A') AS Warehouse_email,
	255 AS Is_Active_Flag,
	'N/A' AS Custom_Value_1,
	'N/A' AS Custom_Description_1,
	'N/A' AS Custom_Value_2,
	'N/A' AS Custom_Description_2,
	'N/A' AS Custom_Value_3,
	'N/A' AS Custom_Description_3,
	'N/A' AS Custom_Value_4,
	'N/A' AS Custom_Description_4,
	'N/A' AS Custom_Value_5,
	'N/A' AS Custom_Description_5
FROM
	[AINOS].[clroot].[WareHous] AS WH WITH (NOLOCK)
	LEFT OUTER JOIN Targit_Model.dbo.tb_TRGMDL_Geographical_Info AS GI WITH(NOLOCK) 
	ON CASE WHEN WH.PostalCode NOT LIKE '%[0-9]%' OR WH.PostalCode LIKE '%[Α-Ω]%' OR WH.PostalCode LIKE '%[α-ω]%' OR WH.PostalCode LIKE '%`%' THEN '00000' ELSE ISNULL(REPLACE (WH.PostalCode,' ',''),'00000') COLLATE Greek_CI_AS END  = GI.Post_Code












GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_TRGMDL_Dates', @level2type=N'COLUMN',@level2name=N'CL_Year_Name'
GO
USE [master]
GO
ALTER DATABASE [Targit_Model_Empty] SET  READ_WRITE 
GO
