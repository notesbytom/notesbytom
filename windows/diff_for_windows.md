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
