# Windows PKI SSL/TLS Notes

## Windows Certificate Store

The windows certificate store for the local computer (machine) is default location for web-server certificates used by IIS.

There are several locations within the cert store where a cert key-pair might be installed. Check all of these if you don't find your cert in Personal.

* Personal
  * Cert:\LocalMachine\My\
* Remote Desktop
  * Cert:\LocalMachine\Remote Desktop\
* Web Hosting
  * Cert:\LocalMachine\WebHosting\

## Exportable Cert Key-Pair Migration

If a key is marked as exportable then you can migrate the certificate to another system by exporting it.

If your cert key is non-exportable then Windows will block you from exporting the private key. 
If there are any workarounds to export these protected keys, Microsoft does not support or acknowledge this.
