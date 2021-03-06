TRUNCATE TABLE tb_TRGMDL_Dates
GO

DECLARE @My_Var INT
DECLARE @FL_MONTH_START INT
DECLARE @FL_WEEKDAY_START INT
DECLARE @First_Day_Of_Week INT = 1
DECLARE @FL_Reference_WeekDay_Number INT

SET @FL_MONTH_START = 5
SET @FL_WEEKDAY_START = 2			/*		1=Sun, 2=Mon, 3=Tue, 4=Wed, 5=Thu, 6=Fri, 7=Sat			*/

DECLARE @StartDateTime DATETIME
DECLARE @EndDateTime DATETIME

SET @StartDateTime = '2000-01-01'
SET @EndDateTime = '2050-12-31';	
SET DATEFIRST 7 ;

WITH DateRange(
	PKEY, 
	PK_Date, 
	CM_Date_Name,
	CM_MonthDay,
	CM_MonthDay_Name,

	CM_Month_Name,
	CM_Month_Abbr,
	CM_Month_Name_GR,
	CM_Month_Abbr_GR,

	CM_WeekDay_Name,
	CM_WeekDay_Abbr,
	CM_WeekDay_Name_GR,
	CM_WeekDay_Abbr_GR,

	CL_Year, 
	CL_Year_Name, 
	CL_Semester,
	CL_Semester_Name,
	CL_Quarter, 
	CL_Quarter_Name, 
	CL_Month, 
	CL_Week, 
	CL_Week_Name, 
	CL_WeekDay_Number, 

	FL_Year, 
	FL_Year_Name, 
	FL_Semester,
	FL_Semester_Name,
	FL_Quarter, 
	FL_Quarter_Name, 
	FL_Month, 	 
	FL_Week, 
	FL_Week_Name, 
	FL_WeekDay_Number, 

	ISO_Year,
	[ISO_Week], 
	ISO_Week_Name, 
	ISO_WeekDay_Number 

) AS 
(
-- FROM Date ------------------------------------------------------------------------------------------------
    SELECT
		CAST(CONVERT(VARCHAR(20), @StartDateTime, 112) AS INT) AS PKEY,	 
		@StartDateTime AS PK_Date,
-- Common Info ----------------------------------------------------------------------------------------------
		CONVERT(VARCHAR(20), @StartDateTime, 103) AS CM_Date_Name,
		DAY(@StartDateTime) AS CM_MonthDay,
		RIGHT('00' + CAST(DAY(@StartDateTime) AS VARCHAR(2)),2) AS CM_MonthDay_Name,

		DATENAME(MONTH, @StartDateTime) AS CM_Month_Name, 
		LEFT(DATENAME(MONTH, @StartDateTime),3) AS CM_Month_Abbr, 
		CASE MONTH(@StartDateTime)
			WHEN 1 THEN 'Ιανουάριος'
			WHEN 2 THEN 'Φεβρουάριος'
			WHEN 3 THEN 'Μάρτιος'
			WHEN 4 THEN 'Απρίλιος'
			WHEN 5 THEN 'Μάϊος'
			WHEN 6 THEN 'Ιούνιος'
			WHEN 7 THEN 'Ιούλιος'
			WHEN 8 THEN 'Άυγουστος'
			WHEN 9 THEN 'Σεπτέμβριος'
			WHEN 10 THEN 'Οκτώβριος'
			WHEN 11 THEN 'Νοέμβριος'
			WHEN 12 THEN 'Δεκέμβριος'
		END AS CM_Month_Name_GR,
		LEFT(CASE MONTH(@StartDateTime)
			WHEN 1 THEN 'Ιανουάριος'
			WHEN 2 THEN 'Φεβρουάριος'
			WHEN 3 THEN 'Μάρτιος'
			WHEN 4 THEN 'Απρίλιος'
			WHEN 5 THEN 'Μάιος'
			WHEN 6 THEN 'Ιούνιος'
			WHEN 7 THEN 'Ιούλιος'
			WHEN 8 THEN 'Άυγουστος'
			WHEN 9 THEN 'Σεπτέμβριος'
			WHEN 10 THEN 'Οκτώβριος'
			WHEN 11 THEN 'Νοέμβριος'
			WHEN 12 THEN 'Δεκέμβριος'
		END,3) AS CM_Month_Abbr_GR,

		DATENAME(WEEKDAY, @StartDateTime) AS CM_WeekDay_Name, 
		LEFT(DATENAME(WEEKDAY, @StartDateTime),3) AS CM_WeekDay_Abbr,
		CASE DATEPART(WEEKDAY, @StartDateTime)
			WHEN 1 THEN 'Κυριακή'
			WHEN 2 THEN 'Δευτέρα'
			WHEN 3 THEN 'Τρίτη'
			WHEN 4 THEN 'Τετάρτη'
			WHEN 5 THEN 'Πέμπτη'
			WHEN 6 THEN 'Παρασκευή'
			WHEN 7 THEN 'Σάββατο'
		END AS CM_Month_Name_GR,
		LEFT(CASE DATEPART(WEEKDAY, @StartDateTime)
			WHEN 1 THEN 'Κυριακή'
			WHEN 2 THEN 'Δευτέρα'
			WHEN 3 THEN 'Τρίτη'
			WHEN 4 THEN 'Τετάρτη'
			WHEN 5 THEN 'Πέμπτη'
			WHEN 6 THEN 'Παρασκευή'
			WHEN 7 THEN 'Σάββατο'
		END,3) AS CM_Month_Name_GR,

-- Calendar Year Info ---------------------------------------------------------------------------------------		 
		YEAR(@StartDateTime) AS CL_Year, 
		YEAR(@StartDateTime) AS CL_Year_Name, 
		CASE 
			WHEN MONTH(@StartDateTime) BETWEEN 1 AND 6 THEN 1
			WHEN MONTH(@StartDateTime) BETWEEN 7 AND 12 THEN 2
		END AS CL_Semester,
		CASE 
			WHEN MONTH(@StartDateTime) BETWEEN 1 AND 6 THEN 'SEM 1'
			WHEN MONTH(@StartDateTime) BETWEEN 7 AND 12 THEN 'SEM 2'
		END AS CL_Semester_Name,
		DATEPART(QUARTER, @StartDateTime) AS CL_Quarter, 
		'Q' + CAST(DATEPART(QUARTER, @StartDateTime) AS VARCHAR(2)) AS CL_Quarter_Name, 
		MONTH(@StartDateTime) AS CL_Month, 
		DATEPART(WEEK, @StartDateTime) AS CL_Week, 
		'W' + RIGHT('00' + CAST(DATEPART(WEEK, @StartDateTime) AS VARCHAR(2)),2) AS CL_Week_Name, 
		DATEPART(WEEKDAY, @StartDateTime) AS CL_WeekDay_Number, 

-- Fiscal Year Info -----------------------------------------------------------------------------------------	
		CASE 
			WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN YEAR(@StartDateTime)-1
			ELSE YEAR(@StartDateTime)
		END AS FL_Year,
		CASE 
			WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN CAST(YEAR(@StartDateTime)-1 AS VARCHAR(10)) + '/' + CAST(YEAR(@StartDateTime) AS VARCHAR(10))
			ELSE CAST(YEAR(@StartDateTime) AS VARCHAR(10)) + '/' + CAST(YEAR(@StartDateTime)+1 AS VARCHAR(10))
		END AS FL_Year_Name,
		CASE 
			WHEN	CASE 
						WHEN MONTH(@StartDateTime) = @FL_MONTH_START THEN 1 
						WHEN MONTH(@StartDateTime) > @FL_MONTH_START THEN MONTH(@StartDateTime) - @FL_MONTH_START + 1
						WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN 12 + (MONTH(@StartDateTime) - @FL_MONTH_START + 1)
						ELSE 0
					END  BETWEEN 1 AND 6 THEN 1
			ELSE 2
		END AS FL_Semester,
		CASE 
			WHEN	CASE 
						WHEN MONTH(@StartDateTime) = @FL_MONTH_START THEN 1 
						WHEN MONTH(@StartDateTime) > @FL_MONTH_START THEN MONTH(@StartDateTime) - @FL_MONTH_START + 1
						WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN 12 + (MONTH(@StartDateTime) - @FL_MONTH_START + 1)
						ELSE 0
					END  BETWEEN 1 AND 6 THEN 'SEM 1'
			ELSE 'SEM 2'
		END AS FL_Semester_Name,	 
		DATEPART(QUARTER, DATEADD(MONTH,
		CASE 
			WHEN MONTH(@StartDateTime) = @FL_MONTH_START THEN 1 
			WHEN MONTH(@StartDateTime) > @FL_MONTH_START THEN MONTH(@StartDateTime) - @FL_MONTH_START + 1
			WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN 12 + (MONTH(@StartDateTime) - @FL_MONTH_START + 1)
			ELSE 0
		END, '20000101')) AS FL_Quarter, 
		'Q' + CAST(		DATEPART(QUARTER, DATEADD(MONTH,
		CASE 
			WHEN MONTH(@StartDateTime) = @FL_MONTH_START THEN 1 
			WHEN MONTH(@StartDateTime) > @FL_MONTH_START THEN MONTH(@StartDateTime) - @FL_MONTH_START + 1
			WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN 12 + (MONTH(@StartDateTime) - @FL_MONTH_START + 1)
			ELSE 0
		END, '20000101')) AS VARCHAR(2)) AS FL_Quarter_Name,  
		CASE 
			WHEN MONTH(@StartDateTime) = @FL_MONTH_START THEN 1
			WHEN MONTH(@StartDateTime) > @FL_MONTH_START THEN MONTH(@StartDateTime) - @FL_MONTH_START + 1
			WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN 12 + (MONTH(@StartDateTime) - @FL_MONTH_START + 1)
			ELSE 0
		END AS FL_Month, 
		DATEPART(WEEK, @StartDateTime) AS FL_Week, 
		'W' + RIGHT('00' + CAST(DATEPART(WEEK, @StartDateTime) AS VARCHAR(2)),2) AS FL_Week_Name, 
		CASE 
			WHEN DATEPART(WEEKDAY, @StartDateTime) = @FL_WEEKDAY_START THEN 1
			WHEN DATEPART(WEEKDAY, @StartDateTime) > @FL_WEEKDAY_START THEN DATEPART(WEEKDAY, @StartDateTime) - @FL_WEEKDAY_START + 1
			WHEN DATEPART(WEEKDAY, @StartDateTime) < @FL_WEEKDAY_START THEN 7 + (DATEPART(WEEKDAY, @StartDateTime) - @FL_WEEKDAY_START + 1)
			ELSE 0
		END AS FL_WeekDay_Number,

-- ISO Week Info --------------------------------------------------------------------------------------------
		CASE 
			WHEN DATEPART(ISO_WEEK, @StartDateTime) NOT IN (1,52,53) THEN YEAR(@StartDateTime)
			WHEN DATEPART(ISO_WEEK, @StartDateTime) = 1  THEN YEAR(DATEADD(DAY,30, @StartDateTime))
			WHEN DATEPART(ISO_WEEK, @StartDateTime) IN (52,53) THEN YEAR(DATEADD(DAY,-30, @StartDateTime))
		END AS ISO_Year,
		DATEPART(ISO_WEEK, @StartDateTime) AS [ISO_Week], 
		'W' + RIGHT('00' + CAST(DATEPART(ISO_WEEK, @StartDateTime) AS VARCHAR(2)),2) AS ISO_Week_Name, 
		CASE 
			WHEN DATEPART(WEEKDAY, @StartDateTime) = 1 THEN 7 
			ELSE DATEPART(WEEKDAY, @StartDateTime)-1
		END AS ISO_WeekDay_Number

UNION ALL

-- TO Date ------------------------------------------------------------------------------------------------
    SELECT
		CAST(CONVERT(VARCHAR(20), DATEADD(d,1,PK_Date), 112) AS INT) AS PKEY,	 
		DATEADD(d,1,PK_Date) AS PK_Date, 
-- Common Info ----------------------------------------------------------------------------------------------
		CONVERT(VARCHAR(20), DATEADD(d,1,PK_Date), 103) AS CM_Date_Name,
		DAY(DATEADD(d,1,PK_Date)) AS CM_MonthDay,
		RIGHT('00' + CAST(DAY(DATEADD(d,1,PK_Date)) AS VARCHAR(2)),2) AS CM_MonthDay_Name,

		DATENAME(MONTH, DATEADD(d,1,PK_Date)) AS CM_Month_Name, 
		LEFT(DATENAME(MONTH, DATEADD(d,1,PK_Date)),3) AS CM_Month_Abbr, 
		CASE MONTH(DATEADD(d,1,PK_Date))
			WHEN 1 THEN 'Ιανουάριος'
			WHEN 2 THEN 'Φεβρουάριος'
			WHEN 3 THEN 'Μάρτιος'
			WHEN 4 THEN 'Απρίλιος'
			WHEN 5 THEN 'Μάϊος'
			WHEN 6 THEN 'Ιούνιος'
			WHEN 7 THEN 'Ιούλιος'
			WHEN 8 THEN 'Άυγουστος'
			WHEN 9 THEN 'Σεπτέμβριος'
			WHEN 10 THEN 'Οκτώβριος'
			WHEN 11 THEN 'Νοέμβριος'
			WHEN 12 THEN 'Δεκέμβριος'
		END AS CM_Month_Name_GR,
		LEFT(CASE MONTH(DATEADD(d,1,PK_Date))
			WHEN 1 THEN 'Ιανουάριος'
			WHEN 2 THEN 'Φεβρουάριος'
			WHEN 3 THEN 'Μάρτιος'
			WHEN 4 THEN 'Απρίλιος'
			WHEN 5 THEN 'Μάιος'
			WHEN 6 THEN 'Ιούνιος'
			WHEN 7 THEN 'Ιούλιος'
			WHEN 8 THEN 'Άυγουστος'
			WHEN 9 THEN 'Σεπτέμβριος'
			WHEN 10 THEN 'Οκτώβριος'
			WHEN 11 THEN 'Νοέμβριος'
			WHEN 12 THEN 'Δεκέμβριος'
		END,3) AS CM_Month_Abbr_GR,

		DATENAME(WEEKDAY, DATEADD(d,1,PK_Date)) AS CM_WeekDay_Name, 
		LEFT(DATENAME(WEEKDAY, DATEADD(d,1,PK_Date)),3) AS CM_WeekDay_Abbr,
		CASE DATEPART(WEEKDAY, DATEADD(d,1,PK_Date))
			WHEN 1 THEN 'Κυριακή'
			WHEN 2 THEN 'Δευτέρα'
			WHEN 3 THEN 'Τρίτη'
			WHEN 4 THEN 'Τετάρτη'
			WHEN 5 THEN 'Πέμπτη'
			WHEN 6 THEN 'Παρασκευή'
			WHEN 7 THEN 'Σάββατο'
		END AS CM_Month_Name_GR,
		LEFT(CASE DATEPART(WEEKDAY, DATEADD(d,1,PK_Date))
			WHEN 1 THEN 'Κυριακή'
			WHEN 2 THEN 'Δευτέρα'
			WHEN 3 THEN 'Τρίτη'
			WHEN 4 THEN 'Τετάρτη'
			WHEN 5 THEN 'Πέμπτη'
			WHEN 6 THEN 'Παρασκευή'
			WHEN 7 THEN 'Σάββατο'
		END,3) AS CM_Month_Name_GR,

-- Calendar Year Info ---------------------------------------------------------------------------------------		 
		YEAR(DATEADD(d,1,PK_Date)) AS CL_Year, 
		YEAR(DATEADD(d,1,PK_Date)) AS CL_Year_Name, 
		CASE 
			WHEN MONTH(DATEADD(d,1,PK_Date)) BETWEEN 1 AND 6 THEN 1
			WHEN MONTH(DATEADD(d,1,PK_Date)) BETWEEN 7 AND 12 THEN 2
		END AS CL_Semester,
		CASE 
			WHEN MONTH(DATEADD(d,1,PK_Date)) BETWEEN 1 AND 6 THEN 'SEM 1'
			WHEN MONTH(DATEADD(d,1,PK_Date)) BETWEEN 7 AND 12 THEN 'SEM 2'
		END AS CL_Semester_Name,
		DATEPART(QUARTER, DATEADD(d,1,PK_Date)) AS CL_Quarter, 
		'Q' + CAST(DATEPART(QUARTER, DATEADD(d,1,PK_Date)) AS VARCHAR(2)) AS CL_Quarter_Name, 
		MONTH(DATEADD(d,1,PK_Date)) AS CL_Month, 
		DATEPART(WEEK, DATEADD(d,1,PK_Date)) AS CL_Week, 
		'W' + RIGHT('00' + CAST(DATEPART(WEEK, DATEADD(d,1,PK_Date)) AS VARCHAR(2)),2) AS CL_Week_Name, 
		DATEPART(WEEKDAY, DATEADD(d,1,PK_Date)) AS CL_WeekDay_Number, 

-- Fiscal Year Info -----------------------------------------------------------------------------------------	
		CASE 
			WHEN MONTH(DATEADD(d,1,PK_Date)) < @FL_MONTH_START THEN YEAR(DATEADD(d,1,PK_Date))-1
			ELSE YEAR(DATEADD(d,1,PK_Date))
		END AS FL_Year, 
		CASE 
			WHEN MONTH(DATEADD(d,1,PK_Date)) < @FL_MONTH_START THEN CAST(YEAR(DATEADD(d,1,PK_Date))-1 AS VARCHAR(10)) + '/' + CAST(YEAR(DATEADD(d,1,PK_Date)) AS VARCHAR(10))
			ELSE CAST(YEAR(DATEADD(d,1,PK_Date)) AS VARCHAR(10)) + '/' + CAST(YEAR(DATEADD(d,1,PK_Date))+1 AS VARCHAR(10))
		END AS FL_Year_Name, 
		CASE 
			WHEN	CASE 
						WHEN MONTH(DATEADD(d,1,PK_Date)) = @FL_MONTH_START THEN 1 
						WHEN MONTH(DATEADD(d,1,PK_Date)) > @FL_MONTH_START THEN MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1
						WHEN MONTH(DATEADD(d,1,PK_Date)) < @FL_MONTH_START THEN 12 + (MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1)
						ELSE 0
					END  BETWEEN 1 AND 6 THEN 1
			ELSE 2
		END AS FL_Semester,
		CASE 
			WHEN	CASE 
						WHEN MONTH(DATEADD(d,1,PK_Date)) = @FL_MONTH_START THEN 1 
						WHEN MONTH(DATEADD(d,1,PK_Date)) > @FL_MONTH_START THEN MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1
						WHEN MONTH(DATEADD(d,1,PK_Date)) < @FL_MONTH_START THEN 12 + (MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1)
						ELSE 0
					END  BETWEEN 1 AND 6 THEN 'SEM 1'
			ELSE 'SEM 2'
		END AS FL_Semester_Name,
		DATEPART(QUARTER, DATEADD(MONTH,
		CASE 
			WHEN MONTH(DATEADD(d,1,PK_Date)) = @FL_MONTH_START THEN 1 
			WHEN MONTH(DATEADD(d,1,PK_Date)) > @FL_MONTH_START THEN MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1
			WHEN MONTH(DATEADD(d,1,PK_Date)) < @FL_MONTH_START THEN 12 + (MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1)
			ELSE 0
		END, '20000101')) AS FL_Quarter, 
		'Q' + CAST(		DATEPART(QUARTER, DATEADD(MONTH,
		CASE 
			WHEN MONTH(DATEADD(d,1,PK_Date)) = @FL_MONTH_START THEN 1 
			WHEN MONTH(DATEADD(d,1,PK_Date)) > @FL_MONTH_START THEN MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1
			WHEN MONTH(DATEADD(d,1,PK_Date)) < @FL_MONTH_START THEN 12 + (MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1)
			ELSE 0
		END, '20000101')) AS VARCHAR(2)) AS FL_Quarter_Name,  
		CASE 
			WHEN MONTH(DATEADD(d,1,PK_Date)) = @FL_MONTH_START THEN 1 
			WHEN MONTH(DATEADD(d,1,PK_Date)) > @FL_MONTH_START THEN MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1
			WHEN MONTH(DATEADD(d,1,PK_Date)) < @FL_MONTH_START THEN 12 + (MONTH(DATEADD(d,1,PK_Date)) - @FL_MONTH_START + 1)
			ELSE -1
		END AS FL_Month, 
		DATEPART(WEEK, DATEADD(d,1,PK_Date)) AS FL_Week, 
		'W' + RIGHT('00' + CAST(DATEPART(WEEK, DATEADD(d,1,PK_Date)) AS VARCHAR(2)),2) AS FL_Week_Name, 
		CASE 
			WHEN DATEPART(WEEKDAY, DATEADD(d,1,PK_Date)) = @FL_WEEKDAY_START THEN 1 
			WHEN DATEPART(WEEKDAY, DATEADD(d,1,PK_Date)) > @FL_WEEKDAY_START THEN DATEPART(WEEKDAY, DATEADD(d,1,PK_Date)) - @FL_WEEKDAY_START + 1
			WHEN DATEPART(WEEKDAY, DATEADD(d,1,PK_Date)) < @FL_WEEKDAY_START THEN 7 + (DATEPART(WEEKDAY, DATEADD(d,1,PK_Date)) - @FL_WEEKDAY_START + 1)
			ELSE -1
		END AS FL_WeekDay_Number,

-- ISO Week Info --------------------------------------------------------------------------------------------
		CASE 
			WHEN DATEPART(ISO_WEEK, DATEADD(d,1,PK_Date)) NOT IN (1,52,53) THEN YEAR(DATEADD(d,1,PK_Date))
			WHEN DATEPART(ISO_WEEK, DATEADD(d,1,PK_Date)) = 1  THEN YEAR(DATEADD(DAY,30, DATEADD(d,1,PK_Date)))
			WHEN DATEPART(ISO_WEEK, DATEADD(d,1,PK_Date)) IN (52,53) THEN YEAR(DATEADD(DAY,-30, DATEADD(d,1,PK_Date)))
		END AS ISO_Year,
		DATEPART(ISO_WEEK, DATEADD(d,1,PK_Date)) AS [ISO_Week], 
		'W' + RIGHT('00' + CAST(DATEPART(ISO_WEEK, DATEADD(d,1,PK_Date)) AS VARCHAR(2)),2) AS ISO_Week_Name, 
		CASE 
			WHEN DATEPART(WEEKDAY, DATEADD(d,1,PK_Date)) = 1 THEN 7 
			ELSE DATEPART(WEEKDAY, DATEADD(d,1,PK_Date))-1
		END AS ISO_WeekDay_Number
    FROM DateRange 
    WHERE PK_Date < @EndDateTime
)
INSERT INTO tb_TRGMDL_Dates
(
	PKEY, PK_Date, CM_Date_Name, CM_MonthDay, CM_MonthDay_Name, CL_Week_Of_Month, FL_Week_Of_Month,
	CM_Month_Name, CM_Month_Abbr, CM_Month_Name_GR, CM_Month_Abbr_GR,
	CM_WeekDay_Name, CM_WeekDay_Abbr, CM_WeekDay_Name_GR, CM_WeekDay_Abbr_GR,
	CL_Year, CL_Year_Name, CL_Semester, CL_Semester_Name, CL_Quarter, CL_Quarter_Name, CL_Month, CL_Week, CL_Week_Name, CL_WeekDay_Number, 
	FL_Year, FL_Year_Name, FL_Semester, FL_Semester_Name, FL_Quarter, FL_Quarter_Name, FL_Month, FL_Week, FL_Week_Name, FL_WeekDay_Number,
	ISO_Year, ISO_Week, ISO_Week_Name, ISO_WeekDay_Number
)
SELECT TOP 100 PERCENT
	T.PKEY, T.PK_Date, T.CM_Date_Name, T.CM_MonthDay, T.CM_MonthDay_Name, 
	DENSE_RANK() OVER (PARTITION BY CL_Year, CL_Month  ORDER BY CASE 
																			WHEN CL_Month = 1 AND CL_Week > 49 THEN 0
																			WHEN CL_Month = 12 AND CL_Week < 20 THEN 99 
																			ELSE CL_Week 
																END) 
	AS CL_Week_Of_Month,
	DENSE_RANK() OVER (PARTITION BY FL_Year, FL_Month  ORDER BY CASE 
																			WHEN FL_Month = 1 AND FL_Week > 49 THEN 0
																			WHEN FL_Month = 12 AND FL_Week < 20 THEN 99 
																			ELSE FL_Week 
																END) 
	AS FL_Week_Of_Month,
	T.CM_Month_Name, T.CM_Month_Abbr, T.CM_Month_Name_GR, T.CM_Month_Abbr_GR,
	T.CM_WeekDay_Name, T.CM_WeekDay_Abbr, T.CM_WeekDay_Name_GR, T.CM_WeekDay_Abbr_GR,
	T.CL_Year, T.CL_Year_Name, T.CL_Semester, T.CL_Semester_Name, T.CL_Quarter, T.CL_Quarter_Name, T.CL_Month, T.CL_Week, T.CL_Week_Name, T.CL_WeekDay_Number, 
	T.FL_Year, T.FL_Year_Name, T.FL_Semester, T.FL_Semester_Name, T.FL_Quarter, T.FL_Quarter_Name, T.FL_Month, T.FL_Week, T.FL_Week_Name, T.FL_WeekDay_Number,
	T.ISO_Year, T.ISO_Week, T.ISO_Week_Name, T.ISO_WeekDay_Number
