# Replicate between Named Active Directory Sites. Bi-Directional (push and pull)
#   Call it like: Replicate-SitePair "Site1" "Site2"
#   Get Site Names: Get-ADReplicationSite -Properties CN -Filter * | sort CN | ft CN
#   Replication Topology (KCC) must have selected this site-pair for direct replication
#     If site-pair don't have connection objects (automatic-preferred) then it will not replicate.

function Replicate-SitePair($site1, $site2) {

  foreach ($c in (Get-ADReplicationConnection -Filter {ReplicateFromDirectoryServer -like "`*$site1`*" -and replicatetodirectoryserver -like "`*$site2`*"})) {
    foreach ($ctx in ($c.ReplicatedNamingContexts + $c.PartiallyReplicatedNamingContexts)) {
      repadmin /replicate (get-adobject "CN=NTDS Settings,$($c.replicatetodirectoryserver)").ObjectGUID (get-adobject "$($c.replicatefromdirectoryserver)").ObjectGUID "$ctx";
      write-host $c.replicatefromdirectoryserver;
      write-host $ctx;
      write-host ('='*80)
    }
  }

  foreach ($c in (Get-ADReplicationConnection -Filter {ReplicateFromDirectoryServer -like "`*$site2`*" -and replicatetodirectoryserver -like "`*$site1`*"})) {
    foreach ($ctx in ($c.ReplicatedNamingContexts + $c.PartiallyReplicatedNamingContexts)) {
      repadmin /replicate (get-adobject "CN=NTDS Settings,$($c.replicatetodirectoryserver)").ObjectGUID (get-adobject "$($c.replicatefromdirectoryserver)").ObjectGUID "$ctx";
      write-host $c.replicatefromdirectoryserver;
      write-host $ctx;
      write-host ('='*80)
    }
  }

}

# https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/replication/active-directory-replication-concepts
# KCC = Knowledge Consistency Checker
