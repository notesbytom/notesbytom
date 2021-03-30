# AWS to Cisco ASA VPN

## Site to Site VPN between AWS and Cisco ASA

### Phase 1 Lifetime:
* ASA Default 86400 Seconds
  * Maybe change to 28800 to match AWS Default?
  * This can be set at the `crypto ikev2 policy` level
* AWS Default 28800 Seconds (max)

### Phase 2 Lifetime:
* ASA Default 28800 Seconds
  * Maybe change to 3600 to match AWS Default?
  * This can be set at the `crypto ipsec profile` level
* AWS Default 3600 Seconds (max)

### Startup Action:
* ASA Default is Both (Initiator and Responder)
* AWS Default is Add (Responder-Only)
  * Consider changing to "Start" to match ASA?
  * Start is only supported with IP-Address Customer Gateway

