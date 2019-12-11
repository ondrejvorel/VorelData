$ClientID = "*****.apps.googleusercontent.com"
$ClientSecret = "*****"
$RefreshToken = "*****"

$params = @{
    Uri = 'https://accounts.google.com/o/oauth2/token'
    Body = @(
        "refresh_token=$RefreshToken", # Replace $RefreshToken with your refresh token
        "client_id=$ClientID",         # Replace $ClientID with your client ID
        "client_secret=$ClientSecret", # Replace $ClientSecret with your client secret
        "grant_type=refresh_token"
    ) -join '&'
    Method = 'Post'
    ContentType = 'application/x-www-form-urlencoded'
}

$accessToken = (Invoke-RestMethod @params).access_token

# Set the authentication headers
$headers = @{
    'Authorization' = "Bearer $accessToken"
    'Content-type' = 'application/json'
}

# MY UPDATE - Metadata of all available files in Google Drive
$allFilesMetadata = Invoke-RestMethod -Uri "https://www.googleapis.com/drive/v3/files" -Headers $headers

# MY UPDATE - List of all Google Drive files saved in array
$filesList = $allFilesMetadata.files

# MY UPDATE - Select only the file ID related to the further steps ("ExternalMailingList", Google Drive Spreadsheet) 
$selectedFileId = $filesList.Where({$_.name -eq 'Cyrkl_MailingListExt_Source' -and $_.mimeType -eq 'application/vnd.google-apps.spreadsheet'}).id

# Change this to the id of the file you want to download. Right click a file and click 'Get shareable link' to find the ID
$fileId = $selectedFileId

# Change this to where you want the resulting file to be placed. Just the path; do not include the file name
$destinationPath = 'D:\ETL\Cyrkl_ETL\GoogleDriveLoad\Files'

# Get the file metadata
$fileMetadata = Invoke-RestMethod -Uri "https://www.googleapis.com/drive/v3/files/$fileId" -Headers $headers

# If this is a Google Apps filetype, export it
if ($fileMetadata.mimetype -like 'application/vnd.google-apps.*') {
    # Determine which mimeType to use when exporting the files
    switch ($fileMetadata.mimetype) {
        'application/vnd.google-apps.document' {
            $exportMime = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
            $exportExt = '.docx'
        }
        'application/vnd.google-apps.presentation' {
            $exportMime = 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
            $exportExt = '.pptx'
        }
        'application/vnd.google-apps.spreadsheet' {
            $exportMime = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            $exportExt = '.xlsx'
        }
        'application/vnd.google-apps.drawings' {
            $exportMime = 'image/png'
            $exportExt = '.png'
        }
        'application/vnd.google-apps.script' {
            $exportMime = 'application/vnd.google-apps.script+json'
            $exportExt = '.json'
        }
    }
    $exportFileName = "$destinationPath\$($fileMetadata.name)$exportExt"
    Remove-Item $exportFileName -ErrorAction Ignore
    Invoke-RestMethod -Uri "https://www.googleapis.com/drive/v3/files/$fileId/export?mimeType=$exportMime" -Method Get -OutFile $exportFileName -Headers $headers
} else {
    # If this is a binary file, just download it as-is.
    $exportFileName = "$destinationPath\$($fileMetadata.name)"
    Remove-Item $exportFileName -ErrorAction Ignore
    Invoke-RestMethod -Uri "https://www.googleapis.com/drive/v3/files/${fileId}?alt=media" -Method Get -OutFile $exportFileName -Headers $headers
}













