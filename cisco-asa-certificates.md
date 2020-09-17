# Cisco ASA Certificates

## Assign Cert to Services

SSL AnyConnect VPN server certificate assignment.
* `ssl trust-point CERT_TP_NAME outside`
  * Substitute a real trust point name and interface (outside is an example)

IKEv2 Remote-Access VPN server certificate assignment.
* `crypto ikev2 remote-access trustpoint CERT_TP_NAME`
  * Substitute a real trust point name
