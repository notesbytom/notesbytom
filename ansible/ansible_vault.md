# Ansible Vault

Sensitive items in Ansible can be encrypted and decrypted with the included `ansible-vault` feature.

## Vault Identifiers

When ansible is decrypting a string value or file, you can use [vault identifier labels/tags][3] as a hint or note to indicate which vault-password to use.
This is useful for having separate vaults to unlock sensitive values for different teams, roles, or individuals.
* In the following examples, `label` is a Vault Identifier
  * Settings [associating Vault-Id's with vault-passwords][6]
    * CLI Option `--vault-id label@source`
    * _source can be a prompt, a file, or a script_
    * Or Ansible Config File `[default]` section: `vault_identity_list=label@source,label2@source2`
    * Or Environment Variable `ANSIBLE_VAULT_IDENTITY_LIST`
  * Encrypted string/file header vault-id label examples
    * `$ANSIBLE_VAULT;1.2;AES256;label` - decrypt with vault-id `label`
    * `$ANSIBLE_VAULT;1.2;AES256;label2` - decrypt with vault-id `label2`
* Settings to [require vault-id's to match][5] (default is to try all known vault-ids at runtime)
  * In Ansible Config File `[defaults]` section: `vault_id_match=True`
  * Environment Variable `ANSIBLE_VAULT_ID_MATCH`
  * Default is False (tries all known vault-id's when decrypting strings/files)

## Encrypting Strings

Instead of encrypting whole files, `ansible-vault` can also incrypt individual string values which can then be pasted directly into Ansible YAML files as values.
Those will then be decrypted automatically at runtime as long as a compatible vault-id/vault-password is available to

## Documentation

* [ansible-vault][1] CLI tool
* [Protecting sensitive data with Ansible vault][2]
* [Managing multiple passwords with vault IDs][3]
* [Storing and accessing vault passwords][4]

[1]: https://docs.ansible.com/projects/ansible/latest/cli/ansible-vault.html
[2]: https://docs.ansible.com/projects/ansible/latest/vault_guide/index.html
[3]: https://docs.ansible.com/projects/ansible/latest/vault_guide/vault_managing_passwords.html#managing-multiple-passwords-with-vault-ids
[4]: https://docs.ansible.com/projects/ansible/latest/vault_guide/vault_managing_passwords.html#storing-and-accessing-vault-passwords
[5]: https://docs.ansible.com/projects/ansible/latest/reference_appendices/config.html#default-vault-id-match
[6]: https://docs.ansible.com/projects/ansible/latest/reference_appendices/config.html#default-vault-identity-list
