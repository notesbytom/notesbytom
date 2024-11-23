# Ansible Tech Notes

Ansible can be used to automate and verify configurations on network hosts such as servers, routers, switches, firewalls, etc.

* RHEL 9 and clones have the `ansible-core` package available.
* [Installing Collections][1]

## Cisco Automation with Ansible

* [cisco.ios][2] collection [ios github][2g]
  * dependency [ansible.utils][3] collection [utils github][3g]
  * dependency [ansible.netcommon][4] collection [netcommon github][4g]

[1]: https://docs.ansible.com/ansible/latest/collections_guide/collections_installing.html
[2]: https://docs.ansible.com/ansible/latest/collections/cisco/ios/index.html
[2g]: https://github.com/ansible-collections/cisco.ios
[3]: https://docs.ansible.com/ansible/latest/collections/ansible/utils/index.html
[3g]: https://github.com/ansible-collections/ansible.utils
[4]: https://docs.ansible.com/ansible/latest/collections/ansible/netcommon/index.html
[4g]: https://github.com/ansible-collections/ansible.netcommon
