# EIGRP Routing

EIGRP is Cisco's proprietary routing protocol. It does not use UDP or TCP, but instead has its own IP Protocol # 88.

## Named vs Classic Configuration

There is an older "classic" configuration syntax, and a newer ["named" config style][1]. 
These configuration syntax choices are mostly interchangeable and cross-compatible.

If you need to handle IPv6 routing, Named is mandatory in IOS.

The named configuration is more consistent to read when dealing with VRF's.

Route Summarization / Aggregation configurations are listed within the `router eigrp` section for easier reference.

I recommend the Named config style even in cases where IPv6 or VRF's are not used.
The Named configurations are easier to read and maintain.

**Conversion to Named Config**: Use the command `eigrp upgrade-cli EIGRP_INST_NAME` to migrate to new config style.
* Substitute your preferred EIGRP Instance Name for EIGRP_INST_NAME.

## Active vs Passive Interfaces

Active interfaces will attempt to find EIGRP peers (neighbors) to share routes with. 
To prevent EIGRP peering on an interface, make it Passive.

By default, all EIGRP interfaces matching a `network ...` statement will be active! 
I recommend changing the interface default to passive!
* In named configuration mode, do this under `af-interface default`
  * `passive-interface`
* Then set the specific af-interface(s) to `no passive-interface` for EIGRP Active peering (neighborship).

To form a Neighborship, two EIGRP routers must share the same **Autonomous System (AS) Number** across a peering link.
The number you choose for an EIGRP ASN is not significant unless a router straddles Multiple Autonomous Systems.
In the case of Multiple ASN's advertising the same prefix, the router will prefer the route with the Lowest ASN.


The EIGRP Topology Table lists Passive or Active Routes. These Should NOT Be Confused with Active/Passive Interfaces.
Passive Routes are prefixes where EIGRP has determined the Best Path. 
Active Routes are prefixes that EIGRP is still actively-working to determine a best path.
This duplicate use of Active/Passive terminology is confusing!

## Advertising Directly Connected Subnets (Networks)

By Default, EIGRP will advertise the subnets of every interface which matches a `network ...` statement.

In a simple network, you might be able to receive all necessary routes using only `network` statements 
without any static routes or redistribution.

## Redistributing Static Routes

There may be a case where you need to distribute a static route into EIGRP that is not covered by your default route.
There is a `redistribute static` command for this purpose. 

I recommend ALWAYS using a `route-map` to select specific static routes for redistribution. 
Use a `match address prefix-list ...` to easily specify route CIDR prefixes for EIGRP to advertise.

## Route Summaries

EIGRP route summaries are configured at the interface level. 
In "classic" syntax this is done under each `interface ...` config section.
In "named" syntax, this is done within the `router eigrp` - `address-family` - `af-interface ...` section using `summary-address` command.

Summaries are configured on the interface(s) you want to SEND the OUTBOUND SUMMARY Advertisement(s). 
NOT on the interface(s) where the specific non-summarized routes were learned or connected.
The router will automatically add a matching Null route for each summary to prevent routing loops.

I recommend using specific route summaries to 
SIMPLIFY/REDUCE the route advertisements sent to other EIGRP peers in your network.
* Well-Placed summaries can keep your routing tables clean, short, and easy to read.

There is an auto-summary feature which is OFF by default. I recommend Leaving auto-summary OFF!
Modern routing is Classless. Legacy Classful auto-summaries are unlikely to match your route-summary needs.

## Named Configuration Example

For this example, assume the following:

* Interface Vlan 10 will be an active interface with IP 10.10.10.10
  * EIGRP Neighbors will be discovered from this subnet 10.10.10.0 /24
  * Our Router-ID will also be 10.10.10.10
* Interfaces Vlan 301, 302, 303 will be passive for user traffic only
  * Vlan 301 IP 10.30.1.1 /24
  * Vlan 302 IP 10.30.2.1 /24
  * Vlan 303 IP 10.30.3.1 /24
* Instead of advertising each of the user subnets, we will advertise a summary:
  * Summary 10.30.0.0 /16 is advertised to Vlan 10 EIGRP Neighbors
* There are NO VRF's in this example
  * If using a VRF - that is specified on the address-family line

```
router eigrp eigrp_virt
 !
 address-family ipv4 unicast autonomous-system 65535
  !
  af-interface default
   passive-interface
  exit-af-interface
  !
  af-interface Vlan10
   summary-address 10.30.0.0 255.255.0.0
   no passive-interface
  exit-af-interface
  !
  topology base
  exit-af-topology
  network 10.30.0.0 0.0.255.255
  network 10.10.10.0 0.0.0.255
  eigrp router-id 10.10.10.10
 exit-address-family
```

## Classic Configuration Example

Make the same assumptions as the Named Configuration example. 
The biggest differences are:
* No address-family section
* summary-address under interface configuration section rather than af-interface section
* passive-interface names the interface directly rather than under af-interface section

```
router eigrp 65535
 network 10.30.0.0 0.0.255.255
 network 10.10.10.0 0.0.0.255
 passive-interface default
 no passive-interface Vlan10
 eigrp router-id 10.10.10.10

interface Vlan10
 ip address 10.10.10.10 255.255.255.0
 ip summary-address eigrp 65535 10.30.0.0 255.255.0.0
end
```
## Further Reading Resources

* [Enhanced Interior Gateway Routing Protocol][2] (Wikipedia)

[1]: https://www.cisco.com/c/en/us/support/docs/ip/enhanced-interior-gateway-routing-protocol-eigrp/200156-Configure-EIGRP-Named-Mode.html
[2]: https://en.wikipedia.org/wiki/Enhanced_Interior_Gateway_Routing_Protocol
