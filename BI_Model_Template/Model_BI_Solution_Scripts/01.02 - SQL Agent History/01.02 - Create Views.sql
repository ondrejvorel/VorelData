USE TARGIT_MDL
GO

CREATE VIEW VIEW_SAGENT_FACT_SQLAgent_History_Logs AS
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

CREATE VIEW VIEW_SAGENT_FACT_SQLAgent_History_Logs_Over_Time AS
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

CREATE VIEW VIEW_SAGENT_DIM_Jobs_And_Steps AS
SELECT DISTINCT
	A.Job_Step_PKEY,
	A.Job_ID, 
	A.Step_ID AS Step_ID,
	A.Step_Sorter,
	A.Job_Name,
	A.Step_Name
FROM 
	tb_SYSMDL_SQLAgent_Job_History A WITH (NOLOCK)
GO

CREATE VIEW VIEW_SAGENT_DIM_ExecutionStatuses AS
SELECT * FROM tb_SYSMDL_SQLAgent_ExecutionStatuses WITH (NOLOCK)
GO