FROM DateRange T WITH (NOLOCK) --WHERE PK_Date BETWEEN '20170501' AND '20170531'
ORDER BY PK_Date
OPTION (MAXRECURSION 0)

/* ------------------------------------ Below Fiscal Week Information is Generated ---------------------------------------------------- */

-- Find/Set which Day the weeks start ---------------------------------------------------------------------------
SET @My_Var = 	CASE @FL_WEEKDAY_START
					WHEN 1 THEN 7 
					WHEN 2 THEN 1 
					WHEN 3 THEN 2
					WHEN 4 THEN 3
					WHEN 5 THEN 4
					WHEN 6 THEN 5
					WHEN 7 THEN 6
				END

SET DATEFIRST @My_Var ;

-- Find the 1st week day of the 1st complete fiscal year we find in tb_TRGMDL_Dates -----------------------------
SELECT @FL_Reference_WeekDay_Number = FL_WeekDay_Number
FROM tb_TRGMDL_Dates WITH (NOLOCK) 
WHERE PK_DATE IN (
					SELECT MIN(PK_Date) 
					FROM tb_TRGMDL_Dates WITH (NOLOCK) 
					WHERE FL_Year =		CASE 
											WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN YEAR(@StartDateTime)
											ELSE YEAR(@StartDateTime) + 1
										END 
				)

