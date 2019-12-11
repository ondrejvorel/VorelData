Function Initiate-SQL ($SqlCommand) {
    $ConnectionString = "Server=$global:DB_Server; Database=$global:DB_Name;User ID=$global:DB_UserID;Password=$global:DB_Password;Encrypt=True;"
    $Connection = new-object system.data.SqlClient.SQLConnection($ConnectionString)
    $Command = new-object system.data.sqlclient.sqlcommand($SqlCommand,$Connection)
    $Connection.Open()
    $Adapter = New-Object System.Data.sqlclient.sqlDataAdapter $Command
    $Dataset = New-Object System.Data.DataSet
    $Adapter.Fill($Dataset) | Out-Null
    $Connection.Close()
    $Dataset.Tables
}

Function NewProducts-SQL () {

    $SqlCommand = 
	"SELECT
		[ID]=P.[ID],
		[CategoryID]=P.[CategoryID],
		[CategoryName]=C.[SystemName],
		[Nazev]=P.[Name],
		[Obrazek]='https://img.cyrkl.cz/images/product/'+CAST(P.[ID] AS NVARCHAR(10))+'/l1.jpg',
		[Popis]=P.[Perex],
		[Lokalita]=P.[City],
		[Cena]=	
			CASE 
			WHEN P.[PricingType]='agreement' THEN 'Dohodou'
			WHEN P.[PricingType]='per_unit' THEN CAST(CAST(P.[Price] AS INT) AS NVARCHAR(10))+N' Kč/'+P.[Unit]
			END COLLATE Latin1_General_CI_AS,
		[Mnozstvi] = CAST(P.[Quantity] AS NVARCHAR(10))+P.[Unit],
		[Doprava]=IIF(P.[ShippingAvailable]=1,'ANO','NE'),
		[URI]=P.[URI],
		[EmailSent]=P.[EmailSent],
		[Active]=P.[Active]
	FROM [cyrkl].[Product] AS P
	LEFT JOIN [cyrkl].[Category] AS C
	ON P.CategoryID = C.ID
	WHERE [Published]=1 AND [EmailSent]=0 AND [Active]=1"

    Initiate-SQL $SqlCommand
}

Function Recipients-SQL ([string]$DB_CategoryID, [array]$DB_SourceTable) {
    
    #Array to string with single quotes around
    $SourceTable = "'$($DB_SourceTable -join "','")'"

    #Select all Active and Subscribed email addresses which correspond to predefined $RecipientType
    $SqlCommand = 
	"SELECT DISTINCT [Email],[SourceTable]
    FROM [cyrkl].[vMailingListFull]
    WHERE [CategoryID]=$DB_CategoryID
    AND [Active]=1 AND [Subscribed]=1
    AND [SourceTable] IN ($SourceTable)"

    Initiate-SQL $SqlCommand
}

Function EmailLog-SQL ([int]$ProductID, [string]$FileName, [array]$RecipientsEmail) {

    $RecipientsList=$($RecipientsEmail -join ";")
    $SentTimestamp=$($(Get-Date).ToString('yyyy-MM-dd HH:mm:ss.fff'))

    $SqlCommand = "
    BEGIN TRANSACTION;
    INSERT INTO [cyrkl].[MailingSent] ([ProductID],[FileName],[Recipients],[SentTimestamp]) 
    VALUES ($ProductID,'$FileName','$RecipientsList','$SentTimestamp');
    UPDATE [cyrkl].[Product] SET [EmailSent] = 1 WHERE [ID] = $ProductID;
    COMMIT;"
    Write-Host "$($Product.ID); $($Product.Nazev); $($Product.CategoryName); $FileName; $($(Get-Date).ToString('yyyy-MM-dd HH:mm:ss'))"

    Initiate-SQL $SqlCommand
    
}

Function SendEmail ([string]$SG_Login, [string]$SG_Password, [string]$SG_Server, [string]$SG_Port, [string]$SG_MailFrom, [string]$SG_MailName, [array]$SG_MailTo, [string]$SG_MailSubject, [string]$SG_Category, [int]$SG_Group, [string]$SG_Domain, [string]$FilePath) {

    # SendGrid SMTP API Header -> Providing Category and DKIM in JSON format
    $Category="""category"": [$SG_Category]"
    $Group="""asm_group_id"": $SG_Group"
    #$DKIM="""filters"" : {""dkim"" : {""settings"" : {""domain"" : ""$SG_Domain"",""use_from"" : false}}}"
    $SMTPHeader="{"+ $Category +","+ $Group +"}"#","+ $DKIM +"}"

    # HTML file send as body of the email
    $HTMLBody = Get-Content $FilePath -Raw

    # Message stuff
    $Message = New-Object System.Net.Mail.MailMessage
    $Message.IsBodyHTML = $true
    $Message.Subject = $SG_MailSubject
    $Message.Headers.Add("X-SMTPAPI",$SMTPHeader)
    $Message.Body = $HTMLBody
    $Message.From = New-Object System.Net.Mail.MailAddress $SG_MailFrom,$SG_MailName

    # Construct the SMTP client object, credentials, and send
    $Smtp = New-Object Net.Mail.SmtpClient($SG_Server,$SG_Port)
    $Smtp.EnableSsl = $true
    $Smtp.Credentials = New-Object System.Net.NetworkCredential($SG_Login,$SG_Password)

    # Send Message to each recipient separately
    ForEach ($Recipient in $SG_MailTo)
    {
    $Message.To.Clear()
    $Message.To.Add($Recipient)
    $Smtp.Send($Message)}
}

