# SSH Notes

## Legacy SSH Options

When connecting to a legacy SSH Server with the OpenSSH Command-Line Client, you may need to explicitly allow legacy protocols.

* `-o HostKeyAlgorithms=...`
  * Example Error: `Unable to negotiate with 1.2.3.4 port 22: no matching host key type found. Their offer: ...`
* `-o KexAlgorithms=...`
  * Example Error: `Unable to negotiate with 1.2.3.4 port 22: no matching key exchange method found. Their offer: ...`
* `-o Ciphers=...`
  * Or use the `-c` flag for a shorter way to do the same thing.
  * Example Error: `Unable to negotiate with 1.2.3.4 port 22: no matching cipher found. Their offer: ...`
 
The same type of options also work for `scp` but make sure to put them BEFORE the source and destination file(s).
