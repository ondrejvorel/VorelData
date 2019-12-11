USE TARGIT_MDL
GO

DECLARE @tmp_sp_help_jobhistory TABLE
(
    instance_id int null, 
    job_id uniqueidentifier null, 
    job_name sysname null, 
    step_id int null, 
    step_name sysname null, 
    sql_message_id int null, 
    sql_severity int null, 
    message nvarchar(4000) null, 
    run_status int null, 
    run_date int null, 
    run_time int null, 
    run_duration int null, 
    operator_emailed sysname null, 
    operator_netsent sysname null, 
    operator_paged sysname null, 
    retries_attempted int null, 
    server sysname null  
)

INSERT INTO @tmp_sp_help_jobhistory 
EXEC msdb.dbo.sp_help_jobhistory 
    @mode='FULL' 

/*
SELECT
    JH.instance_id AS [InstanceID],
    JH.sql_message_id AS [SqlMessageID],
    JH.message AS [Message],
    JH.step_id AS [StepID],
    JH.step_name AS [StepName],
    JH.sql_severity AS [SqlSeverity],
    JH.job_id AS [JobID],
    JH.job_name AS [JobName],
    JH.run_status AS [RunStatus],
    CASE JH.run_date WHEN 0 THEN NULL ELSE
    convert(datetime, 
            stuff(stuff(cast(JH.run_date as nchar(8)), 7, 0, '-'), 5, 0, '-') + N' ' + 
            stuff(stuff(substring(cast(1000000 + JH.run_time as nchar(7)), 2, 6), 5, 0, ':'), 3, 0, ':'), 
            120) END AS [RunDate],
    JH.run_duration AS [RunDuration],
    JH.operator_emailed AS [OperatorEmailed],
    JH.operator_netsent AS [OperatorNetsent],
    JH.operator_paged AS [OperatorPaged],
    JH.retries_attempted AS [RetriesAttempted],
    JH.server AS [Server],
    getdate() as [CurrentDate]
FROM @tmp_sp_help_jobhistory AS JH
WHERE step_id <> 0 
ORDER BY [InstanceID] DESC
*/

DELETE FROM tb_SYSMDL_SQLAgent_Jobs WHERE Job_ID IN (SELECT DISTINCT job_id FROM @tmp_sp_help_jobhistory)
INSERT INTO tb_SYSMDL_SQLAgent_Jobs
(Job_PKEY, Job_ID, Job_Name)
SELECT 
	ROW_NUMBER() OVER (PARTITION BY 1 ORDER BY JH.job_id) AS Job_PKEY,
	JH.job_id AS Job_ID,
	JH.job_name AS Job_Name
FROM 
	@tmp_sp_help_jobhistory AS JH
WHERE
	JH.step_id <> 0 
	AND CONVERT(DATE,CONVERT(VARCHAR(8),JH.run_date)) >= GETDATE()-5
GROUP BY 
	JH.job_id,
	JH.job_name


DELETE FROM tb_SYSMDL_SQLAgent_Job_History WHERE CAST(Run_Date_Full AS DATE) >= GETDATE()-5
INSERT INTO tb_SYSMDL_SQLAgent_Job_History
(Job_Step_PKEY, Execution_PKEY, Job_ID, Step_ID, Step_Sorter, Run_Date, Run_Time, Job_Name, Step_Name, /* Step_Type, */ History_Severity, History_Message, Run_Date_Full, Run_Duration_Seconds, Run_Duration_Time_Format, Retries, ExecutionStatus_ID)
SELECT 
	CAST(A.Job_PKEY AS VARCHAR(10)) + '/' + CAST(JH.Step_ID AS VARCHAR(10)) + '/' + LEFT(JH.Step_Name, 100) AS Job_Step_PKEY,
	CAST(A.Job_PKEY AS VARCHAR(10)) + '/' + CAST(JH.run_date AS VARCHAR(8)) +  '/' + CAST(JH.run_time AS VARCHAR(6)) AS Execution_PKEY,
	JH.job_id AS Job_ID,
	CAST(JH.Step_ID AS VARCHAR(10)) + '-' + LEFT(JH.Step_Name, 100) AS Step_ID,
	JH.Step_ID AS Step_Sorter,
	JH.run_date AS Run_Date,
	JH.run_time AS Run_Time,
	JH.job_name AS Job_Name,
	JH.step_name AS Step_Name,
	JH.sql_severity AS History_Severity,
	JH.[message] AS History_Message,
	msdb.dbo.agent_datetime(JH.run_date,JH.run_time) AS Run_Date_Full,
	JH.run_duration / 10000 * 3600 + JH.run_duration % 10000 / 100 * 60 + JH.run_duration % 100 AS Run_Duration_Seconds,
	RIGHT('00' + CAST(JH.run_duration/10000 AS VARCHAR(10)),2) 			-- Hours
	+ ':' + RIGHT('00' + CAST(run_duration/100%100 AS VARCHAR(10)),2) 	-- Minutes
	+ ':' + RIGHT('00' + CAST(run_duration%100 AS VARCHAR(10)),2) 		-- Seconds
	AS Run_Duration_Time_Format,
	JH.retries_attempted AS Retries,
	JH.run_status AS ExecutionStatus_ID	
FROM 
	@tmp_sp_help_jobhistory AS JH
	INNER JOIN tb_SYSMDL_SQLAgent_Jobs A WITH (NOLOCK) ON A.Job_ID = JH.job_id
WHERE
	JH.step_id <> 0 
	AND CONVERT(DATE,CONVERT(VARCHAR(8),JH.run_date)) >= GETDATE()-5

