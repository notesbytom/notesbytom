# Cisco ASA L2TP VPN

# L2TP Pre-Shared Key VPN Connection

The L2TP Protocol and Cisco ASA don't have any way to identify separate connection profiles when L2TP connections use Pre-Shared-Key to authenticate IPsec Phase 1 (IKE/ISAKMP).

Because we cannot specify a profile name, we must use the Cisco ASA "DefaultRAGroup" in the configuration. 
This is the VPN profile that is used when no other remote-access profiles match.
