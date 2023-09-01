# Cisco IOS IKEv2 IPsec Tunnels

# Example Configuration Virtual Tunnel Interface IKEv2

Selection of properties like lifetime can be left to defaults - the value here is just a placeholder.

Encryption, Integrity, Diffie-Hellman Groups, Perfect Forward Secrecy, Transform-Set, 
and other associated properties should be configured for compatibility with the remote peer settings.

```
crypto ikev2 proposal ikev2_prop1
 encryption aes-cbc-256
 integrity sha256
 group 20

crypto ikev2 policy ikev2_policy1
 match address local 10.10.10.1
 proposal ikev2_prop1

crypto ikev2 keyring key_test
 peer remote_ipsec_peer
  description My Remote IPsec Peer
  address 10.10.10.2
  pre-shared-key my_test_key
!
crypto ikev2 profile ikev2_prof1
 match address local 10.10.10.1
 match identity remote address 10.10.10.2 255.255.255.255
 authentication remote pre-share
 authentication local pre-share
 keyring local key_test
 lifetime 43200

crypto logging ikev2

crypto ipsec transform-set esp_gcm_256 esp-gcm 256

crypto ipsec profile ipsec_prof1
 set security-association lifetime seconds 43200
 set transform-set esp_gcm_256
 set pfs group20
 set ikev2-profile ikev2_prof1

interface Tunnel1
 ip address 169.254.254.1 255.255.255.252
 tunnel source 10.10.10.1
 tunnel mode ipsec ipv4
 tunnel destination 10.10.10.2
 tunnel protection ipsec profile ipsec_prof1
end
```
