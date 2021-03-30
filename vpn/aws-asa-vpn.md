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

### Dead Peer Detection (DPD)

* ASA Default is `threshold 10 retry 2`
  * This is configured under `tunnel-group ... ipsec-attributes`
  * Option is `isakmp keepalive ...`
  * Adjust to `threshold 10 retry 10` to match AWS suggestion?
* AWS Example Config suggests `threshold 10 retry 10`

### BGP ASDOT Notation

* AWS Virtual Gateway Supports 32-bit Private AS Numbers
  * These must be specified in ASPlain Notation for Configuration
  * 32-bit Private AS Number Range in ASPlain
    * `4200000000 - 4294967294` (asplain)
  * Configuration Viewing is also in ASPlain Notation
* AWS Customer Gateway Object Supports Only 16-bit Private AS Numbers
  * This is due to their use of Signed Integer for the Value
  * Maximum positive Signed Integer is 2^31-1
  * 32-bit Private AS Numbers are bigger than this
* Cisco ASA Supports BGP Configuration with ASDot Notation
  * 32-bit Private AS Number Range in ASDot
    * `64086.59904 - 65535.65534` (asdot)
  * To view configured AS Numbers as ASDot configure `router bgp ...`
    * `bgp asnotation dot`
    * Without this command, values will appear as ASPlain

