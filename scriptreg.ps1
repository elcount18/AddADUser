#script d'installation fichier de registre outlook (mise en page) et conf Forticlient
#Belvalette Cyril
#09/02/2024
#V1

# Update these variables as needed
$fontoutlook = '\\192.168.1.230\Logiciels\Lab\Reg_files\mailfontsettings.reg'
$confvpn = '\\192.168.1.230\Logiciels\Lab\Reg_files\FortiVPNConf.reg'


# The sensor is copied to the following directory
$fontoutlooklocal = 'C:\Temp\mailfontsettings.reg'
$confvpnlocal = 'C:\Temp\FortiVPNConf.reg'

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path 'C:\Temp' -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path 'C:\Temp' -Force

}
# Now copy the sensor installer if the share is available
if (Test-Path -Path $fontoutlook) {

    Copy-Item -Path $fontoutlook -Destination $fontoutlooklocal -Force

}
# Ajouter la clé de registre au registre local

Write-Host "Ajout de la clé de registre au registre local..."

Start-Process -FilePath "regedit.exe" -ArgumentList "/s $fontoutlooklocal" -Wait

Write-Host "La clé de registre a été installée localement."