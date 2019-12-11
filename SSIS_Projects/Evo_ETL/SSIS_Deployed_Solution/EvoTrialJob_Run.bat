@ECHO OFF

REM ------------ "Insert below corresponding values for MANDATORY variables" -----------

SET DtexecPath=C:\Program Files (x86)\Microsoft SQL Server\140\DTS\Binn\DTEXEC.exe
SET PackagePath=C:\ETL\EvoTrialJob_SSIS

REM ------------- "Insert below corresponding values for OPTIONAL variables" ------------

SET InputFileName=input.csv
SET OutputFileName_Category=category.csv
SET OutputFileName_Item=itemCategory.csv
SET Password=EvoTrial123

REM --------------------------------------------------------------------------------------
REM ------------- "The batch command code starts here, please do not change" -------------
REM --------------------------------------------------------------------------------------

ECHO You are about to execute the EvoTrialJob SSIS package

PAUSE

"%DtexecPath%" /File %~dp0\EvoTrialJob_SSIS.dtsx^
 /Set "\Package.Variables[User::PackagePath].Value;%PackagePath%"^
 /Set "\Package.Variables[User::InputFilePath].Value;\Input_Files\%InputFileName%"^
 /Set "\Package.Variables[User::OutputFilePath_Category].Value;\Output_Files\%OutputFileName_Category%"^
 /Set "\Package.Variables[User::OutputFilePath_Item].Value;\Output_Files\%OutputFileName_Item%"^
 /Decrypt "%Password%"
 
PAUSE





