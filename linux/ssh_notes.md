# SSH Notes

[OpenSSH Manual Pages][1]

## Legacy SSH Options

When connecting to a legacy SSH Server with the OpenSSH Command-Line Client, you may need to explicitly allow legacy protocols.

* `-o HostKeyAlgorithms=...`
  * Example Error: `Unable to negotiate with 1.2.3.4 port 22: no matching host key type found. Their offer: ...`
* `-o KexAlgorithms=...`
  * Example Error: `Unable to negotiate with 1.2.3.4 port 22: no matching key exchange method found. Their offer: ...`
* `-o Ciphers=...`
  * Or use the `-c` flag for a shorter way to do the same thing.
  * Example Error: `Unable to negotiate with 1.2.3.4 port 22: no matching cipher found. Their offer: ...`

## SCP

The same type of options also work for `scp` but make sure to put them BEFORE the source and destination file(s).

* `-O`
  * Use Legacy (Old) SCP Protocol instead of newer SFTP

## Related Reading

* [RFC 6187 X.509 Certificates for SSH Authentication][2]
  * In my Cisco ASA User Management notes.
  * Support for this is Extremely Limited. Recommend instead to use more common SSH authentication features.

[1]: https://www.openssh.org/manual.html
[2]: ../cisco-asa/asa_user_management.md
