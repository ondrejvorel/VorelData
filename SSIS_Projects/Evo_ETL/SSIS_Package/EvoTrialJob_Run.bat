@ECHO OFF
CLS
ECHO You are about to execute the EvoTrialJob SSIS package
PAUSE
"C:\Program Files (x86)\Microsoft SQL Server\140\DTS\Binn\DTEXEC.exe" /File %~dp0\EvoTrialJob_ETL.dtsx /conf %~dp0\EvoTrialJob_Conf.dtsconfig  /Decrypt "EvoTrial123"
PAUSE