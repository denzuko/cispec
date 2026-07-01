---
title: "key-length"
term: "key-length"
core: false
recommendedFor: ["any CI that is a cryptographic key or certificate"]
related: ["algorithm", "key-type", "assurance-level", "expiry"]
docOid: "1.3.6.1.4.1.42387.2.6.9.2"
docGuid: "cb348b85-ab41-5808-bf2e-6b3dd60a2706"
date: 2026-06-30
draft: false
---

`org.cispec.key-length` records the bit length of a cryptographic
key. Paired with [`org.cispec.algorithm`](/algorithm/), it gives the
complete cryptographic strength specification of a key or certificate
CI — the two facts together determine whether the key meets current
and projected security requirements.

Key length is the primary compliance check for cryptographic asset
inventory: NIST SP 800-131A, FIPS 140, PCI DSS, and most regulatory
frameworks specify minimum key lengths per algorithm. A 1024-bit RSA
key fails compliance; a 4096-bit RSA key passes. Without `key-length`,
knowing `algorithm=RSA` is insufficient for compliance assessment.

## Value format

Bit length as an integer.

```sh
org.cispec.key-length=4096
org.cispec.key-length=256
org.cispec.key-length=384
org.cispec.key-length=2048
```

For algorithms where key length is implicit in the algorithm name
(Ed25519, ML-KEM-768), `key-length` MAY be omitted — the algorithm
identifier already specifies the parameter set. For RSA and classical
Diffie-Hellman where key length is a separate, variable parameter,
`key-length` is always meaningful.

## Conformance

`org.cispec.key-length` is RECOMMENDED for any CI that is a
cryptographic key or certificate where key length is a variable
parameter independent of the algorithm name. Not REQUIRED for
Declared conformance.

## Attestation

`key-length` is independently attestable against the certificate or
key's own metadata — X.509 certificates encode the key size in the
SubjectPublicKeyInfo field; GPG keys encode key length in the public
key packet.

## Resolution and relation

`key-length` paired with [`algorithm`](/algorithm/) is the complete
cryptographic strength fact. "Every RSA key shorter than 3072 bits"
is a compliance violation query directly answerable from these two
terms combined.
