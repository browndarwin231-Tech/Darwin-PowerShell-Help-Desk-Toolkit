Write-Host "==============================="
Write-Host " Windows System Information"
Write-Host "==============================="

Write-Host ""
Write-Host "Computer Name:"
$env:COMPUTERNAME

Write-Host ""
Write-Host "Current User:"
$env:USERNAME

Write-Host ""
Write-Host "Operating System:"
(Get-CimInstance Win32_OperatingSystem).Caption

Write-Host ""
Write-Host "Windows Version:"
(Get-CimInstance Win32_OperatingSystem).Version

Write-Host ""
Write-Host "Processor:"
(Get-CimInstance Win32_Processor).Name

Write-Host ""
Write-Host "Installed RAM (GB):"
[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB,2)

Write-Host ""
Write-Host "System Boot Time:"
(Get-CimInstance Win32_OperatingSystem).LastBootUpTime

Write-Host ""
Write-Host "IP Address:"
(Get-NetIPAddress -AddressFamily IPv4 |
Where-Object {$_.IPAddress -notlike "169.*"}).IPAddress