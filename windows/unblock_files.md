# Unblocking Files

Files downloaded from "untrusted" systems like the Internet or even workgroup members will be marked as "Blocked" in Windows.
These blocked files can be unblocked through the file properties GUI, or through PowerShell.

## Unblock-File with PowerShell

For more detail see the following help articles.

* https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/unblock-file
* https://richardspowershellblog.wordpress.com/2012/05/24/unblocking-files-with-powershell-v3/
* Related Commands: 
  * `Unblock-File`
  * `Get-Item [...] -Stream 'Zone.Identifier' [...]`

There is an Alternate Data Stream (ADS) called `Zone.Identifier` that will be set on "Blocked" files.
Unblocking a file appears to remove this file attribute.
