# McAfee Client Proxy (MCP)

McAfee can control the proxy settings on a client computer. For Microsoft Windows systems the proxy settings can be viewed from the corresponding Registry location.

* [How to view the McAfee Client Proxy status without the McAfee Agent](https://kc.mcafee.com/corporate/index?page=content&id=KB75223)
* `Get-ItemProperty "HKLM:\SOFTWARE\McAfee\MCP\About\"`

PowerShell `Invoke-WebRequest` will automatically use this McAfee Client Proxy if active.

## New Names for Same Product

After rebranding, the Antivirus/Endpoint Security client is known as **Trellix**, and the Client Proxy is known as **Skyhigh** Client Proxy (SCP).
