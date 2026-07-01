---
title: "commonname"
term: "commonname"
core: false
recommendedFor: ["any CI with a human-recognizable name distinct from its inventory identifier"]
related: ["asset-tag", "owner", "location", "application"]
docOid: "1.3.6.1.4.1.42387.2.9.1"
docGuid: "4b7c32ea-11f0-5afa-bac9-08ee71694c37"
date: 2026-06-30
draft: false
---

`org.cispec.commonname` records the human-recognizable name of a
Change Item — what people call it, as distinct from its inventory
control number ([`asset-tag`](/asset-tag/)), its service identity
([`application`](/application/)), or the identity of its accountable
owner ([`owner`](/owner/)).

The lineage is X.509 Certificate commonName (CN) and X.500/X.520
commonName attribute — the human-readable identifier used in
Distinguished Names, DNS Subject Alternative Names, and directory
entries. `net.matrix` carried this field from the original LDAP-backed
CMDB design.

`commonname` applies to any Change Item: a server (`PDX-CORE-SW-01`),
a facility (`groom.lake`), a vessel (`USS Enterprise`), a spacecraft
(`Apollo 11`), a programme (`Manhattan Project`), a medical device
(`Ward 3B Infusion Pump 4`), a weapon system, a person's credential
identity, or any other tracked thing that humans refer to by a
consistent name. It is not limited to servers, software, or desktops.

## Value format

A free-form human-readable name. No slug requirement — spaces, mixed
case, and special characters are permitted where the naming convention
of the owning organisation uses them.

```sh
org.cispec.commonname=groom.lake
org.cispec.commonname=PDX-CORE-SW-01
org.cispec.commonname=Ward 3B Infusion Pump 4
org.cispec.commonname=Apollo 11
```

## Conformance

`org.cispec.commonname` is RECOMMENDED for any CI where a
human-recognizable name exists and is distinct from the asset tag or
service identity. It is not REQUIRED for Declared conformance.

## Attestation

`commonname` is not independently attestable. It is a human-assigned
label with no external registry to verify against. In X.509 contexts
the CN is verified by the issuing CA; outside certificate contexts it
is self-asserted by the owning organisation.

## Resolution and relation

`commonname` does not form a globally unique reverse-lookup edge —
the same name may be assigned to different CIs across different
organisations. Within a single organisation, "every CI called
`groom.lake`" is a useful query. Across organisations, `commonname`
values should be interpreted alongside `organization` to disambiguate.
