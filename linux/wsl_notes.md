# Windows Subsystem for Linux (WSL)

WSL can run most generic Linux container rootfs images such as those for RHEL/CentOS/Rocky.
This can be useful for running Ansible controller playbooks from a Windows machine.

## Rocky Linux Containers with WSL

Rocky documentation: [Import Rocky Linux to WSL][1]. My own notes might differ, see below.

* Install **WSL without any underlying distribution**
  * `wsl --install --no-distribution`
  * **Reboot** is usually required to complete initial WSL install
* Download a Rocky container rootfs
  * https://dl.rockylinux.org/pub/rocky/9/images/x86_64/ for Rocky 9
  * Files with names like `*-Container-*-latest-*`
* Import the Rocky Container into WSL
  * `wsl --import DISTRO_NAME INSTALL_PATH CONTAINER_FILE`
  * Name the WSL instance DISTRO_NAME like: "Rocky"
  * The INSTALL_PATH is a full path to a folder where WSL will put a VHDX virtual-disk file.
  * For CONTAINER_FILE specify the full path to your Rocky container rootfs file downloaded earlier.

## Rocky Minimal Container

The Rocky Minimal Container rootfs image has an Extremely Limited number of default packages installed.
This can help minimize the amount of disk space and system resources used by your Rocky Linux WSL distribution instance.
Here are some notes of packages that might be useful to install in the minimal container.
* `which` # search the PATH for a named command/program

[1]: https://docs.rockylinux.org/guides/interoperability/import_rocky_to_wsl/
