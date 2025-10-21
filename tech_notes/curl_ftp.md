# curl ftp

## Deleting ftp files

Curl appears to be missing a direct option to delete ftp files, 
but you can use the `--quote` option to send ftp-delete commands

* `ftp://server.fqdn/folder/`
  * Provide the full path to the folder for uploads
* `--head`
  * Use the head option to avoid uploading or downloading any files
  * This is similar to `NOOP` in theory but the implementation uses `REST` I believe?
* `--quote '+DELE filename.ext'`
  * Prefix the quoted-command with `+` to run it after curl completes CWD (change working directory) to the folder from URL
  * **the `+` prefix doesn't work with `--list-only` ... use `--head` instead!!**

## Troubleshooting FTPS

* [FTPS Implicit, Explicit, Common Problems](https://everything.curl.dev/ftp/ftps.html) (from "Everything curl" book)
* [openssl - download cert of FTPS server][1]
  * `openssl s_client -showcerts -connect ftp.server.fqdn:21 -starttls ftp`
 
## CA Certificate Trust

Root and Intermediate CA Certificate Trust List notes.
* [RHEL/CentOS/Fedora CA-Certificates Package Info](https://fedoraproject.org/wiki/CA-Certificates)
  * [Source Code Mirror for ca-certificates][2]
  * Includes `update-ca-trust` script code

[1]: https://stackoverflow.com/questions/10397334/libcurl-is-there-any-way-to-get-certificates-of-ftps-without-logging-in
[2]: https://gitlab.com/redhat/centos-stream/rpms/ca-certificates
