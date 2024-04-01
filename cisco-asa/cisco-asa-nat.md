# Cisco ASA Network Address Translation (NAT)

## Confusing One-to-One Option

The ASDM GUI has added a new Confusing One-to-One Option that is specific to IPv4/IPv6 Transition NAT46.

*"(Optional.) For NAT46, check Use one-to-one address translation. 
For NAT 46, specify one-to-one to translate the first IPv4 address to the first IPv6 address, the second to the second, and so on. 
Without this option, the IPv4-embedded method is used. For a one-to-one translation, you must use this keyword."*[^1]

For IPv4-Only NAT Scenarios, this setting seems to Not apply? The GUI should really label this as NAT46 One-to-One in my opinion.

[^1]: ASDM Book 2: ASA Firewall Configuration Guide - [Chapter: Network Address Translation (NAT)][1] (Search page for "NAT46")

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa919/asdm719/firewall/asdm-719-firewall-config/nat-basics.html
