Azure Cloud Shell sample commands:

* Get-AzVirtualNetworkGateway
* Get-AzLocalNetworkGateway
* Get-AzVirtualNetworkGatewayConnection

Save JSON from Configuration Items:

$config_obj | ConvertTo-Json | Out-File -Encoding utf8 config_obj.json

Connection Properties to convert between Policy-Based and VTI, etc.

* UsePolicyBasedTrafficSelectors

