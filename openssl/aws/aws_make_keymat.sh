#!/usr/bin/bash

set -o xtrace

# example from https://aws.amazon.com/premiumsupport/knowledge-center/invalidciphertext-kms/

openssl rand -out PlaintextKeyMaterial.bin 32

