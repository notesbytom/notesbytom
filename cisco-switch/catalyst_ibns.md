# Catalyst Switch Identity-Based Network Services

IBNS is a programmable fully-customizable capability for configuring 802.1x and MAB port-authentication settings.
IBNS supports RADIUS on the server-side.
The Switch Web GUI will create basic IBNS policies for you. 
These policies are used by the webgui to specify the authentication types and order for a given switch-port.

## Authentication Types

The primary authentication types supported are:
* 802.1x - also referred to as dot1x. A RADIUS server is used for this.
* MAB - switch sends fake mac-address username and password to 802.1x RADIUS server.
* Captive Portal (Web Authentication)

## Violation Action

The port-authentication violation action can be customized. 
See the IBNS Command Reference linked below for examples to add to your policy.
* Violation actions: err-disable, restrict, protect

## Reference Documentation

* [IBNS Command Reference IOS XE 3SE (Catalyst 3850)][1]
* [Configure IBNS 2.0 for Single-Host and Multi-Domain Scenarios][2]
* [IBNS Config Guide IOS 15E - Configuring Identity Control Policies][3]
* [Security Config Guide IOS XE 17.15.x (Catalyst 9300) - Configuring Identity Control Policies][4]
* See also my notes file "catalyst_port-security.md"

[1]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ibns/command/ibns-xe-3se-3850-cr-book/ibns-cr-3850.html
[2]: https://www.cisco.com/c/en/us/support/docs/switches/catalyst-3750-x-series-switches/207193-Configure-IBNS-2-0-for-Single-Host-and-M.html
[3]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ibns/configuration/15-e/ibns-15-e-book/ibns-cntrl-pol.html
[4]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/17-15/configuration_guide/sec/b_1715_sec_9300_cg/configuring_identity_control_policies.html
