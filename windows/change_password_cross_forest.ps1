# Dependency REQURIES Remote Server Administration Tools (RSAT) for Active Directory

# Substitute real values for placeholders like
#  USERNAME_FROM_SOMEDOMAIN
#  DOMAINCONTROLLERNAME.SOMEDOMAIN-FQDN.COM
# ENTER_NEW_PASSWORD_HERE

# Example command to see if the user's password is expired. Works cross-forest, specify domain-controller in target-user's domain.

Get-ADUser USERNAME_FROM_SOMEDOMAIN -Server DOMAINCONTROLLERNAME.SOMEDOMAIN-FQDN.COM -Properties * | fl *expired*

# Example to change the user's password, even if it's expired. Works cross-forest, specify domain-controller in target-user's domain.
# ... this example is for interactive password change (you are prompted for the old and new values).

Set-ADAccountPassword -Identity USERNAME_FROM_SOMEDOMAIN -Server DOMAINCONTROLLERNAME.SOMEDOMAIN-FQDN.COM

# Example output for changing a user's password cross-forest (must know current password).

# Please enter the current password for 'DISTINGUISHED_NAME_OF_USER_FROM_SOMEDOMAIN'
# Password: *
# Please enter the desired password for 'DISTINGUISHED_NAME_OF_USER_FROM_SOMEDOMAIN'
# Password: ENTER_NEW_PASSWORD_HERE
# Repeat Password: ENTER_NEW_PASSWORD_HERE

# If you are a Systems Administrator with enough privilege, you can RESET a user's password without knowing the current password.
# ... In this case, use the `-Reset` option for `Set-ADAccountPassword`
