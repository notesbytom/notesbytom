# curl on Windows

## Native curl on Windows

Recent versions of Windows ship with a native curl.exe command-line tool.

* Windows 10 20H2 has curl version 7.55.1
* [devblogs: Tar and Curl Come to Windows!](https://devblogs.microsoft.com/commandline/tar-and-curl-come-to-windows/)
* [techcommunity: Tar and Curl Come to Windows!](https://techcommunity.microsoft.com/t5/containers/tar-and-curl-come-to-windows/ba-p/382409)
* Windows Server 2019 ships with `curl`
* curl is NOT included in Server 2016

## curl in Git Bash

Git for Windows includes Git Bash cli tools based on msys2 which includes `curl`.

* https://git-scm.com/ - Git official Windows distribution

## netrc Credentials

Credentials for protocols like FTP can be specified in a `.netrc` configuration file.

* Option: [`--netrc`](https://curl.se/docs/manpage.html#-n)
  * Unix/Linux/Git-Bash: `$HOME/.netrc` (`~/.netrc`)
  * Windows-Native: `$env:HOME\_netrc` (`%HOME%\_netrc`)
    * NOTE: HOME is MISSING on Windows by default.
    * cmd (temporary): `set HOME=%USERPROFILE%`
    * powershell (temporary): `$env:HOME=$env:USERPROFILE`
    * see notes below on setting persistent environment variables
* Option: [`--netrc-file`](https://curl.se/docs/manpage.html#--netrc-file)
  * Override default path and filename of `.netrc` file

## CURL_SSL_BACKEND Environment Variable

The **Windows-native `curl.exe` automatically uses the system Certificate Trust Store** to validate server certificates.

**For git-bash `curl` you MUST set the `CURL_SSL_BACKEND` environment-variable to `schannel`**

## Setting Environment Variables

Examples for setting Windows environment variables both temporarily (process level) or persistently (user or machine level).

* cmd (temporary): `set HOME=%USERPROFILE%`
* powershell (temporary): `$env:HOME=$env:USERPROFILE`
* `setx` ... I don't know how to use this but I think it can set persistent environment variables
* GUI: `rundll32 sysdm.cpl,EditEnvironmentVariables`
* powershell (persistent or temp): [`[Environment]::SetEnvironmentVariable(...)`](https://docs.microsoft.com/en-us/dotnet/api/system.environment.setenvironmentvariable)
