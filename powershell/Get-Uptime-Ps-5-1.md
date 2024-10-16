# Get System Uptime (PowerShell 5.1)

* `Get-ComputerInfo | Format-List "*lastboot*"`
* Output will have property `OsLastBootUpTime`
* Days of Uptime Example:
  * `((Get-Date) - (Get-ComputerInfo).OsLastBootUpTime).TotalDays`
