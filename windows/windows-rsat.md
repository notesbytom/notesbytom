# Remote Server Administration Tools (RSAT)

Windows 10 computers can install Remote Server Administration Tools to manage most of the services provided by Windows Server.

## Install RSAT with PowerShell

The RSAT utilities can be installed or removed with PowerShell on recent versions of Windows 10.

* `Get-WindowsCapability -Online`
* `Add-WindowsCapability -Online`
* `Remove-WindowsCapability -Online`

Example installing DHCP tools
* `get-windowscapability -online -Name 'rsat.dhcp*' | Add-WindowsCapability -Online`

## Tools Available

There are RSAT utilities available for Windows Server services like the following:

* Active Directory
* DNS
* DHCP
* ...

## Prerequisites

On-Premise systems must have a way to get the RSAT package files - this is usually directly from Windows update. If WSUS is enabled this will require a special group-policy setting or result in errors when attempting to install tools.

* ERROR: `Add-WindowsCapability failed. Error code = 0x800f0954`
* GPO: Computer Configuration - Administrative Templates - System - Specify settings for optional component installation and component repair
  * Enabled - [x] Download repair content and optional features directly from Windows Update instead of Windows Server Update Services (WSUS).

With this fix, on-prem users should be able to install the RSAT utilities.

Registry detective work for verifying this GPO setting is active on a computer.

* Policy `*.admx` and `*.adml` files for text searching in `"$env:SystemRoot\PolicyDefinitions"`
* `C:\Windows\PolicyDefinitions\Servicing.admx` has `CheckBox_SidestepWSUS`
* `class="Machine"` (HKLM)
* `key="Software\Microsoft\Windows\CurrentVersion\Policies\Servicing"`
* `boolean id="CheckBox_SidestepWSUS" valueName="RepairContentServerSource"`
* `trueValue` ... `decimal value="2"`
* `falseValue` ... `delete`

Verify current settings in Registry: `get-itemproperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Servicing"`
