# Cisco ASA Certificates

## Assign Cert to Services

SSL AnyConnect VPN server certificate assignment.
* `ssl trust-point CERT_TP_NAME outside`
  * Substitute a real trust point name and interface (outside is an example)

IKEv2 Remote-Access VPN server certificate assignment.
* `crypto ikev2 remote-access trustpoint CERT_TP_NAME`
  * Substitute a real trust point name
  
IKEv1 Remote-Access VPN server certificate assignment.
```
tunnel-group GROUP_NAME ipsec-attributes
  ikev1 trust-point CERT_TRUSTPOINT_NAME
```
* Substitute real tunnel-group and trust-point names
  * Default tunnel-gruop for remote-access is `DefaultRAGroup`


## Anyconnect and ASDM Web URL's

You can test the new certificate for SSL/TLS protocols using a web browser and the default URL's.

* Anyconnect will take over the default redirect for site-root
  * https://your.fqdn.com/
* ASDM Managment will be under /admin/ if Anyconnect is enabled
  * https://your.fqdn.com/admin/
