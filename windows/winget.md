# winget

Package Management on Windows now supports the `winget` command-line tool.

## Examples

* `winget show Git.Git`
  * `winget install Git.Git`
  * If the user does Not have administrative privileges, it can/will install in user-mode (single-user non-privileged install).
* `winget install Mozilla.Firefox --scope user`
* `winget install WinSCP.WinSCP --scope user`

## Download for Offline Install

For offline install needs, try the [`winget download` command][1].
* One app to try this with: "Windows Notepad [9MSMLRH6LZF3]"
* If applicable also try `--skip-license`

[1]: https://learn.microsoft.com/en-us/windows/package-manager/winget/download
