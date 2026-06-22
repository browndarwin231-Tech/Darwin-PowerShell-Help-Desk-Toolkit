Write-Host "=== Darwin Suspicious PowerShell Detector ==="
Write-Host ""

$commands = Get-Content "powershell_commands.txt"

$suspiciousKeywords = @(
    "EncodedCommand",
    "Invoke-WebRequest",
    "Invoke-Expression",
    "DownloadString",
    "ExecutionPolicy Bypass",
    "IEX"
)

foreach ($command in $commands) {

    $isSuspicious = $false

    foreach ($keyword in $suspiciousKeywords) {

        if ($command -like "*$keyword*") {
            $isSuspicious = $true
        }

    }

    if ($isSuspicious) {
        Write-Host "[ALERT] $command"
    }
    else {
        Write-Host "[OK] $command"
    }
} 