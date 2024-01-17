# Cisco ASA Access-Lists

## Comments / Remarks

From: ASDM Book 2: Cisco ASA Series Firewall [ASDM Configuration Guide, 7.2 - Chapter: Access Rules][1]

*Using Remarks:
In the ASDM access rule window, a remark that displays next to the rule is the one that was configured before the rule, 
so when you configure a remark from the CLI and then view it in an ASDM access rule window, 
the remark displays next to the rule that was configured after the remark in the CLI. 
However, the packet tracer in ASDM matches the remark that is configured after the matching rule in the CLI.*

I think the access-rule screen is a more important place for comments than the ASDM packet-tracer. 
It is probably best to place comments/remarks BEFORE the associated rule.

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa92/asdm72/firewall/asa-firewall-asdm/access-rules.html

## Global vs Interface Access List

By default or convention, we apply access-lists to Interfaces in the Inbound direction only.

If an ASA is configured with a Global access-list (not applied to any specific interface).
* The Global access-list will be used for traffic received on any interface WITHOUT an inbound access-list applied!
* If an access-list is applied to an interface (inbound), then the Global access-list will be
  ignored for that interface (inbound) traffic and the associated return-packets for stateful traffic.

Related Reading: [Order of Interface and Global ACL][1] (Cisco Community)

[1]: https://community.cisco.com/t5/network-security/order-of-interface-and-global-acl/m-p/2261082#M346086
