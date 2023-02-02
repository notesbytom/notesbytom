# Exchange Email Database Availability Groups

Reference: [Plan for high availability and site resilience][1]

**"Network requirements" section**

* *"Using IPv6 addresses and IP address ranges is supported only when **both IPv6 and IPv4 are enabled** on that computer, and the **network supports both IP address** versions."*
* Still NOT supporting IPv6-Only deployments ... not optimistic for an IPv6-Native future
  * Clients can be IPv6-Only, BUT servers cannot be
* This is current as of Exchange 2019 (latest as of February 2023)

**"General site resilience planning" section**

* *"The servers in the second datacenter must have sufficient capacity to host the combined user population of both datacenters."*

[1]: https://learn.microsoft.com/en-us/exchange/high-availability/plan-ha