-- Initiallize Fiscal Weeks --------------------------------------------------------------------------------------
UPDATE tb_TRGMDL_Dates SET
	FL_Week = 0

-- Start Updating Fiscal Week Information ------------------------------------------------------------------------
UPDATE tb_TRGMDL_Dates SET
	FL_Week = B.FL_Week
FROM
	tb_TRGMDL_Dates A WITH (NOLOCK)
	INNER JOIN	(
					SELECT 
						PKEY,
						ROW_NUMBER() OVER (PARTITION BY FL_Year ORDER BY FL_Year) AS FL_Week
					FROM tb_TRGMDL_Dates WITH (NOLOCK)
					WHERE 
						FL_WeekDay_Number = @FL_Reference_WeekDay_Number
						AND FL_Year >=	CASE 
											WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN YEAR(@StartDateTime)
											ELSE YEAR(@StartDateTime) + 1
										END
				) B ON A.PKEY = B.PKEY

-- Update the 1st Fiscal Year in tb_TRGMDL_Dates Which we omited because it was not complete ---------------------
UPDATE tb_TRGMDL_Dates SET 
	FL_Week = 52
FROM 
	tb_TRGMDL_Dates A WITH (NOLOCK)
	INNER JOIN	(
					SELECT 
						MAX(PKEY) AS PKEY
					FROM 
						tb_TRGMDL_Dates WITH (NOLOCK)
					WHERE 
						FL_WeekDay_Number = 1 
						AND FL_Year =	CASE 
											WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN YEAR(@StartDateTime)-1
											ELSE YEAR(@StartDateTime)
										END
				) SRC ON A.PKEY = SRC.PKEY


