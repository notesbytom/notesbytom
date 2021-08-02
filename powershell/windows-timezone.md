# Windows TimeZone

## Manage System TimeZone with PowerShell

* Current TimeZone: `Get-TimeZone`
* List TimeZones matching hours offset: 
  * `Get-TimeZone -ListAvailable | Where-Object BaseUtcOffset -eq (New-TimeSpan -Hours -5) | ft`
* Set TimeZone: `Set-TimeZone "Eastern Standard Time"`
  * Use a TimeZone Id from the output of Get-TimeZone.
