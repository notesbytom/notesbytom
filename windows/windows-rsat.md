# Remote Server Administration Tools (RSAT)

Windows 10 computers can install Remote Server Administration Tools to manage most of the services provided by Windows Server.

## Install RSAT with PowerShell

The RSAT utilities can be installed or removed with PowerShell on recent versions of Windows 10.

* `Get-WindowsCapability -Online`
* `Add-WindowsCapability -Online`
* `Remove-WindowsCapability -Online`

## Tools Available

There are RSAT utilities available for Windows Server services like the following:

* Active Directory
* DNS
* DHCP
* ...

