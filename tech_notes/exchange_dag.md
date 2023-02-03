# Exchange Email Database Availability Groups

## Reference: [Plan for high availability and site resilience][1]

### Section: "Software requirements"

* *"Exchange Server 2019 is supported on the Windows Server 2019 and Windows Server 2022 operating system. Within a specific **DAG, all members must be running the same supported operating system**."*

### Section: "Network requirements"

* *"Using IPv6 addresses and IP address ranges is supported only when **both IPv6 and IPv4 are enabled** on that computer, and the **network supports both IP address** versions."*
* Still NOT supporting IPv6-Only deployments ... not optimistic for an IPv6-Native future
  * Clients can be IPv6-Only, BUT servers cannot be
* This is current as of Exchange 2019 (latest as of February 2023)

### Section: "General site resilience planning"

* *"The servers in the second datacenter must have sufficient capacity to host the combined user population of both datacenters."*

## Reference: [High availability and site resilience in Exchange Server][2]

### Section: "Site resilience"

* *"In Exchange 2016 and Exchange 2019, the namespace doesn't need to move with the DAG. ... The HTTP stack can accept multiple IP addresses for a fully qualified domain name (FQDN), and if the first IP address it tries fails hard (that is, it can't connect), it will try the next IP address in the list."*
* *"To get automatic failover for the DAG, you simply architect a solution where the DAG is evenly split between two datacenters, and then place the witness server in a third location so that it can be arbitrated by DAG members in either datacenter, regardless of the state of the network between the datacenters that contain the DAG members."*
* *"An **intermittent failure** requires some sort of **extra administrative action** to be taken because it might be the result of a replacement device being put into service. While this repair process is occurring, the device might be powered on and accepting some requests, but not really ready to service clients until the necessary configuration steps are performed. In this scenario, the administrator can perform a **namespace switchover** by simply **removing the VIP for the device being replaced from DNS**. Then during that service period, no clients will be trying to connect to it. After the replacement process has completed, the administrator can add the VIP back to DNS, and clients will eventually start using it."*

## Notes to Self

* What type of failover / switchover actions should we perform during Windows updates or Exchange Software updates on DAG members? Intermittent manual process or automatic?
* Any special considerations for inbound and outbound SMTP to function properly from multiple Transport High Availability sites? Need to account for operation when both sites are fully functioning, and when we have some kind of failure scenario with a single site.

[1]: https://learn.microsoft.com/en-us/exchange/high-availability/plan-ha
[2]: https://learn.microsoft.com/en-us/exchange/high-availability/high-availability
