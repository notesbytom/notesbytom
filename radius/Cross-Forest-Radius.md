# Cross-Forest Radius

This is a note specific to Windows RADIUS (NPS)

## Register the Radius server in BOTH forests

In the NPS GUI you can register the RADIUS server in it's own domain. 
This gives the RADIUS server permission to authenticate domain users.

In the trusted forest domain, Add the cross-forest RADIUS server to the "RAS and IAS Servers" group. 
This grants permission for the RADIUS server to authenticate users in the trusted forest domain.

## Add cross-forest groups into your RADIUS Network Policies

Add cross-forest groups, for example if the policy allows group "MYDOMAIN\Domain Users"
then you can add "TRUSTED-DOMAIN\Domain Users" to the same policy condition.

Make sure the groups are all on the same policy condition line (logical "OR", user can belong to any group).
If the groups are entered as separate conditions, then the user will need to belong to all of the groups listed
(logical "AND", user must belong to a group from each separate condition in the policy).
