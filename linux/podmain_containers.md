# Podman Containers

Tech Notes for Podman and Linux Containers. Functionality should be very similar to Docker.

## Universal Base Images

Red Hat Compatible Container Images may be provided in UBI format. Note that *"Red Hat [only supports the latest version of UBI and does not support parking on a dot release][3]."*
* `ubi` [Standard Images][1]
  * Includes an `init` system (`systemd`)
  * CMD is `/bin/bash`?
  * Obeys normal signals to exit (SIGTERM/SIGKILL)?
  * `ps` and related process commands ABSENT (`procps-ng`)?
* [`ubi-init` Images][2]
  * CMD is `/sbin/init` (obviously init/systemd included)
  * `ps` and related commands included (package `procps-ng`)
  * Ignores normal signals to exit
* [`ubi-minimal` Images][3]
  * Less than half the size of standard images
  * `microdnf` (instead of full dnf)
  * NO `systemd` or init script support
* [`ubi-micro` Images][4]
  * NO dnf/microdnf package manager!
  * Also known as "Distroless"?

## Terminology and Definitions

* Open Container Initiative (OCI)
* Universal Base Image (UBI)

[1]: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html-single/building_running_and_managing_containers/index#understanding-the-ubi-standard-images
[2]: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html-single/building_running_and_managing_containers/index#understanding-the-ubi-init-images
[3]: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html-single/building_running_and_managing_containers/index#understanding-the-ubi-minimal-images
[4]: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html-single/building_running_and_managing_containers/index#understanding-the-ubi-micro-images
