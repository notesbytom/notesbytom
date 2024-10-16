# PowerShell Remoting

## Enable PS Remoting

PowerShell remoting must be enabled on a host before you can connect to it.
* Legacy CLI command: `winrm quickconfig`
* Modern PowerShell-Native command: `Set-WSManQuickConfig`

## Connect to a Remote System

There are multiple ways to use PS Remoting. One or more possibilities:
* `Enter-PSSession -ComputerName REMOTE_HOST_NAME`
  * This is similar to Interactive SSH or Telnet

## Related Documentation

* [Installation and configuration for Windows Remote Management][1] (winrm)
* [Set-WSManQuickConfig][2]
* [Enter-PSSession][3]

[1]: https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management
[2]: https://learn.microsoft.com/en-us/powershell/module/Microsoft.WsMan.Management/Set-WSManQuickConfig?view=powershell-5.1
[3]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enter-pssession?view=powershell-5.1
