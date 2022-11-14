$ErrorActionPreference = "Stop";
Set-StrictMode -Version Latest

$backupFolder = "C:\backup_eventlogs\"

# Create backup folder if it doesn't exist
$null = New-Item -ItemType Directory -Path $backupFolder -Force

foreach ($logName in "Application","System","Security") {
    
    # Viewing detail of Security log requires elevated privileges
    $cimObj = Get-CimInstance Win32_NTEventlogFile -Filter "LogfileName = '$logName'"

    Write-Host "Backup $logName $($cimObj.FileSize/1MB) MB $($cimObj.NumberOfRecords) Records"

    $timeStamp = Get-Date -Format "yyyy-MM-dd_HHmm"

    $backupPath = join-path $backupFolder "$($timeStamp)_$($cimObj.CSName)_$($logName).evtx"

    # Method Names: BackupEventlog, ClearEventlog
    # ClearEventLog method requires elevated privileges. BackupEventlog for "Security" also requires elevated privileges.
    $resultObj = Invoke-CimMethod -InputObject $cimObj -Arguments @{ "ArchiveFileName" = $backupPath; } -MethodName "ClearEventlog"

    # output result of method call if non-zero return value
    if ($resultObj.ReturnValue -ne 0) { $resultObj }

    $cimObj = Get-CimInstance Win32_NTEventlogFile -Filter "LogfileName = '$logName'"

    Write-Host "AFTER: $logName $($cimObj.FileSize/1MB) MB $($cimObj.NumberOfRecords) Records"
}
