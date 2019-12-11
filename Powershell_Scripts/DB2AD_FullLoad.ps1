################################################################################# FUNCTIONS #################################################################################

# Find-ADUser - Define AD User attributes based on DB values.
Function Find-ADUser ([psobject]$DB_Values) {

    $LoginName = $DB_Values.LoginName
    $TempPW = $DB_Values.temppw
    $SearchUser = Get-ADUser -Filter {SamAccountName -eq $LoginName}

    Write-Host "`tLoad DB record for login '$LoginName' into AD (Active Directory)" -ForegroundColor Magenta
    Write-Host "`tLogin '$LoginName' is part of AD - " -NoNewline; 
    If ($SearchUser -eq $Null) {
        Write-Host "NO" -ForegroundColor Red
        New-ADUser -Name $LoginName -Enabled $True -AccountPassword (ConvertTo-SecureString -AsPlainText $TempPW -Force) -OtherAttributes @{c = 'GR';co = 'Greece';countrycode = 124}
        $ADUser = Get-ADUser -Identity $LoginName -Properties *
        Write-Host "`t-> User with login '$LoginName' has been created in AD" -ForegroundColor Yellow} 
    Else {
        Write-Host "YES" -ForegroundColor Green
        $ADUser = Get-ADUser -Identity $LoginName -Properties *}

    $ADUser.UserPrincipalName = $DB_Values.LoginName+'@'+$DB_Values.Domain
    $ADUser.Enabled = -not$DB_Values.accountdisabled
    $ADUser.LockedOut = $DB_Values.unlockAccount
    $ADUserMustChangePW = $DB_Values.mustchangepw
    $ADUser.CannotChangePassword = $DB_Values.ccp
    $ADUser.PasswordNeverExpires = $DB_Values.pne
    $ADUser.StreetAddress = $DB_Values.StreetAddress
    $ADUser.POBox = $DB_Values.StreetAddress2
    $ADUser.City = $DB_Values.City
    $ADUser.State = $DB_Values.Province
    $ADUser.PostalCode = $DB_Values.PostalCode
    $ADUser.GivenName = $DB_Values.FirstName
    $ADUser.Surname = $DB_Values.LastName
    $ADUser.DisplayName = $DB_Values.FullName
    $ADUser.HomePhone = $DB_Values.HomePhone
    $ADUser.pager = $DB_Values.Pager
    $ADUser.mobile = $DB_Values.MobilePhone
    $ADUser.info = $DB_Values.notes
    $ADUser.Description = $DB_Values.Description
    $ADUser.HomeDrive = $DB_Values.PersonalStorageDrive+':'
    $ADUser.HomeDirectory = $DB_Values.PersonalStorage
    $ADUser.Department = $DB_Values.Department

    Write-Host "`t-> All atributes in AD has been updated`n" -ForegroundColor Yellow

    return $ADUser 
}

# Update-ADOU - Create or update user OU (organizational unit).
Function Update-ADOU ([psobject]$User, [string]$DomainName, [string]$AccountOU) {

    $TargetOU = "OU=$AccountOU,DC=$DomainName,DC=Com"
    #$ADOUs = Get-ADOrganizationalUnit -Filter * -Properties *
    $ADOUs = Get-ADOrganizationalUnit -Filter * | select name
    $LoginName = $User.SamAccountName

    Write-Host "`tAssign login '$LoginName' to corresponding OU (Organizational Unit)" -ForegroundColor Magenta
    Write-Host "`tOU '$TargetOU' is part of Active Directory - " -NoNewline;
    if ($AccountOU -In $ADOUs.name) {
        Write-Host "YES" -ForegroundColor Green        
            Move-ADObject -Identity $User -TargetPath $TargetOU
        Write-Host "`t-> Login '$LoginName' has been assign to OU '$TargetOU'`n" -ForegroundColor Yellow}
    else {
        Write-Host "YES" -ForegroundColor Green
            New-ADOrganizationalUnit $AccountOU
            Move-ADObject -Identity $User -TargetPath $TargetOU
        Write-Host "`t-> New OU '$TargetOU' has been created" -ForegroundColor Yellow
        Write-Host "`t-> Login '$LoginName' has been assign to OU '$TargetOU'`n" -ForegroundColor Yellow}
}

