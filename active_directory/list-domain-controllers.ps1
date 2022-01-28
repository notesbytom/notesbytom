# List Domain Controllers for a Named Domain (trust relationship and connectivity must exist)

get-addomaincontroller -filter * -Server (Get-ADDomainController -Discover -DomainName "YOUR.DOMAIN.NAME").HostName[0] | ft HostName,IPv4Address,Site -AutoSize

# The Format-Table (ft) is for an easy-to-read display. Exclude that if working directly with the objects.
