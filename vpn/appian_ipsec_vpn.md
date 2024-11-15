# Appian IPsec Data Source Connectivity

## Multiple Tunnels

If you have Databases or Data Sources at different sites, you might want to build separate tunnels to send that 
Appian data traffic directly to the location of the data source.

In my experience when using Multiple Tunnels with the same Appian instance, 
the Same IKEv2 Phase-1 and IPsec/ESP Phase-2 parameters should be used. This might be something buggy with the way
Appian or Libreswan handle multiple tunnels terminating on the same Appian server/node.

## Related Documentation 

Documentation from Appian Support and Other Sources

* Appian Site-to-Site IPsec [VPN Integration][1]
* Appian [Self Service VPN][2] Web GUI Configuration Tool
* Appian [Dynamic VPN Routing][3] Using BGP
* Appian: [Requesting a Custom Domain][4]
  * *If you are accessing your [Appian] environment over VPN or in a dual access configuration, you must customize all three [Appian] FQDNs.*
* Appian: [Self-Service Certificate Management][5]
  * *Required for Custom Domains*
* Appian: [Configuring Inbound Access Over VPN][6]
* Appian: [Configuring Inbound Dual Access][7]
* [High Availability for Appian Cloud][8]
* Libreswan [Cipher suites and algorithm support][9]
  * *Libreswan only supports scenario's where the PRF and INTEG are the same.*
  * *There is one special case. ... newer AEAD algorithms work differently. ... Examples of such algorithms are AES_GCM
    ... AEAD encryption types are not allowed to specify an "integrity" algorithm (or specify integrity algorithm "none").*
    * For IKEv2 Phase-1, we specify the PRF as if it was the Integrity like: `ike=aes_gcm-sha2`
    * For IPsec/ESP Phase-2, we do not have separate integrity or prf like: `phase2alg=aes_gcm-null`

[1]: https://docs.appian.com/suite/help/24.3/Cloud_VPN_Integration.html
[2]: https://docs.appian.com/suite/help/24.3/Cloud_Self_Service_VPN.html
[3]: https://docs.appian.com/suite/help/24.3/Dynamic_VPN_Routing.html
[4]: https://docs.appian.com/suite/help/24.3/Using_a_Custom_Domain_in_Appian_Cloud.html
[5]: https://docs.appian.com/suite/help/24.3/Self_Service_Certificate_Management_for_Appian_Cloud.html
[6]: https://docs.appian.com/suite/help/24.3/Configuring_Inbound_Access_Over_VPN.html
[7]: https://docs.appian.com/suite/help/24.3/Configuring_Dual_Inbound_Access.html
[8]: https://docs.appian.com/suite/help/24.3/High_Availability_for_Appian_Cloud.html
[9]: https://libreswan.org/wiki/Cipher_suites_and_algorithm_support
