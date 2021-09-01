# gpg with Git Bash

Git Windows distribution ships with the `gpg` cli tool. 
This tool can be run from within git-bash, or directly from other windows cli environments like powershell.

## Generate a Symmetric Key File

There are other ways to generate a sequence of random characters. This is a simple example using gpg.

* In Git Bash
  *  `gpg --armor --gen-random 2 30 > test_key`
* In Powershell
  * `& 'C:\Program Files\Git\bin\bash.exe' -l -c 'gpg --armor --gen-random 2 30 > test_key'`
* RESTRICT ACCESS to this key file if you plan to encrypt and decrypt data with it!!

## Encrypt a File With Symmetric Key

* In Git Bash
  * `gpg --batch --armor --passphrase-file test_key --symmetric test.txt`
* OUTPUT FILE will be `test.txt.asc` (appends `.asc` to original filename)

## Decrypt a File With Symmetric Key

* In Git Bash
  * `gpg --batch --quiet --passphrase-file test_key --output test.txt --decrypt test.txt.asc`
* OUTPUT file is named in `--output` option

## Securely Delete Plaintext File

The `shred` cli tool is included in Git Bash. It can be used to securely delete files.

* In Git Bash
  * `shred --remove test_file`

## Expand Bash Variables

Directly in git-bash, variable notation like `~` or `$HOME` will expand
to indicate a real value for programs.

When running git-bash tools externally like from PowerShell, prefix a command with `eval`
to invoke shell-expansion in a command-string.

* ...