######################################################
#configuration start##################################
#Source Mail configuration
$from_mail_first_last="frank.fromname"
$from_mail_domain="bluewin.ch"

#Target Mail configuration
$to_mail_first_last="frank.targetname"
$to_mail_domain="gmail.com"
$encrypted_password_file="C:\tmp\2309325732946244673878347892.txt"
#configuration end####################################
######################################################



#####If encrypted_password_file exists, read password
#####otherwise, create it.
if( Test-Path $encrypted_password_file -PathType leaf)
{
  Write-Host("encrypted password file exists, reading it");
  $username = "$from_mail_first_last@$from_mail_domain"
  $pwdTxt = Get-Item -Path $encrypted_password_file | Get-Content
  $securePwd = $pwdTxt | ConvertTo-SecureString 
  $credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePwd
}
else 
{
  Write-Host("encrypted password file does not exist, create it");
  $username = "$from_mail_first_last@$from_mail_domain"
  $password = Read-Host -Prompt 'Input the password'
  $secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force 
  $credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secureStringPwd
  $secureStringText = $secureStringPwd | ConvertFrom-SecureString 
  Set-Content $encrypted_password_file $secureStringText
}


#MAIL LOOP - your logic below ...##########################
for ($i=1; $i -le 2; $i++) 
{
  Write-Host ("about to send message number $i");

  Send-MailMessage `
  -to "$to_mail_first_last <$to_mail_first_last@$to_mail_domain>" `
  -port "587" `
  -from "$from_mail_first_last <$from_mail_first_last@$from_mail_domain>" `
  -Subject "$i SSL is possible number" `
  -body "important message number $i" `
  -Credential $credential `
  -UseSsl `
  -SmtpServer "smtpauths.bluewin.ch"

  #wait 10 seconds
  Start-Sleep -s 10
}