Function Update-ADGroup ([string]$Login, [psobject]$LoginPrimaryGroupDN, [string]$SecurityGroup) {

    # Get the list of all available AD groups
    $AdGroupsList = Get-ADGroup -filter * -properties GroupCategory | select name
    
    if ([string]::IsNullOrEmpty($SecurityGroup)) {
        Write-Host "`tLogin '$Login' has no assigned groups in DB table 'dbo.tblemployeeSG'`n" -ForegroundColor Magenta}
    else {    
        $MemberOf = $SecurityGroup.split(",")
        $MemberOfText = $MemberOf -join ''','''
        Write-Host "`tLogin '$Login' should be assignd to the following AD groups - '$MemberOfText'" -ForegroundColor Magenta

        foreach ($Group in $MemberOf) {
    
	        # Check if the DB group is available within AD groups
            Write-Host "`tGroup '$Group' is part of Active Directory - " -NoNewline; 
            if ($Group -In $AdGroupsList.name) {

                # If the DB group is available within AD groups -> Get all members for the specific group
                Write-Host "YES" -ForegroundColor Green
                $GroupMembers = Get-AdGroupMember -identity $Group | select SamAccountName

                # If the User Account is not part of the AD Group yet -> Add him as a member
                if ($Login -In $GroupMembers.SamAccountName) {
                    Write-Host "`tLogin '$Login' is member of the group '$Group' - " -NoNewline; Write-Host "YES" -ForegroundColor Green
                    Write-Host "`t-> No update needed`n" -ForegroundColor Yellow}
                else {
			        Write-Host "`tLogin '$Login' is member of the group '$Group' - " -NoNewline; Write-Host "NO" -ForegroundColor Red
                        Add-ADGroupMember -Identity $Group -Members $Login
                    Write-Host "`t-> Login '$Login' has been added`n" -ForegroundColor Yellow}}
            else {

		        # If the DB group is not available within AD groups -> Create the new AD group and add the new member
                Write-Host "NO" -ForegroundColor Red
                    New-ADGroup -Name $Group -SamAccountName $Group -GroupCategory Security -GroupScope Global -DisplayName $Group -Path "DC=Voreldata,DC=Com"
                Write-Host "`t-> New group '$Group' had been created" -ForegroundColor Yellow
                    Add-ADGroupMember -Identity $Group -Members $Login 
                Write-Host "`t-> Login '$Login' has been assigned to the new group '$Group'`n" -ForegroundColor Yellow}}}

        # If the list of Account AD Groups are not part of DB table 'dbo.tblemployeeSG' -> Then remove the account from the group
        Write-Host "`tCheck if all the Active Directory groups for login '$Login' are sync with DB table 'dbo.tblemployeeSG'" -ForegroundColor Magenta
        $LoginGroupsAD = Get-ADPrincipalGroupMembership $Login | select name
        $LoginPG = Get-ADGRoup -Identity $LoginPrimaryGroupDN -Properties SamAccountName

        foreach ($GroupAD in $LoginGroupsAD.name) {
            
            Write-Host "`tGroup '$GroupAD' is available in DB - " -NoNewline
            if ($GroupAD -In $MemberOf) {
                Write-Host "YES" -ForegroundColor Green
                Write-Host "`t-> No update needed`n" -ForegroundColor Yellow}
            else {
                if ($GroupAD -eq $LoginPG.SamAccountName) {
                    Write-Host "NO" -ForegroundColor Red
                    Write-Host "`t-> Cannot be removed from the AD account as it is the PRIMARY GROUP`n" -ForegroundColor Yellow}
                else {
                    Write-Host "NO" -ForegroundColor Red
                        Remove-ADGroupMember -Identity $GroupAD -Members $Login -Confirm:$false
                    Write-Host "`t-> It has been sucessfuly removed from the AD account`n" -ForegroundColor Yellow}}}
}

