# Ansible Vault

Sensitive items in Ansible can be encrypted and decrypted with the included `ansible-vault` feature.

## Vault Identifiers

When ansible is decrypting a string value or file, you can use [vault identifier labels/tags][3] as a hint or note to indicate which vault-password to use.
This is useful for having separate vaults to unlock sensitive values for different teams, roles, or individuals.
* In the following examples, `label` is a Vault Identifier
  * Settings [associating Vault-Id's with vault-passwords][6]
    * CLI Option `--vault-id label@source`
    * _source can be a prompt, a file, or a script_
    * Or Ansible Config File `[defaults]` section: `vault_identity_list=label@source,label2@source2`
    * Or Environment Variable `ANSIBLE_VAULT_IDENTITY_LIST`
  * Encrypted string/file header vault-id label examples
    * `$ANSIBLE_VAULT;1.2;AES256;label` - decrypt with vault-id `label`
    * `$ANSIBLE_VAULT;1.2;AES256;label2` - decrypt with vault-id `label2`
* Settings to [require vault-id's to match][5] (default is to try all known vault-ids at runtime)
  * In Ansible Config File `[defaults]` section: `vault_id_match=True`
  * Environment Variable `ANSIBLE_VAULT_ID_MATCH`
  * Default is False (tries all known vault-id's when decrypting strings/files)
* Setting [which Vault-Id label is used to encrypt][8] a string or file (if multiple vault-id's are known)
  * CLI Option `--encrypt-vault-id=label`
  * Or Ansible Config File `[defaults]` section: `vault_encrypt_identity=label`
  * Or Environment Variable `ANSIBLE_VAULT_ENCRYPT_IDENTITY`

## Encrypting Strings

Instead of encrypting whole files, `ansible-vault` can also [encrypt individual string values][7] which can then be pasted directly into Ansible YAML files as values.
Those will then be decrypted automatically at runtime as long as a compatible vault-id/vault-password is available.

Review the example _"To be prompted for a string to encrypt, encrypt it with the ‘dev’ vault password from ‘a_password_file’, name the variable ‘new_user_password’ and give it the vault ID label ‘dev’"_ 
from [Creating encrypted variables][7].
* Take Note of the WARNING: _Do not press Enter after supplying the string to encrypt. That will add a newline to the encrypted value._
* The Prompt will be something like this: _Reading plaintext input from stdin. (ctrl-d to end input, twice if your content does not already have a new line)_
  * To Avoid Breaking your Encrypted Value with a trailing newline character, do NOT press the Enter key, but Instead type Ctrl-D Twice!!

## Documentation

* [ansible-vault][1] CLI tool
* [Protecting sensitive data with Ansible vault][2]
* [Managing multiple passwords with vault IDs][3]
* [Storing and accessing vault passwords][4]
* [Creating encrypted variables][7]

[1]: https://docs.ansible.com/projects/ansible/latest/cli/ansible-vault.html
[2]: https://docs.ansible.com/projects/ansible/latest/vault_guide/index.html
[3]: https://docs.ansible.com/projects/ansible/latest/vault_guide/vault_managing_passwords.html#managing-multiple-passwords-with-vault-ids
[4]: https://docs.ansible.com/projects/ansible/latest/vault_guide/vault_managing_passwords.html#storing-and-accessing-vault-passwords
[5]: https://docs.ansible.com/projects/ansible/latest/reference_appendices/config.html#default-vault-id-match
[6]: https://docs.ansible.com/projects/ansible/latest/reference_appendices/config.html#default-vault-identity-list
[7]: https://docs.ansible.com/projects/ansible/latest/vault_guide/vault_encrypting_content.html#creating-encrypted-variables
[8]: https://docs.ansible.com/projects/ansible/latest/reference_appendices/config.html#default-vault-encrypt-identity
