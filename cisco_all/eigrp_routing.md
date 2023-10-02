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

## Active vs Passive Interfaces

Active interfaces will attempt to find EIGRP peers (neighbors) to share routes with. 
To prevent EIGRP peering on an interface, make it Passive.

By default, all EIGRP interfaces matching a `network ...` statement will be active! 
I recommend changing the interface default to passive!
* In named configuration mode, do this under `af-interface default`
  * `passive-interface`
* Then set the specific af-interface(s) to `no passive-interface` for EIGRP Active peering (neighborship).

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

[1]: https://www.cisco.com/c/en/us/support/docs/ip/enhanced-interior-gateway-routing-protocol-eigrp/200156-Configure-EIGRP-Named-Mode.html
