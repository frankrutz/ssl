# Sending Bluewin Mail from Powershell using SSL and Send-MailMessage

Hardware:
Windows 10 Pro


	
~~~~
# Interactive version, send mail once, example:

$credential = Get-Credential  -credential frank.fromm@bluewin.ch

Send-MailMessage `
-to "frank.tohim <frank.tohim@gmail.com>" `
-port "587" `
-from "frank.fromm <frank.fromm@bluewin.ch>" `
-Subject "SSL is possible" `
-body "wichtige botschaft" `
-Credential $credential `
-UseSsl `
-SmtpServer "smtpauths.bluewin.ch"


# Preparation of a script 

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

$credential = Get-Credential  -credential $from_mail_first_last@$from_mail_domain

Send-MailMessage `
-to "$to_mail_first_last <$to_mail_first_last@$to_mail_domain>" `
-port "587" `
-from "$from_mail_first_last <$from_mail_first_last@$from_mail_domain>" `
-Subject "SSL is possible" `
-body "wichtige botschaft" `
-Credential $credential `
-UseSsl `
-SmtpServer "smtpauths.bluewin.ch"
	
~~~~