###############################################################################################################################################################################
################################################################################# SCRIPT BODY #################################################################################
###############################################################################################################################################################################

# 1. Define Database Connection as GLOBAL Variables
$global:DB_Server = "*****.database.windows.net"
$global:DB_Name = "myDB"
$global:DB_UserID ="*****"
$global:DB_Password = "*****"

# 2. What sources should be used as a list of final email addresses ("MailingListInt","Enquiry","MailingListExt")
$DB_SourceTable = "MailingListInt","Enquiry"

# 3. Extract "NewProducts" records from CyrklDB and transfer them into array variable ($DB_Products)
$DB_Products_Raw = NewProducts-SQL
$DB_Products_Columns = $DB_Products_Raw.columns.ColumnName
$DB_Products = @($DB_Products_Raw | Select $DB_Products_Columns)

ForEach ($Product In $DB_Products) {

    # 4. Extract "Recipeints" records from CyrklDB and transfer them into array variable ($DB_Recipeints)
    $DB_Recipeints_Raw = Recipients-SQL $Product.CategoryID $DB_SourceTable
    $DB_Recipeints_Columns = $DB_Recipeints_Raw.columns.ColumnName
    $DB_Recipeints = @($DB_Recipeints_Raw | Select $DB_Recipeints_Columns)

    # 5. Define SendGrid Email Variables
    $SG_Login = "*******@azure.com"
    $SG_Password = "*******"
    $SG_Server = "smtp.sendgrid.net"
    $SG_Port = "587"
    $SG_Domain = "cyrkl.cz"
    $SG_MailFrom = "info@cyrkl.cz"
    $SG_MailName = "Cyrkl.cz Info"
    $SG_MailSubject = "Nová nabídka na burze druhotných surovin"
    $SG_PreHeader = "$($Product.Nazev) - je horká novinka z oblasti materialů o které by jste mohli mít zájem. Pro více informací prosím navštivte stránky naší burzy Cyrkl.cz."

    # 6. Get the whole HTML Email Template which contanins all neccessary place holders as powershell variables
    $HTMLTemplate = Get-Content -Encoding UTF8 D:\ETL\Cyrkl_ETL\PS_Send_Email\HTML_Files\New_Product_Template.html -Raw

    # 7. Define all variables we need in order to create final HTML Email
    $Nazev=$Product.Nazev
    $Popis=$Product.Popis
    $Lokalita=$Product.Lokalita
    $Cena=$Product.Cena
    $Mnozstvi=$Product.Mnozstvi
    $Doprava=$Product.Doprava
    $URI=$Product.URI
    $PreHeader=$SG_PreHeader
    $FileName=[string]$Product.ID+"_"+[string]$URI+"_"+$(Get-Date).ToString('yyyy-MM-dd')
    $FilePath="D:\ETL\Cyrkl_ETL\PS_Send_Email\HTML_Files\Archive\$FileName.html"

    # 8. Check if the Prodact has available picture, otherwise set default picture for corresponding category
    $Obrazek=If((Invoke-WebRequest $($Product.Obrazek) -Method Head).Headers.'Content-Type' -eq "image/jpeg"){$($Product.Obrazek)} Else {"https://img.cyrkl.cz/images/offer/$($Product.CategoryName).jpg"}

    # 9. Create final HTML files prepared for Internal & External email addreses
    $ExecutionContext.InvokeCommand.ExpandString($HTMLTemplate) | Out-File -FilePath $FilePath

    # 10. Send the HTML emails via SendGrid
    ForEach ($Recipeint In $DB_Recipeints) {

        $SG_MailTo = $Recipeint.Email
        $SG_Category = """$($Product.ID)"", ""$($Product.CategoryName)"", ""$($Recipeint.SourceTable)"""
        $SG_Group = If($Recipeint.SourceTable -eq "MailingListInt") {9970} ElseIf ($Recipeint.SourceTable -eq "Enquiry") {9971} ElseIf ($Recipeint.SourceTable -eq "MailingListExt") {9972}

        SendEmail $SG_Login $SG_Password $SG_Server $SG_Port $SG_MailFrom $SG_MailName $SG_MailTo $SG_MailSubject $SG_Category $SG_Group $SG_Domain $FilePath 
    }

    # 11. Insert into Log table (cyrkl.MailingSent) info about sucessfully sent new product emails
    EmailLog-SQL $($Product.ID) $FileName $($DB_Recipeints.Email)
    
}

