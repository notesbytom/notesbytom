# SSH Notes

## Legacy SSH Options

When connecting to a legacy SSH Server with the OpenSSH Command-Line Client, you may need to explicitly allow legacy protocols.

* `-o HostKeyAlgorithms=...`
  * Example Error: `Unable to negotiate with 161.51.5.235 port 22: no matching host key type found. Their offer: ssh-rsa`
