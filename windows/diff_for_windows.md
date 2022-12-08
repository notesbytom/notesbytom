# Diff for Windows

## File Compare (fc.exe)

Windows ships with the `fc.exe` (file compare) tool which can be used from the command line.

Unfortunately there is a conflict with the `Format-Custom` alias `fc` in PowerShell. 
To workaround this, always specify the executable name with the extension: `fc.exe`.

## WinMerge GUI Diff for Windows

If you prefer a GUI diff utility, there might be one built into your favorite Integrated Development Environment (IDE).
If you're looking for a standalone graphical diff tool, WinMerge is a popular option.

* https://winmerge.org/ (downloads and documentation)
* https://github.com/WinMerge/winmerge/ (open-source project)

## PowerShell Compare-Object

Powershell has a built-in alias called `diff` that maps to `Compare-Object`.
There is a discussion about using Compare-Object as a diff or fc.exe alternative here:

* https://serverfault.com/questions/5598/how-do-i-diff-two-text-files-in-windows-powershell
* It behaves differently than Linux/Unix `diff` or Windows `fc.exe` so the discussion is worth reading.

## Git Bash (diff)

If you install Git for Windows, you will get the Linux/Unix `diff` command as part of Git Bash.

* https://git-scm.com/download/win (download and documentation - Git for Windows, includes Git Bash)
* https://gitforwindows.org/ (Git for Windows project site)
* https://github.com/git-for-windows/git/ (open-source project - Git for Windows)
* https://www.gnu.org/software/diffutils/ (GNU Diffutils project site)
