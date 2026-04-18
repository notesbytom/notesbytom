# Ansible Collections

* https://docs.ansible.com/projects/ansible/latest/reference_appendices/config.html#collections-scan-sys-path
* Defaults to true
* Python `sys.path` or PYTHONPATH environment variable.
* In a `venv` it is likely `$VIRTUAL_ENV/lib/pythonN.NN/site-packages` or `sys.path[-1]`
