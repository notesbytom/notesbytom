# Get User Password Expiration Date/Time from named Active Directory domain (example with PowerShell)

$ad_user = Get-ADUser SOME_USERNAME -Properties msDS-UserPasswordExpiryTimeComputed -Server YOUR.DOMAIN.FQDN
[System.DateTime]::FromFileTime($ad_user.'msDS-UserPasswordExpiryTimeComputed')

# This special computed property seems to be missing when using `-Properties *`
# ... it seems that we must spell this special property out verbatim.

# The command `net user SOME_USERNAME /domain` also lists the expiration date
# Unfortunately `net user` only works with the current logged in domain
# This example works with any reachable domain

# See also the discussion here https://www.pcwdld.com/password-expiration-date-ad-user

# References
# - https://learn.microsoft.com/en-us/windows/win32/adschema/a-msds-userpasswordexpirytimecomputed
# - https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/f9e9b7e2-c7ac-4db6-ba38-71d9696981e9
