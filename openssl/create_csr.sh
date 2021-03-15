#!/bin/bash
# Example script to create Certificate Signing Request (CSR) with openssl
set -o xtrace

# assumes a copy of openssl.cnf in working directory (pwd)
# ... customize openssl.cnf ... like uncommenting "req_extensions = v3_req" under [req] section

# set your Primary FQDN as the commonName variable
# set your Alias FQDN's as comma-separated "DNS: f.q.d.n" entries in altNames variable

# for Git Bash on Windows, prefix Subject with double-slash like: "//CN=..."
# for Git Bash on Windows, prefix openssl command with winpty: winpty openssl ...

commonName="server.example.com"
mySubject="/CN=$commonName"
altNames="DNS: $commonName, DNS: alias.example.com, IP: 1.2.3.4"

openssl req \
        -new \
        -subj "$mySubject" \
        -addext "subjectAltName = $altNames" \
        -newkey rsa:2048 \
        -keyout "$commonName.key" \
        -out "${commonName}_req.pem" \
        -config "openssl.cnf"

# script will prompt user for a password to protect the key file
