# Active Directory Forest Replication

## Forest-Wide Shared Directory Partitions

Within an Active Directory Forest, several directory partitions are shared among all member domains rather than having separate instances for each domain.

* **Schema** directory partition
  * Defines object types and attributes according to Microsoft specifications.
* **Configuration** directory partition
  * Defines forest configuration including Replication Topology
  * The GUI tool for replication topology is **Active Directory Sites and Services**
  * **Site Objects** are defined here, one per AD Site
  * **Subnet Objects** are defined here and mapped to AD Sites
  * **IP Site Links** are defined here and mapped to AD Sites
    * **Cost** and **Replication Interval** are important settings for Site Links
* Forest DNS Zones directory partitions
  * Any AD-Integrated DNS Zone with forest-wide replication enabled
  * If DNS Zones are replicated at the Domain Level, then we need Stub Zones or Conditional Forwarders to resolve cross-domain names

## IP Connectivity Between Forest Root and Child Domains

Because the forest configuration, schema, and any forest-wide dns zones are shared by all domains in the forest, 
it is critical that domain controllers within the forest have full ip connectivity between eachother to replicate
this data. If there is not full connectivity to match the replication topology, bad things will happen.

## Documentation

Any discussion of Active Directory configuration or troubleshooting should reference the official documentation. Here are some links.

* [Active Directory Replication Concepts](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/replication/active-directory-replication-concepts)
  * See the **Global catalog server** section for information on forest-shared directory partitions Schema and Configuration.

