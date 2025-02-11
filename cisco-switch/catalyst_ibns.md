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

## Related Terminology

* CPL = Class-Based Policy Language (Used to configure IBNS)

## Concurrent 802.1x and MAB Example

Based on a config sample from [Security Config Guide IOS XE - Icentity Control Policies][4]. 
Removed the webauth items and fixed indentation, improved sequence numbering.
Lowest number priorities are Most-Preferred. Higest number priorities are least-preferred.
Parallel/Concurrent 802.1x and MAB. If an 802.1x agent/supplicant is detected, MAB will be terminated.

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

## Reference Documentation

* [IBNS Command Reference IOS XE 3SE (Catalyst 3850)][1]
* [Configure IBNS 2.0 for Single-Host and Multi-Domain Scenarios][2]
* [IBNS Config Guide IOS 15E - Configuring Identity Control Policies][3]
* [Security Config Guide IOS XE 17.x (Catalyst 9300) - Configuring Identity Control Policies][4]
* See also my notes file "[catalyst_port-security.md](catalyst_port-security.md)"

[1]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ibns/command/ibns-xe-3se-3850-cr-book/ibns-cr-3850.html
[2]: https://www.cisco.com/c/en/us/support/docs/switches/catalyst-3750-x-series-switches/207193-Configure-IBNS-2-0-for-Single-Host-and-M.html
[3]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ibns/configuration/15-e/ibns-15-e-book/ibns-cntrl-pol.html
[4]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/17-16/configuration_guide/sec/b_1716_sec_9300_cg/configuring_identity_control_policies.html
