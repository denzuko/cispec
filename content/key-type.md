---
title: "key-type"
term: "key-type"
core: false
recommendedFor: ["any CI that is a cryptographic key, certificate, or credential"]
related: ["assurance-level", "algorithm", "key-length", "expiry", "owner", "checksum"]
docOid: "1.3.6.1.4.1.42387.2.6.6.2"
docGuid: "936e9ec5-0d4b-5e02-bac2-4e6af6f3ab08"
date: 2026-06-30
draft: false
---

`org.cispec.key-type` records the type of cryptographic key,
certificate, or credential a Change Item is — the category that
determines what it can be used for, what standards govern it, and
what lifecycle management procedures apply.

Applies to any CI that is a cryptographic or identity artefact:
GPG keys, X.509 certificates, SSH keys, FIDO2 credentials, S/MIME
certificates, code-signing certificates, TLS certificates, hardware
security module (HSM) key slots, and any other cryptographic
material tracked as a CI.

## Value format

A lower-case slug identifying the key or credential type.

```sh
org.cispec.key-type=x509-tls
org.cispec.key-type=x509-code-signing
org.cispec.key-type=x509-ca
org.cispec.key-type=gpg
org.cispec.key-type=ssh-ed25519
org.cispec.key-type=fido2
org.cispec.key-type=hsm-slot
org.cispec.key-type=s-mime
```

## Conformance

`org.cispec.key-type` is RECOMMENDED for any CI that is a
cryptographic key, certificate, or credential. Not REQUIRED for
Declared conformance.

## Attestation

`key-type` is independently attestable against the certificate or
key's own metadata — an X.509 certificate's extended key usage
(EKU) fields authoritatively specify what the certificate may be
used for; a GPG key's capability flags specify signing, encryption,
authentication, and certification capabilities.

## Resolution and relation

`key-type` paired with [`algorithm`](/algorithm/) and
[`key-length`](/key-length/) gives the complete cryptographic
profile of a credential CI. Paired with [`expiry`](/expiry/) and
[`owner`](/owner/) it supports certificate lifecycle management
and rotation planning.
