---
title: "algorithm"
term: "algorithm"
core: false
recommendedFor: ["any CI that is a cryptographic asset — key, certificate, HSM slot, or crypto-dependent system"]
related: ["key-type", "key-length", "checksum", "assurance-level", "expiry"]
docOid: "1.3.6.1.4.1.42387.2.6.9.1"
docGuid: "d7fc8fc7-41b8-5365-b370-983eb3ca6cd4"
date: 2026-06-30
draft: false
---

`org.cispec.algorithm` records the cryptographic algorithm in use
for a Change Item that is a cryptographic asset or algorithm-dependent
system. This is the fact that determines quantum resilience, regulatory
approval status, and algorithm deprecation timelines.

Distinct from [`org.cispec.checksum`](/checksum/), which uses an
algorithm identifier as part of a digest value format
(`sha256:hexdigest`). `algorithm` is a first-class property of a CI
whose *identity* is bound to a specific algorithm — a key whose
security depends on RSA-2048, a system that implements AES-256-GCM,
or a certificate signed with ECDSA-P384.

Applies to any CI with a cryptographic algorithm dependency: keys,
certificates, HSM slots, VPN tunnels, encrypted volumes, secure
messaging systems, code-signing infrastructure, and post-quantum
cryptography migration candidates.

## Value format

A standard algorithm identifier in common notation. IANA algorithm
names, NIST designations, and RFC-standard identifiers are preferred.

```sh
org.cispec.algorithm=RSA-4096
org.cispec.algorithm=ECDSA-P384
org.cispec.algorithm=AES-256-GCM
org.cispec.algorithm=Ed25519
org.cispec.algorithm=ML-KEM-768
org.cispec.algorithm=SHA-256
org.cispec.algorithm=ChaCha20-Poly1305
```

## Conformance

`org.cispec.algorithm` is RECOMMENDED for any CI that is a
cryptographic asset or has a cryptographic algorithm dependency
that affects its security posture or regulatory compliance. Not
REQUIRED for Declared conformance.

## Attestation

`algorithm` is independently attestable against the certificate or
key's own metadata, HSM audit logs, and system configuration records.
NIST's algorithm validation programme (CAVP) provides authoritative
records of validated algorithm implementations.

## Resolution and relation

"Every CI using `RSA-2048`" is a real, critical operational query
for post-quantum migration planning — identifying all CIs that need
algorithm upgrades before PQC deadlines. Paired with
[`key-length`](/key-length/) and [`expiry`](/expiry/) it gives
the complete cryptographic hygiene picture.
