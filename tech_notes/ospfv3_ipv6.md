# OSPFv3 (IPv6)

## OSPFv3 Router ID's

Router ID's in OSPF are oddly 32-bit numbers that follow the same rules as IPv4 OSPFv2 router id's.

The OSPFv3 Router-ID can be one of the following:
* Manually configured Router ID
* Highest IPv4 Loopback Address
* Highest IPv4 Non-Loopback Address

It seems strange for an IPv6 routing protocol to appear to depend on an IPv4 identifier. I guess the manually-configured router-id could be used in an ipv6-only network.
