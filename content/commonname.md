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

`org.cispec.commonname` records what people call a Change Item — the
name that appears on a whiteboard, in an incident report, or in
conversation. This is distinct from the inventory control number
([`asset-tag`](/asset-tag/)), the service identity
([`application`](/application/)), and the accountable party
([`owner`](/owner/)).

A server called `PDX-CORE-SW-01`, a facility called `groom.lake`, a
ward device called `Ward 3B Infusion Pump 4`, a spacecraft called
`Apollo 11` — these are common names. The same asset will have a
barcode (`asset-tag`), an IP address (`ip-address`), and an
accountability record (`owner`); `commonname` is what the people who
work with it every day call it.

Common names apply to any tracked thing: physical assets, facilities,
programmes, vessels, spacecraft, credentials, documents. In DNS and
certificate contexts, this is the same field as the X.509 Subject CN
— the human-readable identifier rather than the cryptographic one.

## Value format

A free-form human-readable name. Spaces, mixed case, and special
characters are permitted.

```sh
org.cispec.commonname=groom.lake
org.cispec.commonname=PDX-CORE-SW-01
org.cispec.commonname=Ward 3B Infusion Pump 4
org.cispec.commonname=Apollo 11
```

## Conformance

`org.cispec.commonname` is RECOMMENDED for any CI where a
human-recognizable name exists and is distinct from the asset tag or
service identity. Not REQUIRED for Declared conformance.

## Attestation

`commonname` is not independently attestable — it is a human-assigned
label with no external registry. In X.509 contexts the CN is verified
by the issuing CA; outside certificate contexts it is self-asserted.

## Resolution and relation

`commonname` values are not globally unique — two organisations may
use the same name for different assets. Interpret `commonname`
alongside `organization` to disambiguate across organisations.
