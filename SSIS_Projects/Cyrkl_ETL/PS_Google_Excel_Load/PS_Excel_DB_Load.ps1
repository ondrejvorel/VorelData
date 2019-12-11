$sqlServer = "vorelsqlserver.database.windows.net"
$sqlDbName = "myDB"
$uid ="*****"
$pwd = "******"
$dbAccess = "Server = $sqlServer; Database = $sqlDbName; Integrated Security = True; User ID = $uid; Password = $pwd; Trusted_Connection=False; Encrypt=True;"
$dbConnection = New-Object System.Data.SqlClient.SqlConnection("$dbAccess")
$dbTableName = '[myDB].[cyrkl].[1Stage_MailingListExt]'

$excelFilePath = 'D:\ETL\Cyrkl_ETL\PS_Google_Excel_Load\Files\Cyrkl_MailingListExt_Source.xlsx'
$excelAccess = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$excelFilePath;Extended Properties='Excel 12.0 Xml;HDR=YES;IMEX=1'"
$excelQuery = 'SELECT Email, Category FROM [Cyrkl_MailingListExt_Source$]'

Try {
	$excelConnection = New-Object System.Data.OleDb.OleDbConnection($excelAccess)
	$excelConnection.open()
	$excelCmd = $excelConnection.CreateCommand()
	$excelCmd.CommandText = $excelQuery
	$excelData = $excelCmd.ExecuteReader()
    
	
	$dbConnection.open() 
	$sqlCmd = New-Object System.Data.SQLClient.SQLCommand
	$sqlCmd.Connection = $dbConnection
	$sqlCmd.CommandText = "TRUNCATE TABLE {0};" -f $dbTableName;
	$sqlCmd.ExecuteNonQuery() | Out-Null
	$dbConnection.close()

	$sqlBulkCmd = New-Object System.Data.SqlClient.SqlBulkCopy($dbAccess, [System.Data.SqlClient.SqlBulkCopyOptions]::TableLock)
	$sqlBulkCmd.DestinationTableName = $dbTableName
	#$sqlBulkCmd.Batchsize = 1000
	#$sqlBulkCmd.BulkCopyTimeout = 60
	#$sqlBulkCmd.EnableStreaming=$true
   
	# add all  columns - you can  add as few  as you like.
	for ($i = 0; $i -lt $excelData.FieldCount; $i++) {
		$columnName = $excelData.GetName($i)
		Write-Host $columnName -ForegroundColor green
		[void]$sqlBulkCmd.ColumnMappings.Add($columnName, $columnName)
	}
    $sqlBulkCmd.WriteToServer($excelData)
    $excelConnection.Close()
    $excelData.Close()
	
} Catch {
     Write-Error "$_"
     [System.Environment]::Exit(1)
}


