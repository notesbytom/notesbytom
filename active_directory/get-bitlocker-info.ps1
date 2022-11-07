# Use like: get-bitlocker -pcname "some-pc-name"
# DEPENDENCIES: Must have the Active Directory management tools (RSAT) installed
# If you omit the `-pcname` it will use the local computer name by default
# It will prompt for credentials
# It will use a domain controller for your current domain by default
# Specify `-server` to query a different domain

function get-bitlocker(
    $pcname=$env:COMPUTERNAME,
    $cred=(get-credential),
    $server=(get-addomaincontroller -Discover).Name
) { 
  Get-ADObject `
    -SearchBase (get-adcomputer $pcname -Credential $cred -Server $server).DistinguishedName `
    -Credential $cred `
    -Server $server `
    -Filter {objectclass -eq 'msFVE-RecoveryInformation'} `
    -Properties * 
}

# If your credentials have sufficient access and a matching bitlocker object is found,
# Look for the `msFVE-RecoveryPassword` property in the results
# Based loosely on an example from https://www.top-password.com/blog/tag/get-bitlocker-recovery-key-from-ad-powershell/

# Glossary: FVE = Full Volume Encryption? 
