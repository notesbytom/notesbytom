# OpenSSL Notes

## Using OpenSSL on Windows. 

One easy way is to install Git for Windows and access it through Git Bash.
* use `winpty` before openssl commands if they will prompt for input (or it will freeze)

## Default Configuration

Show build details including default configuration path (for openssl.cnf).
* `openssl version -a`

## Changes to Config File

There is a line that should be uncommented under the `[ req ]` section of your customized `openssl.cnf` for creating Certificate Signing Requests (CSR).

* `req_extensions = v3_req`
