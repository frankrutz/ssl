######################################################
#configuration start##################################
#Source Mail configuration
$from_mail_first_last="frank.fromm"
$from_mail_domain="bluewin.ch"

#Target Mail configuration
$to_mail_first_last="frank.tohim"
$to_mail_domain="gmail.com"
#configuration end####################################
######################################################



#interactive - enter mail password.
$credential = Get-Credential  -credential $from_mail_first_last@$from_mail_domain

for ($i=1; $i -le 3; $i++) 
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
