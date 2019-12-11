USE TARGIT_MDL
GO

CREATE TABLE tb_SYSMDL_SQLAgent_Job_History
(
	PKEY bigint IDENTITY(1,1) NOT NULL,
	Execution_PKEY varchar(25) NULL,
	Job_Step_PKEY varchar(120) NULL,
	Run_Date int NULL,
	Run_Time int NULL,
	Job_ID uniqueidentifier NULL,
	Step_ID varchar(110) NULL,
	Step_Sorter int NULL,
	Run_Date_Full datetime NULL,
	Job_Name sysname NULL,
	Step_Name sysname NULL,
	Step_Type nvarchar(40) NULL,
	History_Severity int NULL,
	History_Message nvarchar(4000) NULL,
	Run_Duration_Seconds int NULL,
	Run_Duration_Time_Format varchar(8) NULL,
	ExecutionStatus_ID tinyint NULL,
	Retries int NULL,
 CONSTRAINT [PK_tb_SYSMDL_SQL_Agent_Job_History] PRIMARY KEY CLUSTERED 
(
	[PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE tb_SYSMDL_SQLAgent_Jobs
(
	Job_PKEY int NOT NULL,
	Job_ID uniqueidentifier NULL,
	Job_Name varchar(150) NULL,
 CONSTRAINT [PK_tb_SYSMDL_SQLAgent_Jobs] PRIMARY KEY CLUSTERED 
(
	[Job_PKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE tb_SYSMDL_SQLAgent_ExecutionStatuses
(
	ExecutionStatus_ID tinyint NOT NULL,
	ExecutionStatus_Description varchar(15) NULL,
 CONSTRAINT [PK_tb_SYSMDL_SQLAgent_ExecutionStatuses] PRIMARY KEY CLUSTERED 
(
	[ExecutionStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

TRUNCATE TABLE tb_SYSMDL_SQLAgent_ExecutionStatuses
INSERT tb_SYSMDL_SQLAgent_ExecutionStatuses (ExecutionStatus_ID, ExecutionStatus_Description) VALUES (0, N'Failed')
INSERT tb_SYSMDL_SQLAgent_ExecutionStatuses (ExecutionStatus_ID, ExecutionStatus_Description) VALUES (1, N'Succeeded')
INSERT tb_SYSMDL_SQLAgent_ExecutionStatuses (ExecutionStatus_ID, ExecutionStatus_Description) VALUES (2, N'Retry')
INSERT tb_SYSMDL_SQLAgent_ExecutionStatuses (ExecutionStatus_ID, ExecutionStatus_Description) VALUES (3, N'Canceled')
INSERT tb_SYSMDL_SQLAgent_ExecutionStatuses (ExecutionStatus_ID, ExecutionStatus_Description) VALUES (4, N'Running')
GO