UPDATE tb_TRGMDL_Dates SET
	tb_TRGMDL_Dates.FL_Week = B.FL_Week
FROM
	tb_TRGMDL_Dates WITH (NOLOCK)
	INNER JOIN	(
					SELECT 
						PKEY,
						53-ROW_NUMBER() OVER (PARTITION BY FL_Year ORDER BY FL_Year, PKEY DESC) AS FL_Week
					FROM tb_TRGMDL_Dates WITH (NOLOCK)
					WHERE 
						FL_WeekDay_Number = 1
						AND FL_Year =	CASE 
											WHEN MONTH(@StartDateTime) < @FL_MONTH_START THEN YEAR(@StartDateTime)-1
											ELSE YEAR(@StartDateTime)
										END
				) B ON tb_TRGMDL_Dates.PKEY = B.PKEY


UPDATE tb_TRGMDL_Dates SET
	tb_TRGMDL_Dates.FL_Week = B.FL_Week,
	tb_TRGMDL_Dates.FL_Week_Name = 'W' + RIGHT('00' + CAST(B.FL_Week AS VARCHAR(2)),2)
FROM 
	tb_TRGMDL_Dates WITH (NOLOCK) 
	INNER JOIN tb_TRGMDL_Dates B WITH (NOLOCK) ON DATEADD(DAY, -(tb_TRGMDL_Dates.FL_WeekDay_Number - @FL_Reference_WeekDay_Number), tb_TRGMDL_Dates.PK_Date) = B.PK_Date

