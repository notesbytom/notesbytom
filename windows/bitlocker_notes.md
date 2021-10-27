# Bitlocker Notes

## Recovery Password and FIPS

*"The recovery password for Windows BitLocker isn't available when FIPS compliant policy is set in Windows"*

* https://docs.microsoft.com/en-us/troubleshoot/windows-client/windows-security/bitlocker-recovery-password-not-fips-compliant
* Group Policy Setting:
  * "System cryptography: Use FIPS compliant algorithms for encryption, hashing, and signing"

## Recovery Password Complexity + Workgroup

*'Can't encrypt with bitlocker: "the specified domain either does not exist or could not be contacted"'*

* https://superuser.com/questions/770802/cant-encrypt-with-bitlocker-the-specified-domain-either-does-not-exist-or-cou
* Group Policies:
  * "Configure use of passwords on fixed data drives"
  * "Configure use of passwords for removable data drives"
  * (Workgroup), Set these to "Allow complexity" or "Do not allow complexity"
    * *Allow* ... attempts to validate complexity with a domain-controller if available
    * *Do NOT Allow* ... - skips complexity check.
  * Setting "Require complexity" requires access to a domain-controller to check complexity.
    * FAILS for Workgroup (non-domain) computers
    * Why can't this be fixed to check complexity directly on the computer?
