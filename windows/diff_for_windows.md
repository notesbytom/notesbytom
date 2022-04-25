# Diff for Windows

# File Compare (fc.exe)

Windows ships with the `fc.exe` (file compare) tool which can be used from the command line.

Unfortunately there is a conflict with the `Format-Custom` alias `fc` in PowerShell. 
To workaround this, always specify the executable name with the extension: `fc.exe`.