DECLARE @MyWeek INT

SELECT @MyWeek = FL_Week - 1
FROM tb_TRGMDL_Dates WITH (NOLOCK) 
WHERE
	PK_Date = (SELECT DATEADD(DAY, 1, MAX(PK_Date)) FROM tb_TRGMDL_Dates WITH (NOLOCK) WHERE FL_Week = 0)

UPDATE tb_TRGMDL_Dates SET
	FL_Week = @MyWeek,
	FL_Week_Name = 'W' + RIGHT('00' + CAST(@MyWeek AS VARCHAR(2)),2)
WHERE FL_Week = 0


UPDATE tb_TRGMDL_Dates SET
	FL_Week_Of_Month = B.FL_Week_Of_Month
FROM 
	tb_TRGMDL_Dates A WITH (NOLOCK)
	INNER JOIN	(
					SELECT TOP 100 PERCENT
						T.PKEY,
						DENSE_RANK() OVER (PARTITION BY FL_Year, FL_Month  ORDER BY CASE 
																								WHEN FL_Month = 1 AND FL_Week > 49 THEN 0
																								WHEN FL_Month = 12 AND FL_Week < 20 THEN 99 
																								ELSE FL_Week 
																					END) 
						AS FL_Week_Of_Month
					FROM tb_TRGMDL_Dates T WITH (NOLOCK) 
				) B ON A.PKEY = B.PKEY

-- Set Datefirst to Sunday again -----------------------------------------------------------------------------------------
SET DATEFIRST 7;


/* -------------------------------- END of Script ------------------------------------------------------------------------------------------------------------ */