# 0. Insert of AD User parameter 
param([string]$AD_User)

# 1. Define Connection Variables
$DomainName = 'Voreldata'
$DB_Server = "*****.database.windows.net"
$DB_Name = "myDB"
$DB_UserID ="*****"
$DB_Password = "*****"

# 2. Define Conection String variable
$ConnectionString = "Server = $DB_Server; Database = $DB_Name; Integrated Security = True; User ID = $DB_UserID; Password = $DB_Password; Trusted_Connection=False; Encrypt=True;"

# 3. Connect to DB and select corresponding data (LoginName,temppw,unlockAccount)
$SqlCommand = "SELECT LoginName,temppw,unlockAccount FROM dbo.tblemployeesi WHERE LoginName = '$AD_User'"
$Connection = new-object system.data.SqlClient.SQLConnection($ConnectionString)
$Command = new-object system.data.sqlclient.sqlcommand($SqlCommand,$Connection)
$Connection.Open()
$Adapter = New-Object System.Data.sqlclient.sqlDataAdapter $Command
$Dataset = New-Object System.Data.DataSet
$RowCount = $Adapter.Fill($Dataset) #| Out-Null
$Connection.Close()

# 4. Check if database contains corresponding data for requested LogonName
$DB_Values = $Dataset.Tables
If($RowCount -gt 0) {

    Write-Host "Database table ""dbo.tblemployeesi"" contains following records for LoginName ""$AD_User"":" -ForegroundColor Green 
    Write-Host "`t LoginName: ""$($DB_Values.LoginName)""`n`t temppw: ""$($DB_Values.temppw)""`n`t unlockAccount: ""$($DB_Values.unlockAccount)""`n"
    
    # 5. Check if Active Directory contains corresponding data for requested LogonName     
    $AD_User_Check = Get-ADUser -Filter 'SamAccountName -eq $AD_User'
    If ($AD_User_Check -ne $Null) {
        
        Write-Host "Active Directory contains the user with LoginName ""$AD_User""." -ForegroundColor Green 

        # 6. Update user AD Password based on database table dbo.tblemployeesi
        Set-ADAccountPassword -Identity $DB_Values.LoginName -NewPassword (ConvertTo-SecureString -AsPlainText $DB_Values.temppw -Force) -Reset

        # 7. Update user AD LockedOut parameter based on database table dbo.tblemployeesi
        $User = Get-ADUser -Identity $DB_Values.LoginName -Properties LockedOut
        $User.LockedOut = $DB_Values.unlockAccount
        Set-ADUser -Instance $User
        
        Write-Host "`t Active Directory ""UnlockAccount"" value has been sucessfuly updated to ""$($DB_Values.unlockAccount)""."}
    
    # 8. If LogonName is not available either in DB or AD, then display following messages
    Else {Write-Host "Active Directory does not contain user with LoginName ""$AD_User""." -ForegroundColor Red
          Write-Host "`tPlease create the user in Active Directory first and then you can run this script."}}
Else {Write-Host "Database table ""dbo.tblemployeesi"" contains no records for LoginName ""$AD_User""" -ForegroundColor Red} 









