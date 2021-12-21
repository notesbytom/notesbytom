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
