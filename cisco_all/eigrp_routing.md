# EIGRP Routing

EIGRP is Cisco's proprietary routing protocol. It does not use UDP or TCP, but instead has its own IP Protocol # 88.

## Named vs Classic Configuration

There is an older "classic" configuration syntax, and a newer ["named" config style][1]. 
These configuration syntax choices are mostly interchangeable and cross-compatible.

If you need to handle IPv6 VRF routing, Named is mandatory in IOS.

The named configuration is more consistent to read when dealing with VRF's.

Route Summarization / Aggregation configurations are listed within the `router eigrp` section for easier reference.

I recommend the Named config style even in cases where VRF's are not used.
The Named configurations are easier to read and maintain.

**Conversion to Named Config**: Use the command `eigrp upgrade-cli EIGRP_INST_NAME` to migrate from Classic to Named config style.
* Substitute your preferred EIGRP Instance Name for EIGRP_INST_NAME.
* This can be done at runtime *"without an impact to the established EIGRP peering"*.

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

## Filtering Received Routes

There may be the case where someone has mistakenly (or purposefully) redistributed WAN routes into the EIGRP LAN network.
In the case of a medium to large-sized WAN, there could be easily 500 or more WAN routes flooding the LAN routing protocol with unneccessary route prefixes - assuming the LAN Routers only need one default-route to reach all WAN prefixes.
This is a perfect use-case for route-filtering if you don't have control or permission to stop the WAN route redistribution into EIGRP directly.
Less received routes will keep the LAN route table cleaner and reduce the load on our routing protocol (EIGRP).

As an example, we can use a Prefix-List to restrict received routes on an EIGRP Router to just those prefixes of-interest on the LAN itself - along with possibly a default route prefix if that is not statically configured.

```
! ==== Other parts of config excluded for brevity ====
ip prefix-list eigrp_filter_in seq 5 permit 10.10.0.0/16 le 32
ip prefix-list eigrp_filter_in seq 10 permit 10.30.0.0/16 le 32
ip prefix-list eigrp_filter_in seq 15 permit 0.0.0.0/0
router eigrp eigrp_virt
 address-family ipv4 unicast autonomous-system 65535
  topology base
   distribute-list prefix eigrp_filter_in in
  exit-af-topology
 exit-address-family
```

I recommend using Prefix-Lists for Route Filtering because of the Easier-to-read CIDR notation, and because of the more precise prefix control.
In this case because we used a Prefix-List instead of an access-list based route-map, we were able to allow a dynamic default-route without receiving all other routes.
When an IPv4 prefix is specified with le 32 - this makes it similar to an access-list entry matching all more-specific routes under that prefix.
When an IPv4 prefix is left without the "le ##" part, it will only match that prefix Exactly! This is what we want for the Default Route!

## Multiple Autonomous Systems

If you have Isolated LAN's that must route specific subnets between eachother, this might be a case for Multiple EIGRP Autonomous Systems.
In a Multiple-AS scenario, at least one EIGRP "border" router will belong to more than one AS and will redistribute select routes between them.
Here is a Multiple-AS Example with Named Configuration mode.
* Main_AS with ASN 10 is the primary LAN with Internet access
  * We use a `route-map` with associated `prefix-list` to `redistribute eigrp 65535 ...` select Lab_AS prefixes into Main_AS
  * This scenario **assumes there are prefixes within Lab_AS EIGRP that should-NOT be shared with Main_AS**
* Lab_AS with ASN 65535 is a secondary LAN with limited access to the Main LAN
  * Lab_AS has some prefixes/subnets that should NOT be shared with Main_AS
  * We are assuming that Lab_AS traverses Main_AS for a default-route which is likely statically configured
  * If there is a dynamic default-route in Main_AS, we could use a route-map + prefix-list to redistribute that
    the other direction from Main_AS to Lab_AS. In that case we would also have a `redistribute eigrp 10 ...` in the lab_as config.
* The `network` statement determines which interfaces on the border router will belong to which EIGRP AS
* It is assumed that there are EIGRP non-border routers within Main_AS 10 and Lab_AS 65535 which are benefitting
  from the route redistribution and filtering done by the EIGRP Multi-AS border router.
  * Another thing we may do on the border-router is summarize routes from either the Main_AS or Lab_AS into the other.
    This allows more specific routes to propagate within the AS and aggregated/condensed summary routes to propagate outside of the AS.
    Note that EIGRP allows route-summaries within an autonomous system, so Summarization is Not exclusive to a Multi-AS scenario.

```
router eigrp main_as
 address-family ipv4 unicast autonomous-system 10
  af-interface Vlan10
   no passive-interface
  exit-af-interface
  topology base
   redistribute eigrp 65535 route-map rm_lab_2_main
  exit-af-topology
  network 10.10.10.0 0.0.0.255
  eigrp router-id 10.10.10.10
 exit-address-family
!
router eigrp lab_as
 address-family ipv4 unicast autonomous-system 65535
  af-interface Vlan30
   no passive-interface
  exit-af-interface
  network 10.30.0.0 0.0.255.255
  eigrp router-id 10.30.30.30
 exit-address-family
ip prefix-list lab_2_main seq 5 permit 10.30.0.0/16 le 32
route-map rm_lab_2_main permit 10
 match ip address prefix-list lab_2_main
```

Prefix-Lists are preferred for route filtering over Access-Lists because we can select specific prefixes
like a default-route 0.0.0.0/0 without matching all other routes. See the "filtering received routes" discussion above.

## Neighbor Authentication

To establish a neighborship and share routes, EIGRP can require authentication.
* Legacy authentication supports only MD5 and Key-Chain
* Modern authentication in Named mode supports SHA-256 and simple pass-phrase or MD5 for backward compatibility
  * Cisco ASA Firewall appears to only support MD5 auth for EIGRP.
  * Cisco Nexus Datacenter Switches appear to also support only MD5 auth for EIGRP.
  * In networks where EIGRP routes need to propagate to and from ASA or Nexus devices,
    SHA-256 will Not be an option. Perhaps in the future, Cisco will add the feature.

MD5 Authentication Example in Named Mode (removed other parts of config for brevity).
```
key chain eigrp_key
 key 1
  key-string SomeSharedSecret987654321...
  ! Key Number and Key-String MUST MATCH for EIGRP Neighbors!!
router eigrp eigrp_virt
 address-family ipv4 unicast autonomous-system 65535
  af-interface Vlan10
   authentication mode md5
   authentication key-chain eigrp_key
   no passive-interface
  exit-af-interface
 exit-address-family
```

MD5 Authentication Example in Classic Mode (removed other parts of config for brevity).
```
key chain eigrp_key
 key 1
  key-string SomeSharedSecret987654321...
interface Vlan10
 ip authentication mode eigrp 65535 md5
 ip authentication key-chain eigrp 65535 eigrp_key
router eigrp 65535
 no passive-interface Vlan10
```

For Examples using SHA-256 Authentication, see the following Cisco Community article:
* [Authentication Using "EIGRP Named" Mode][3] - featuring SHA2-256

## Further Reading Resources

* [Enhanced Interior Gateway Routing Protocol][2] (Wikipedia)

[1]: https://www.cisco.com/c/en/us/support/docs/ip/enhanced-interior-gateway-routing-protocol-eigrp/200156-Configure-EIGRP-Named-Mode.html
[2]: https://en.wikipedia.org/wiki/Enhanced_Interior_Gateway_Routing_Protocol
[3]: https://community.cisco.com/t5/networking-knowledge-base/authentication-using-quot-eigrp-named-quot-mode/ta-p/3147063
