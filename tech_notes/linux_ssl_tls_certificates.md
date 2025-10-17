# Linux SSL TLS Certificates

## Red Hat / CentOS Certificates

Server Certificates (Machine Identity)
* `/etc/pki/tls/certs` # for public cert
* `/etc/pki/tls/private` # for private key
* Configure server software to use these files
* Might also need intermediate CA's in a PEM chain file.

Trusted Certificate Authorities (CA) Trust Store
* `/etc/pki/ca-trust/source/anchors/` # put special CA certificates in here
  * Put `*.pem` files here.
* `update-ca-trust` # update the system default trust store(s)
* Related Documentation:
  * https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/securing_networks/using-shared-system-certificates

## Ubuntu Certificates

Server Certificates (Machine Identity)
* `/etc/ssl/certs` # for public cert
* `/etc/ssl/private` # for private key
* Related Documentation:
  * https://ubuntu.com/server/docs/security-certificates
* Configure server software to use these files
* Might also need intermediate CA's in a PEM chain file.

Trusted Certificate Authorities (CA) Trust Store
* `/usr/local/share/ca-certificates/` # for special CA certificates
* `update-ca-certificates` # update the system default trust store(s)
* Related Discussion:
  * https://askubuntu.com/questions/645818/how-to-install-certificates-for-command-line

