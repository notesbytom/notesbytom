# Ansible Tech Notes

Ansible can be used to automate and verify configurations on network hosts such as servers, routers, switches, firewalls, etc.

* RHEL 9 and clones have the `ansible-core` package available.
* [Installing Collections][1]

## Inventory Targets

* [Implicit `localhost`][5] - automate things on the ansible 'controller' server
  * Uses [ansible.builtin.local][6] `ansible_connection: local`

## Cisco Automation with Ansible

* [cisco.ios][2] collection [ios github][2g]
  * dependency [ansible.utils][3] collection [utils github][3g]
    * IP Address and Network Prefix Utilities
  * dependency [ansible.netcommon][4] collection [netcommon github][4g]
    * Transfer files to and from network devices.
    * Run commands on network devices.
    * NETCONF and RESTCONF support

[1]: https://docs.ansible.com/ansible/latest/collections_guide/collections_installing.html
[2]: https://docs.ansible.com/ansible/latest/collections/cisco/ios/index.html
[2g]: https://github.com/ansible-collections/cisco.ios
[3]: https://docs.ansible.com/ansible/latest/collections/ansible/utils/index.html
[3g]: https://github.com/ansible-collections/ansible.utils
[4]: https://docs.ansible.com/ansible/latest/collections/ansible/netcommon/index.html
[4g]: https://github.com/ansible-collections/ansible.netcommon
[5]: https://docs.ansible.com/ansible/latest/inventory/implicit_localhost.html
[6]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/local_connection.html
