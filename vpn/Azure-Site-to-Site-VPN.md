Azure Cloud Shell sample commands:

* Get-AzVirtualNetworkGateway
* Get-AzLocalNetworkGateway
* Get-AzVirtualNetworkGatewayConnection

Save JSON from Configuration Items:

$config_obj | ConvertTo-Json | Out-File -Encoding utf8 config_obj.json

Connection Properties to convert between Policy-Based and VTI, etc.

* UsePolicyBasedTrafficSelectors

Cisco ASA Support for Azure VTI BGP Notes

* We don't support /32 interface mask, but we do support /31 if needed
  * https://www.cisco.com/c/en/us/td/docs/security/asa/asa914/configuration/general/asa-914-general-config/interface-routed-tfw.html
  * Section "31-Bit Subnet Mask"
* Example from Cisco for VTI with BGP
  * https://www.cisco.com/c/en/us/support/docs/security/adaptive-security-appliance-asa-software/214109-configure-asa-ipsec-vti-connection-to-az.html
  * neighbor 1.2.3.4 ebgp-multihop #
    * enable ebgp-multihop for the neighbor (neighbor ip not directly in vti subnet range)
    * also requires a static route for reachability of the neighbor across the vti, see example
