# Fine-Grained Password Policies

A Domain Functional Level of Server 2008 is required to use FGPP with Active Directory.

## Management Tools

* GUI = Active Directory Administrative Center (ADAC) `dsac.exe`
* PowerShell Command-Line
  * `New-ADFineGrainedPasswordPolicy`
  * `Add-ADFineGrainedPasswordPolicySubject`
  * `Get-ADUserResultantPasswordPolicy`
  * `Set-ADFineGrainedPasswordPolicy`
* FGPP Objects Location: Domain-Root - System - Password Settings Container

## Further Reading

* Active Directory Administrative Center [Fine-Grained Password Policy][1]
* AD DS: [Fine-Grained Password Policies][2]

[1]: https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/adac/Advanced-AD-DS-Management-Using-Active-Directory-Administrative-Center--Level-200-#configuring-and-managing-fine-grained-password-policies-using-active-directory-administrative-center
[2]: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc770394(v=ws.10)
