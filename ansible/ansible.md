# Ansible Tech Notes

Ansible can be used to automate and verify configurations on network hosts such as servers, routers, switches, firewalls, etc.

* RHEL 9 and clones have the `ansible-core` package available.
* [Installing Collections][1]

## Inventory Targets

* [Implicit `localhost`][5] - automate things on the ansible 'controller' server
  * Uses [ansible.builtin.local][6] `ansible_connection: local`

## Cisco Automation with Ansible

* Ansible [Platform Options][9]
  * Scroll down to "Settings by Platform" for values for `ansible_network_os` and `ansible_connection`
  * Typical Network Connection Setting: `ansible_connection: ansible.netcommon.network_cli`
* [cisco.ios][2] collection [ios github][2g]
  * Ansible [IOS Platform Options][8]. Example of Required Host Variables!!
  * `ansible_network_os: cisco.ios.ios`
* [cisco.asa][7] collection [asa github][7g]
  * `ansible_network_os: cisco.asa.asa`
* dependency [ansible.utils][3] collection [utils github][3g]
  * IP Address and Network Prefix Utilities
* dependency [ansible.netcommon][4] collection [netcommon github][4g]
  * Transfer files to and from network devices.
  * Run commands on network devices.
  * NETCONF and RESTCONF support

## Filters

Advanced ansible solutions are likely to use Jinja Filters.

* [Jinja Builtin Filters][10]
  * includes: map, select, sort, reject, reverse ...
* [Ansible Builtin Filters][11]

[1]: https://docs.ansible.com/ansible/latest/collections_guide/collections_installing.html
[2]: https://docs.ansible.com/ansible/latest/collections/cisco/ios/index.html
[2g]: https://github.com/ansible-collections/cisco.ios
[3]: https://docs.ansible.com/ansible/latest/collections/ansible/utils/index.html
[3g]: https://github.com/ansible-collections/ansible.utils
[4]: https://docs.ansible.com/ansible/latest/collections/ansible/netcommon/index.html
[4g]: https://github.com/ansible-collections/ansible.netcommon
[5]: https://docs.ansible.com/ansible/latest/inventory/implicit_localhost.html
[6]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/local_connection.html
[7]: https://docs.ansible.com/ansible/latest/collections/cisco/asa/index.html
[7g]: https://github.com/ansible-collections/cisco.asa
[8]: https://docs.ansible.com/ansible/latest/network/user_guide/platform_ios.html
[9]: https://docs.ansible.com/ansible/latest/network/user_guide/platform_index.html
[10]: https://jinja.palletsprojects.com/en/stable/templates/#list-of-builtin-filters
[11]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html
