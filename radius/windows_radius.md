# Windows RADIUS Server

Also known as "Network Policy Server" (NPS) or "Network Policy and Access Services" (NPAS).

## Logging

Computer Policy - Windows Settings - Security Settings - Advanced Audit Policy - System Audit Policies - Logon/Logoff

* Audit Network Policy Server:
  * Events: Success AND Failure
* A Reboot might be required after changing this logging setting.

In Server Manager under NPAS Events section, Tasks menu, Add "Informational" level to see all logs.

In Event Viewer under Server Roles, find the section for Network Policy and Access Services.

Default Log File path is C:\Windows\system32\LogFiles\IN####.txt (filename pattern).

## Legacy MSCHAPv2 Support

If you hare having trouble with MSCHAPv2 clients, you can try enabling the below setting.

```
$reg_path = "HKLM:\SYSTEM\CurrentControlSet\Services\RemoteAccess\Policy"
Set-ItemProperty -Path $reg_path -Name "Enable NTLMv2 Compatibility" -Type DWord -Value 1 -Verbose
Restart-Service "IAS" -Verbose
```

I believe this is separate from Modern MSCHAPv2 support which is configured under EAP+MSCHAPv2 instead.

## Registered/Authorized Servers

Domain Controllers might already have the needed permissions. 
NPS/RADIUS servers should belong to the **"RAS and IAS Servers"** group to ensure they can read user attributes and authenticate users.

## Network Policies

* Match Condition: RADIUS Client IPv4 Address (shows as Client IPv4 Address)
  * ~~NOT **Access** Client IP~~
* Match Condition: Client Friendly Name =  Name of the RADIUS Client in NPS Configuration
  * This is NOT a hostname, just a string to match the entry in the Radius Server config.
* RADIUS Clients are the network devices that are talking to the radius server on behalf of the client
  * Examples: Network Firewall, Router, Switch, etc.
* Regular Expressions: \. = literal-dot; .+ = one or more characters; ...
* Windows Groups on a single line only need to match one (logical OR)
  * Groups on separate match condition lines - each match condition must be true (logical AND)
* RADIUS Attributes: Standard
 * Service-Type = Administrative (for Privileged Users, level 15); "Login" would be priv-1.
  * Service-Type = Framed for 802.1x Wifi, Switch, or Remote-Access-VPN authentication?
 * Class = Administrator (Privileged Users on some equipment)
 * There may also be vendor-specific attributes available. See vendor support documentation.

## Port Numbers

https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers

* Authentication: 1812 (legacy 1645)
* Accounting: 1813 (legacy 1646)

## Further Reading

* https://www.ciscozine.com/manage-cisco-with-nps-radius/
