# DNF Package Manager

DNF is the new name for the old `yum` package manager.

## Microdnf

In a minimal installation like one provided for small containers, the provided command might be `microdnf` which has a slightly reduced set of capabilities and options.

* `microdnf repoquery`
  * This will list all available packages from enabled repositories. Pipe to grep to filter.
  * `microdnf repoquery '*vim*'` # search for package names containing "vim"
* `microdnf repoquery PKGNAME --info`
  * Append `--info` to get detail about the listed package(s)
