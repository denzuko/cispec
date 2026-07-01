---
title: "assurance-level"
term: "assurance-level"
core: false
recommendedFor: ["any CI that is an identity credential, access right, or authentication mechanism"]
related: ["key-type", "owner", "classification", "expiry", "boundary"]
docOid: "1.3.6.1.4.1.42387.2.6.6.1"
docGuid: "b21848ce-8791-5472-a3c0-2bb4074ac050"
date: 2026-06-30
draft: false
---

`org.cispec.assurance-level` records the identity or authentication
assurance level of a Change Item that is a credential, access right,
or authentication mechanism — how much confidence can be placed in the
claimed identity and the authentication process that verified it.

Applies to any CI that is an identity or access instrument: digital
certificates (X.509), government-issued credentials (CAC/PIV,
passport), physical access badges, software tokens (FIDO2, OTP),
privileged access accounts, service accounts, API keys, and any other
credential whose assurance level governs what it can be used to access.

Assurance frameworks vary by domain and jurisdiction. Common
frameworks:

| Framework | Levels |
|---|---|
| NIST SP 800-63 | IAL1/2/3, AAL1/2/3, FAL1/2/3 |
| eIDAS (EU) | Low, Substantial, High |
| UK NCSC | Level 1/2/3/4 |
| US Government PIV | PKI-AUTH, PIV-AUTH, KEY-MGMT |
| NATO STANAG | various classification-aligned levels |

## Value format

Framework prefix and level — colon-separated.

```sh
org.cispec.assurance-level=nist-aal:3
org.cispec.assurance-level=nist-ial:2
org.cispec.assurance-level=eidas:high
org.cispec.assurance-level=piv:piv-auth
```

## Conformance

`org.cispec.assurance-level` is RECOMMENDED for any CI that is an
identity credential or authentication mechanism. Not REQUIRED for
Declared conformance.

## Attestation

`assurance-level` is independently attestable against the issuing
authority's records, certificate policy documents, and accreditation
status. For government credentials (PIV, eIDAS) the assurance level
is verifiable against the issuing authority's published credential
management system.

## Resolution and relation

"Every `nist-aal:3` credential in the estate" is a real operational
query for access control policy enforcement, incident response
(credential revocation scope), and compliance auditing.
