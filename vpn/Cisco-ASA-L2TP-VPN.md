# Cisco ASA L2TP VPN

## L2TP Pre-Shared Key VPN Connection

The L2TP Protocol and Cisco ASA don't have any way to identify separate connection profiles when L2TP connections use Pre-Shared-Key to authenticate IPsec Phase 1 (IKE/ISAKMP).

Because we cannot specify a profile name, we must use the Cisco ASA tunnel-group "DefaultRAGroup" in the configuration. 
This is the VPN profile that is used when no other remote-access profiles match.

## IP Address Pools

IP Address Pools for Remote-Access clients are defined with `ip local pool` and assigned to a tunnel-group with `address-pool`

## Phase One Encryption

IPsec Phase One (IKE/ISAKMP) encryption settings compatible with Windows L2TP-IPsec client default settings.
* Cipher: 3DES
* HMAC: SHA1
* Diffie Hellman Group: 2

Reference: [Default Encryption Settings for the Microsoft L2TP/IPSec Virtual Private Network Client](https://support.microsoft.com/en-us/help/325158/default-encryption-settings-for-the-microsoft-l2tp-ipsec-virtual-priva)
