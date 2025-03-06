# OpenSSL Notes

## Using OpenSSL on Windows. 

One easy way is to install **Git for Windows** and access it through **Git Bash**.
* use `winpty` before openssl commands if they will prompt for input (or it will freeze)

## Default Configuration

Show build details including default configuration path (for openssl.cnf).
* `openssl version -a`

## Verify Server Cert

Example commands to retrieve and view TLS/SSL certificate presented by a server.

* `echo "Q" | openssl s_client -connect "your.fqdn.com:443" | openssl x509 -noout -text`

## Changes to Config File

I recommend making a local user-specific copy of the system default `openssl.cnf` file and using `openssl -config` to specify your user copy of the config.

There is a line that should be uncommented under the `[ req ]` section of your customized `openssl.cnf` for creating Certificate Signing Requests (CSR).

* `req_extensions = v3_req`
  * Uncomment this under `[ req ]` section

If openssl version is 1.1.1 or newer, Comment-Out `RANDFILE` entries from `openssl.cnf` ... or just ignore the "can't load .rnd into RNG" error.

* Comment these lines out
* `# RANDFILE = $ENV::HOME/.rnd`
* `# RANDFILE = $dir/private/.rand`
* To match change made from openssl project "Remove RANDFILE from openssl.cnf"
  * https://github.com/openssl/openssl/commit/1fd6afb571e85fbc37ffb522646e7ec2c6e4a11e
* Related issue "Can't load .rnd into RNG" at https://github.com/openssl/openssl/issues/7754
  * "If you have RANDFILE=... configuration lines in your openssl.cnf than you can safely remove them, ... because saving and restoring the rng state is not necessary anymore in the openssl 1.1.1 random generator."
