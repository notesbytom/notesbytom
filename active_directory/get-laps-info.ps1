# Get Local Admin Password Solution info for local (or named) computer
# You must have access within the directory to read the LAPS properties
# This example assumes you have the Active Directory Remote Server Admin Tools (RSAT) installed

(get-adcomputer $env:COMPUTERNAME -Properties 'ms-Mcs-AdmPwd').'ms-Mcs-AdmPwd'
[datetime]::FromFileTimeUtc((get-adcomputer $env:COMPUTERNAME -Properties 'ms-Mcs-AdmPwdExpirationTime').'ms-Mcs-AdmPwdExpirationTime')
get-localgroupmember Administrators
get-localuser | where sid -like 's-1-5-*-500'

# https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/security-identifiers#well-known-sids
# Well-known sid for local admin: S-1-5-domain-500. 
# "A user account for the system administrator. Every computer has a local Administrator account ..."

# A function to allow naming a remote computer (or defaults to local computer)
# Call function like `get-laps -hostName "SOME-COMPUTER-NAME"`

function get-laps($hostName = $env:COMPUTERNAME) {
  $adComputer = get-adcomputer $hostName -Properties 'ms-Mcs-AdmPwd','ms-Mcs-AdmPwdExpirationTime'
  "ADComputer Identity = $hostName"
  "ms-Mcs-AdmPwd = $($adComputer.'ms-Mcs-AdmPwd')"
  "ms-Mcs-AdmPwdExpirationTime = $([datetime]::FromFileTimeUtc($adComputer.'ms-Mcs-AdmPwdExpirationTime'))"
}