Function Execute-SQL ([string]$DB_Server, [string]$DB_Name, [string]$DB_UserID, [string]$DB_Password) {

    $SqlCommand = 
        "WITH CTE AS (
	        SELECT DISTINCT ESG2.tblemployeesiID, 
	        SUBSTRING((
		        SELECT ','+ESG1.SecurityGroup
		        FROM dbo.tblemployeeSG ESG1
		        WHERE ESG1.tblemployeesiID = ESG2.tblemployeesiID
		        ORDER BY ESG1.tblemployeesiID
		        FOR XML PATH ('')
	        ),2,1000) SecurityGroup
	        FROM dbo.tblemployeeSG ESG2
        )

        SELECT 
	        ES.tblemployeeID,
	        ES.LoginName,
            Domain = 'integracheck.ca',
	        ES.temppw,
	        ES.accountdisabled,
	        ES.unlockAccount,
	        ES.mustchangepw,
	        ES.ccp,
	        ES.pne,
	        ES.[Description],
	        ES.Department,
            ES.OU,
	        E.FirstName,
	        E.LastName,
	        E.FullName,
	        EI.StreetAddress,
	        EI.StreetAddress2,
	        EI.City,
	        EI.Province,
	        EI.PostalCode,
	        EI.HomePhone,
	        EI.Pager,
	        EI.MobilePhone,
	        EI.notes,
	        EI.PersonalStorageDrive,
            EI.PersonalStorage,
	        ESG.SecurityGroup
        FROM dbo.tblemployeesi AS ES 
        LEFT JOIN dbo.tblemployee AS E ON ES.tblemployeeID = E.tblemployeeID
        LEFT JOIN dbo.tblemployeeinfo AS EI ON E.tblemployeeID = EI.tblemployeeID
        LEFT JOIN CTE AS ESG ON ES.tblemployeesiID = ESG.tblemployeesiID
        --WHERE ES.LoginName IN ('jriopelle')" ### DELETE WHERE CONDITION ###

    $ConnectionString = "Server = $DB_Server; Database = $DB_Name; Integrated Security = True; User ID = $DB_UserID; Password = $DB_Password; Trusted_Connection=False; Encrypt=True;"
    #$ConnectionString = "Data Source=$DB_Server; Integrated Security=SSPI; Initial Catalog=DB_Name"

    $Connection = new-object system.data.SqlClient.SQLConnection($ConnectionString)
    $Command = new-object system.data.sqlclient.sqlcommand($SqlCommand,$Connection)
    $Connection.Open()
    $Adapter = New-Object System.Data.sqlclient.sqlDataAdapter $Command
    $Dataset = New-Object System.Data.DataSet
    $Adapter.Fill($Dataset) | Out-Null
    $Connection.Close()
    $Dataset.Tables
}

################################################################################# SCRIPT BODY #################################################################################
# 1. Define Connection Variables
$DomainName = 'Voreldata'
$DB_Server = "********"
$DB_Name = "myDB"
$DB_UserID "********"
$DB_Password = "********"

# 2. Extract DB records and transfer them into array variable ($DB_Values).
$DB_RawValues = Execute-SQL $DB_Server $DB_Name $DB_UserID $DB_Password
$DB_Columns = $DB_RawValues.columns.ColumnName
$DB_Values = @($DB_RawValues | Select $DB_Columns)

# 3. Update all BLANK records from DB to NULL values. Otherwise the records cannot be used for AD insert.
ForEach ($DB_Value in $DB_Values) {
    ForEach ($DB_Column in $DB_Columns) {
		if([string]::IsNullOrEmpty($DB_Value.$DB_Column)) {
        $DB_Value.$DB_Column = $null}
}}

# 4. Take each row from database ($DB_Values) and proceed with ADUser, ADGroup and ADOU setting.
ForEach ($DB_Row In $DB_Values) {
    $LoginName = $DB_Row.LoginName
    Write-Host "Loading from Database to Active Directory - '$LoginName'`n" -BackgroundColor DarkCyan

    $User = Find-ADUser $DB_Row
    Set-ADUser -Instance $User
    Update-ADGroup $DB_Row.LoginName $User.PrimaryGroup $DB_Row.SecurityGroup
    Update-ADOU $User $DomainName $DB_Row.OU
}




