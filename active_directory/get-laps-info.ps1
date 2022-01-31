# Get Local Admin Password Solution info for local (or named) computer
# You must have access within the directory to read the LAPS properties
# This example assumes you have the Active Directory Remote Server Admin Tools (RSAT) installed

(get-adcomputer $env:COMPUTERNAME -Properties 'ms-Mcs-AdmPwd').'ms-Mcs-AdmPwd'
[datetime]::FromFileTimeUtc((get-adcomputer $env:COMPUTERNAME -Properties 'ms-Mcs-AdmPwdExpirationTime').'ms-Mcs-AdmPwdExpirationTime')
get-localgroupmember Administrators
get-localuser | where sid -like 's-1-5-*-500'
