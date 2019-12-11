# Sender Credentials
$Username = "azure_*****@azure.com"
$Password = "*****"

# Server Info
$SmtpServer = "smtp.sendgrid.net"
$SmtpPort = "587"

# Sender and Recipient Info
$MailFrom = "ondrej@voreldata.com"
$MailFromName = "VorelData"
$MailTo = "voreltest1@gmail.com","voreltest2@gmail.com"

# SendGrid SMTP API Header -> Providing Category and DKIM in JSON format
$Category="""category"": ""VorelData"""
$DKIM="""filters"" : {""dkim"" : {""settings"" : {""domain"" : ""voreldata.com"",""use_from"" : false}}}"
$SMTPHeader="{"+ $Category +","+ $DKIM +"}"

# Message Subject
$MessageSubject = "SendGrid Testing (Stripo)" 

# HTML file send as body of the email
$HTMLBody = Get-Content C:\Users\vorel\Email\HTML_Email_3_Stripo.html -Raw

# message Attachment
$Attachment = new-object System.Net.Mail.Attachment("C:\Users\vorel\SendGrid\Account_Notes.txt",'text/plain')

# Message stuff
$Message = New-Object System.Net.Mail.MailMessage
$Message.IsBodyHTML = $true
$Message.Subject = $MessageSubject
$Message.Headers.Add("X-SMTPAPI",$SMTPHeader)
$Message.Body = $HTMLBody
$Message.From = New-Object System.Net.Mail.MailAddress $MailFrom,$MailFromName
$Message.Attachments.Add($Attachment)

# Construct the SMTP client object, credentials, and send
$Smtp = New-Object Net.Mail.SmtpClient($SmtpServer,$SmtpPort)
$Smtp.EnableSsl = $true
$Smtp.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)

# Send Message to each recipient separately
ForEach ($Recipient in $MailTo)
{
$Message.To.Clear()
$Message.To.Add($Recipient)
$Smtp.Send($Message)
}


