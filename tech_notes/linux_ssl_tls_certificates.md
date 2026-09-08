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
* RHEL 10 Documentation - Securing Networks - [Using Shared System Certificates][1]

CA List for Client Certificate Validation
* [Apache HTTPd Client Certificate Validation][2] Notes
  * `SSLCACertificateFile` - single file of concatenated PEM CA certs for Client trust
  * `SSLCACertificatePath` - directory with `openssl rehash ...` type of PEM CA files
  * `SSLVerifyDepth` - maximum number of CA's in chain from above CACertificate to Client cert.
    * default of 1 means CA must be directly listed in CACertificate* config
  * `SSLCARevocationFile` - single file of concatenated PEM CRL files for Client CA's
  * `SSLCARevocationPath` - directory with [openssl rehash ...][3] type of PEM CRL files
  * `SSLCARevocationCheck` - enable client cert revocation checking

## Ubuntu / Debian Certificates

Server Certificates (Machine Identity)
* `/etc/ssl/certs` # for public cert
* `/etc/ssl/private` # for private key
* Related Documentation:
  * https://ubuntu.com/server/docs/security-certificates
* Configure server software to use these files
* Might also need intermediate CA's in a PEM chain file.

Trusted Certificate Authorities (CA) Trust Store
* `/usr/local/share/ca-certificates/` # for special CA certificates
  * Put `*.crt` files here. The Filename Must End with '.crt' !!
* `update-ca-certificates` # update the system default trust store(s)
* Related Discussion:
  * https://askubuntu.com/questions/645818/how-to-install-certificates-for-command-line

[1]: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/securing_networks/using-shared-system-certificates
[2]: https://httpd.apache.org/docs/2.4/mod/mod_ssl.html
[3]: https://docs.openssl.org/4.0/man1/openssl-rehash/
