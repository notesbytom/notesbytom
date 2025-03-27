# FIPS Compatibility Notes

There are several Microsoft Server products which are not compatible with the Policy/GPO setting: "System cryptography: Use FIPS compliant algorithms for encryption, hashing, and signing."
For compatibility, this must be Disabled or if there is no conflicting policy to enable it, the default of Not Configured will leave it disabled.

## Incompatible Products

The following Server products are Not compatible with the above mentioned FIPS policy setting.
They appear to depend on Hash Algorithms like SHA1 or MD5 for database record identifiers and other similar functions.
When they attempt to use Non-FIPS Hashing functions, those are Blocked which causes the associated software to Crash.
Sometimes associated error messages are presented to the user, but often the errors are not presented in a way that users would easily find.
The workaround is to exempt the servers running the impacted software from the above mentioned policy setting.

* SharePoint Server
  * [[FIPS] security standards and SharePoint Server][1]
  * *SharePoint Server uses several Windows encryption algorithms for computing hash values that don't comply with [FIPS].
    These algorithms aren't used for security purposes; they're used for internal processing.
    For example, SharePoint Server uses MD5 to create hash values that are used as unique identifiers.
    Because SharePoint Server uses these algorithms, it doesn't support the Windows security policy setting ...*
  * *Security-related encryption within SharePoint Server [SSL/TLS] is performed by using FIPS-compliant cipher suites.*
* Azure DevOps Server (ADO) formerly known as Team Foundation Server (TFS)
  * [Azure Devops Server ... not FIPS compliant][2]
  * A similar software architecture appears to have been used for both ADO/TFS and SharePoint Server.
    Both products are Not compatible with the above mentioned FIPS policy setting.

[1]: https://learn.microsoft.com/en-us/sharepoint/security-for-sharepoint-server/federal-information-processing-standard-security-standards
[2]: https://developercommunity.visualstudio.com/t/Azure-Devops-Server-are-not-FIPS-complia/10076642
