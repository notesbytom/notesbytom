# Cisco ASA Certificates

## Assign Cert to Services

**SSL AnyConnect VPN** server certificate assignment.
* `ssl trust-point CERT_TP_NAME outside`
  * Substitute a real trust point name and interface (outside is an example)

**IKEv2 Remote-Access VPN** server certificate assignment.
* `crypto ikev2 remote-access trustpoint CERT_TP_NAME`
  * Substitute a real trust point name
  
**IKEv1 Remote-Access VPN** server certificate assignment.
```
tunnel-group GROUP_NAME ipsec-attributes
  ikev1 trust-point CERT_TRUSTPOINT_NAME
```
* Substitute real tunnel-group and trust-point names
  * Default tunnel-group for remote-access is `DefaultRAGroup`

**Client Authentication** with CA certificate (trustpoint)
```
crypto ca trustpoint YOUR_TRUSTPOINT_NAME
 validation-usage ipsec-client ssl-client
```
* The default for a trustpoint is: `ipsec-client ssl-client`
* Non-standard ipsec client cert? `ignore-ipsec-keyusage` (NOT recommended)
* Non-standard ssl client cert? `ignore-ssl-keyusage` (NOT recommended)

## Anyconnect and ASDM Web URL's

You can test the new certificate for SSL/TLS protocols using a web browser and the default URL's.

* Anyconnect will take over the default redirect for site-root
  * https://your.fqdn.com/
* ASDM Managment will be under /admin/ if Anyconnect is enabled
  * https://your.fqdn.com/admin/

## Encode PKCS12 binary to BASE64 text for ASA Import

Using `openssl` you can encode your PKCS12 binary file to a BASE64 text file.

* `openssl base64 -in binary_pkcs12_input_filename -out base64_text_output_filename`

Documentation for `openssl enc -base64` is analagous to `openssl base64`.

* https://www.openssl.org/docs/manmaster/man1/openssl-enc.html

## Import Certificates

If you're storing the ASA identity certificate and associated CA certificate in the same trustpoint, import the PKCS12 first to create the new trustpoint, then import the CA certificate after the PKCS12 import is complete and the new trustpoint was automatically created.

* Import a PKCS12 file into new ASA trustpoint
  * `crypto ca import YOUR_TP_NAME pkcs12 PKCS12_SECRET`
    * Past the base64 text encoded PKCS12 contents followed by `quit`
* Import the root (or intermediate) CA to your new trustpoint.
  * Enable terminal enrollment on the trustpoint first
    * `crypto ca trustpoint YOUR_TP_NAME`
      * `enrollment terminal`
  * `crypto ca authenticate YOUR_TP_NAME`
    * Paste the base64 PEM-encoded text certificate followed by `quit` then `yes` to accept
