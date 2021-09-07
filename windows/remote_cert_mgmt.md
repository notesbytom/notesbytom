# Windows Remote Certificate Management

The MMC Certificates Snap-in requires the `RemoteRegistry` service if managing certificates on a remote computer.

* Associated Error: "The certificate stores could not be enumerated. The network path was not found."
* Related Help Article: https://www.msnoob.com/the-certificate-stores-could-not-be-enumerated-remote-certificates-mmc.html

## Resolving the issue with PowerShell

```
$cred = get-credential
enter-pssession REMOTE_COMPUTER_NAME -Credential $cred
get-service RemoteRegistry | format-list *
set-service RemoteRegistry -StartupType Automatic -Verbose
start-service RemoteRegistry -Verbose
get-service RemoteRegistry | format-list *
exit-pssession
```

After the RemoteRegistry service is running, you should be able to connect with the MMC Snap-in.
If you have further issues, double-check that any related firewall rules are allowing your connection.
