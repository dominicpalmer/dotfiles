$RegistryPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
$Name         = 'DisableLockWorkstation'
$Value        = '00000001'

# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}

# Then set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
