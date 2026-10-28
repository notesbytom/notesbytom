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

* [... connections fail when using MS-CHAPv2][5]

```
$reg_path = "HKLM:\SYSTEM\CurrentControlSet\Services\RemoteAccess\Policy"
Set-ItemProperty -Path $reg_path -Name "Enable NTLMv2 Compatibility" -Type DWord -Value 1 -Verbose
Restart-Service "IAS" -Verbose
```

I believe this is separate from Modern MSCHAPv2 support which is configured under EAP+MSCHAPv2 instead.

### Client MSCHAPv2 Compatibility

802.1x deployments may use PEAP-MSCHAPv2 for Machine Authentication to the network.

* [Manage NTLMv1 changes and prevent network authentication issues in Windows][1]
* [KB5127648 breaks ... (802.1X PEAP) ... authentication on Windows 11][2]
  * `New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' -Name 'BlockNtlmv1SSO' -Value 0 -PropertyType DWord -Force`
* [Considerations and known issues when using Credential Guard][3]
  * "Credential Guard enabled by default unless explicitly disabled"
  * "SSO is blocked for MS-CHAP" (including MSCHAPv2)
  * "Microsoft recommends moving away from MSCHAPv2-based connections (for example, ... EAP-MSCHAPv2), to certificate-based authentication (for example, ... EAP-TLS). Credential Guard doesn't block certificate-based authentication."
 
When migrating to EAP-TLS or similar client certificate authentication, **Strong Certificate Binding Enforcement** must be considered so that RADIUS can map the client certificate to the associated Computer or User account.

* [KB5014754: Certificate-based authentication changes on Windows domain controllers][4]
* Certificates issued by an Active Directory Certificate Services Enterprise Certificate Authority
  * These certs based on default templates are likely to include the SID Extension for compatibility.
  * SID Extension Object Identifier (OID) (1.3.6.1.4.1.311.25.2)
* [Microsoft Windows Certificate Mapping - SID][6]
  * "Subject Alternate Name [SAN] with **type URL** in the literal format of: `tag:microsoft.com,2022-09-14:sid:STRING_SID_VALUE`"
  * This is an alternative to consider if the CA issuing the certificate does not natively support the SID Extension.

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
* Regular Expressions: `\.` = literal-dot; `.+` = one or more characters; ...
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

[1]: https://support.microsoft.com/en-us/servicing/os/windows/docs/2025/08/upcoming-changes-to-ntlmv1-in-windows-11-version-24h2-and-windows-server-2025
[2]: https://learn.microsoft.com/en-us/answers/questions/6036507/kb5127648-breaks-wpa2-enterprise-802-1x-peap-wi-fi
[3]: https://learn.microsoft.com/en-us/windows/security/identity-protection/credential-guard/considerations-known-issues
[4]: https://support.microsoft.com/en-us/servicing/os/windows-server/2022/05/kb5014754-certificate-based-authentication-changes-on-windows-domain-controllers
[5]: https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/rras-vpn-connections-fail-ms-chapv2-authentication
[6]: https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-pkca/e8fd2c1d-50d3-493a-9b58-5e453850c567
