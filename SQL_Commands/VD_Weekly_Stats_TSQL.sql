DECLARE @table_name_date AS NVARCHAR(20) = '20140905'
  
DECLARE @Final_1 AS NVARCHAR(1000);
DECLARE @Final_2 AS NVARCHAR(1000);
    
DECLARE @OutputCurrentDate AS NVARCHAR(1000);
DECLARE @OutputLastWeek AS NVARCHAR(1000);
    
DECLARE @CurrentDate AS NVARCHAR(1000) = @table_name_date
DECLARE @LastWeek AS NVARCHAR(10) = convert(varchar(10),DATEADD(day,-7,CONVERT(date,@table_name_date,112)),112)

DECLARE @DynamicParamdecFinal_1 AS NVARCHAR(1000) ='@Finalname1 varchar(100) output';
DECLARE @DynamicParamdecFinal_2 AS NVARCHAR(1000) ='@Finalname2 varchar(100) output';

SET @Final_1 = N'SELECT @Finalname1 = name FROM sysobjects
					WHERE name LIKE ''%' + @CurrentDate + '%''
					AND type = ''U''
					AND name LIKE ''Final%'' ';
EXEC sp_executesql @Final_1,@DynamicParamdecFinal_1, @OutputCurrentDate OUTPUT;
	
SET @Final_2 = N'SELECT @Finalname2 = name FROM sysobjects
					WHERE name LIKE ''%' + @LastWeek + '%''
					AND type = ''U''
					AND name LIKE ''Final%'' ';
EXEC sp_executesql @Final_2,@DynamicParamdecFinal_2, @OutputLastWeek OUTPUT;
	
--------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE #CurrentWeekBasic
(CountryID nvarchar(10), CallCountCurrentBasic int);

CREATE TABLE #PreviousWeekBasic
(CountryID nvarchar(10), CallCountPreviousBasic int);

CREATE TABLE #CurrentWeekAdvanced
(CountryID nvarchar(10), CallCountCurrentAdvanced int);

CREATE TABLE #PreviousWeekAdvanced
(CountryID nvarchar(10), CallCountPreviousAdvanced int);

--------------------------------------------------------------------------------------------------------------------------------------------------------
    DECLARE @cmd1 AS NVARCHAR(1000);
    DECLARE @cmd2 AS NVARCHAR(1000);
    DECLARE @cmd3 AS NVARCHAR(1000);
    DECLARE @cmd4 AS NVARCHAR(1000);
    DECLARE @cmd5 AS NVARCHAR(1000);
    DECLARE @cmd6 AS NVARCHAR(1000);


SET @cmd1 = N' 
INSERT INTO #CurrentWeekBasic
SELECT CountryID, Count(*) as CallCountCurrentBasic
FROM Final.dbo.'+ @OutputCurrentDate +'
WHERE Tier = ''Basic''
GROUP BY CountryID';

EXEC sp_executesql @cmd1;


SET @cmd2 = N' 
INSERT INTO #PreviousWeekBasic
SELECT CountryID, Count(*) as CallCountPreviousBasic
FROM Final.dbo.'+ @OutputLastWeek +'
WHERE Tier = ''Basic''
GROUP BY CountryID';

EXEC sp_executesql @cmd2;

SET @cmd3 = N' 
INSERT INTO #CurrentWeekAdvanced
SELECT CountryID, Count(*) as CallCountCurrentAdvanced
FROM Final.dbo.'+ @OutputCurrentDate +'
WHERE Tier = ''Advanced''
GROUP BY CountryID';

EXEC sp_executesql @cmd3;

SET @cmd4 = N' 
INSERT INTO #PreviousWeekAdvanced
SELECT CountryID, Count(*) as CallCountPreviousAdvanced
FROM Final.dbo.'+ @OutputLastWeek +'
WHERE Tier = ''Advanced''
GROUP BY CountryID';

EXEC sp_executesql @cmd4;

--------------------------------------------------------------------------------------------------------------------------------------------------------
SET @cmd5 = N'	
SELECT 
	C.CountryID, 
	ISNULL(CB.CallCountCurrentBasic,0),
	ISNULL(PB.CallCountPreviousBasic,0),
	ISNULL(CA.CallCountCurrentAdvanced,0),
	ISNULL(PA.CallCountPreviousAdvanced,0),
	''Difference Basic'' = ISNULL(CB.CallCountCurrentBasic,0) - ISNULL(PB.CallCountPreviousBasic,0),
	''Difference Advanced'' = ISNULL(CA.CallCountCurrentAdvanced,0) - ISNULL(PA.CallCountPreviousAdvanced,0),
	''Difference Total'' = (ISNULL(CB.CallCountCurrentBasic,0) - ISNULL(PB.CallCountPreviousBasic,0)) + (ISNULL(CA.CallCountCurrentAdvanced,0) - ISNULL(PA.CallCountPreviousAdvanced,0))
FROM Final.dbo.Countries as C
LEFT JOIN #CurrentWeekBasic AS CB
	ON C.CountryID=CB.CountryID
LEFT JOIN #PreviousWeekBasic AS PB
	ON CB.CountryID=PB.CountryID
LEFT JOIN #CurrentWeekAdvanced AS CA
	ON CB.CountryID=CA.CountryID
LEFT JOIN #PreviousWeekAdvanced AS PA
	ON CB.CountryID=PA.CountryID
ORDER BY [Difference Total] desc';

EXEC sp_executesql @cmd5;

SET @cmd6 = N'		
DROP TABLE #CurrentWeekBasic
DROP TABLE #PreviousWeekBasic
DROP TABLE #CurrentWeekAdvanced
DROP TABLE #PreviousWeekAdvanced';

EXEC sp_executesql @cmd6;

	
