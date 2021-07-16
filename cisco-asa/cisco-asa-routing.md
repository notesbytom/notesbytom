# Cisco ASA Routing

## EIGRP

EIGRP is the Cisco Proprietary Enhanced Interior Gateway Routing Protocol.

* Each EIGRP instance has an Autonomous System number assigned.
  * The EIGRP-AS numbers don't have any correspondence with BGP ASN's.
* If an **EIGRP authentication key** is used, add that under the INTERFACE CONFIGURATION.
  * `authentication key eigrp 10 cisco123 key-id 1`
  * `authentication mode eigrp 10 md5`

