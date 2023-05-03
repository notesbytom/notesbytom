# SQL Server Notes

## Always On Availability Groups

Specify Availability Group Options
* Cluster type = Windows Server Failover Clustering (WSFC) Required for Automatic Failover!
* Database level health detection [x] - check this to failover when database goes offline (not just failover node going offline).
* You CAN'T change the CLUSTER TYPE of an availability group after it is created. You must drop the AG and recreate to get correct cluster type.
* https://learn.microsoft.com/en-us/sql/database-engine/availability-groups/windows/specify-availability-group-name-page?view=sql-server-ver16

Conditions Required for an Automatic Failover
* The Windows Server Failover Clustering (WSFC) **cluster has quorum**.
* This is REQUIRED EVEN FOR BASIC AVAILABILITY GROUPS (must have windows server failover cluster for automatic failover).
* https://learn.microsoft.com/en-us/sql/database-engine/availability-groups/windows/failover-and-failover-modes-always-on-availability-groups?view=sql-server-ver16

Use Static IP Addresses for Cluster Nodes and Cluster Computer Object
* Cluster IP should be to STATIC IP with DHCP EXCLUSION if overlapping with DHCP Scope Pool
* Cluster Nodes should be STATIC IP with DHCP EXCLUSION if overlapping with DHCP Scope Pool
* This is a best practice for high-availability infrastructure - avoids IP/DNS changes.

Grant Permissions on Cluster to SQL Server Service Account
* Example: `Grant-ClusterAccess -User contoso\johnj99 -Full`
* MUST GRANT SQL SERVER SERVICE ACCOUNT access to the Cluster for Always On Availability Groups to work!!!!!
* I'm not sure if ReadOnly is sufficient - can be tested if needed.
* https://learn.microsoft.com/en-us/powershell/module/failoverclusters/grant-clusteraccess?view=windowsserver2022-ps

## SQL Server Management Studio (SSMS)

SSMS Query - SQLCMD Mode
* To use the Database Engine Query Editor to write or edit SQLCMD scripts, you must enable the SQLCMD scripting mode.
* In SQL Server Management Studio, set this via the Query menu (Query - SQLCMD Mode).
* https://stackoverflow.com/questions/9097109/in-sql-server-management-studio-what-is-sqlcmd-mode

