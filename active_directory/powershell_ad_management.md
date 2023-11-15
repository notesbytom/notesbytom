# Active Directory Management PowerShell .NET Assembly

## AD Management Assembly DLL

On a system with the Active Directory Management Tools installed, the default path for the x64 DLL:
* C:\Windows\Microsoft.NET\assembly\GAC_64\Microsoft.ActiveDirectory.Management\[VERSION_NUMBER]\Microsoft.ActiveDirectory.Management.dll

This can be DLL can be loaded into PowerShell directly on any compatible system using `Import-Module [PATH_TO_DLL]`

This is a possible workaround if there is not an easy way to install the Active Directory Management Tools on a system.

## Further Reading and Reference

* [Active Directory Enumeration with AD Module without RSAT or Admin Privileges][1] (Red Team Notes)

[1]: https://www.ired.team/offensive-security-experiments/active-directory-kerberos-abuse/active-directory-enumeration-with-ad-module-without-rsat-or-admin-privileges
