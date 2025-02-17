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

## Multi-Domain Authentication (MDA)

For a port configured with both access (data) and voice vlans, you can use MDA to authenticate the phone into the voice vlan.
There is a special Cisco Proprietary value that should be sent in the RADIUS response when the phone authenticates:
* cisco-av-pair = `device-traffic-class=voice`
* This is compatible with MAB, just send this with the response when the MAB account authenticates.
* This is compatible with `access-session host-mode multi-auth` in addition to `multi-domain`
  * With either multi-auth or multi-domain, the above AV-Pair will put the device into the Voice domain.
  * The Voice domain will be the `switchport voice vlan ...` configured for the interface.

Read about it here:
* [802.1x MDA on Catalyst Config. Example](https://www.cisco.com/c/en/us/support/docs/lan-switching/8021x/98523-8021x-cat-layer3.html#radius)
* [IEEE 802.1X Multidomain Authentication](https://www.cisco.com/en/US/docs/ios-xml/ios/sec_usr_8021x/configuration/15-2mt/sec-ieee-mda.html)
  * *"send a Cisco Attribute-Value (AV) pair attribute with a value of device-traffic-class=voice. Without this value, the switch treats the voice device as a data device."*

## Related Terminology

* CPL = Class-Based Policy Language (Used to configure IBNS)

## Concurrent 802.1x and MAB Example

Parallel/Concurrent 802.1x and MAB. 
Based on a config sample from [Security Config Guide IOS XE - Icentity Control Policies][4]. 
Removed the webauth items and fixed indentation, improved sequence numbering.
Lowest number priorities are Most-Preferred. Higest number priorities are least-preferred.
Event "agent-found" indicates that an 802.1x agent/supplicant is detected on the port.

~~~
class-map type control subscriber match-all ALL_FAILED
 no-match result-type method dot1x none
 no-match result-type method dot1x success
 no-match result-type method mab none
 no-match result-type method mab success
!
class-map type control subscriber match-all DOT1X
 match method dot1x
!
class-map type control subscriber match-all MAB
 match method mab
!
policy-map type control subscriber CONCURRENT_DOT1X_MAB
  event session-started match-all
    10 class always do-until-failure
      110 authenticate using dot1x priority 10
      120 authenticate using mab priority 20
  event authentication-failure match-first
    10 class ALL_FAILED
      110 authentication-restart 60
  event authentication-success match-all
    10 class DOT1X
      110 terminate mab
  event agent-found match-all
    10 class always do-until-failure
      110 authenticate using dot1x priority 10
!
! In interface mode, use `service-policy type control subscriber CONCURRENT_DOT1X_MAB` to apply to a port.
~~~

## Related Reading

* [IBNS Command Reference IOS XE 3SE (Catalyst 3850)][1]
* [Configure IBNS 2.0 for Single-Host and Multi-Domain Scenarios][2]
* [IBNS Config Guide IOS 15E - Configuring Identity Control Policies][3]
* [Security Config Guide IOS XE 17.x (Catalyst 9300) - Configuring Identity Control Policies][4]
* See also my notes file "[catalyst_port-security.md](catalyst_port-security.md)"

[1]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ibns/command/ibns-xe-3se-3850-cr-book/ibns-cr-3850.html
[2]: https://www.cisco.com/c/en/us/support/docs/switches/catalyst-3750-x-series-switches/207193-Configure-IBNS-2-0-for-Single-Host-and-M.html
[3]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ibns/configuration/15-e/ibns-15-e-book/ibns-cntrl-pol.html
[4]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/17-16/configuration_guide/sec/b_1716_sec_9300_cg/configuring_identity_control_policies.html
