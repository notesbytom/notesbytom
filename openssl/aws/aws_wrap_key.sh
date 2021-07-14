#!/usr/bin/bash

set -o xtrace

# example from https://aws.amazon.com/premiumsupport/knowledge-center/invalidciphertext-kms/
# REPLACE PulicKey.bin with the filename of your wrapping key

openssl pkeyutl -in PlaintextKeyMaterial.bin -out EncryptedKeyMaterial.bin -inkey PublicKey.bin -keyform DER \
            -pubin -encrypt -pkeyopt rsa_padding_mode:oaep -pkeyopt rsa_oaep_md:sha256
