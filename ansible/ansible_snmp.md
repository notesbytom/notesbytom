# Ansible SNMP

Some tech notes about SNMP capabilities in the Ansible ecosystem.

## Related Documentation

* [Collection `ansible.snmp`][1] on GitHub
  * Connection Plugins for SNMP
  * Modules for SNMP `get`, `set`, and `walk`
  * Requires `net-snmp` with python bindings
* [Module `community.general.snmp_facts`][2]
  * Get facts like `syscontact` and `syslocation`
  * Requires `pysnmp`

[1]: https://github.com/ansible-collections/ansible.snmp
[2]: https://docs.ansible.com/projects/ansible/latest/collections/community/general/snmp_facts_module.html
