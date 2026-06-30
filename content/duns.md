---
title: "duns"
term: "duns"
core: true
optionalFor: ["any CI"]
related: ["organization", "oid", "costcenter"]
docOid: "1.3.6.1.4.1.42387.2.2.1"
docGuid: "706730f3-ac1d-573b-94ae-b717305e4a35"
date: 2026-06-30
draft: false
---

`org.cispec.duns` records the D&amp;B DUNS number of the owning
organisation, expressed in OID notation. Unlike
[`org.cispec.organization`](/organization/), which is a self-asserted
slug, `duns` references a number issued and maintained by an external
registry — Dun &amp; Bradstreet — making it the externally verifiable
counterpart to the organisation's own identity claim.

## Value format

`iso.org.duns.<9-digit-number>` — hyphens stripped from the source DUNS
number.

```sh
org.cispec.duns=iso.org.duns.039271257
```

## Conformance

`org.cispec.duns` is OPTIONAL. It is most useful where federal
contracting, SBIR/STTR, or other DUNS-keyed processes apply — DUNS
underpins SAM.gov registration and is a prerequisite for most federal
acquisition vehicles.

## Attestation

`duns` is independently attestable: the value is verifiable against
the D&amp;B commercial registry directly, by any party, without relying
on the asserting organisation's own infrastructure. This is the
clearest example in the core key set of a value whose truth does not
depend on trusting the entity that wrote the label — a property
`organization` and `orgunit` do not share. Validation tooling checking
for Attested conformance on a Change Item SHOULD confirm a present
`duns` value resolves against the D&amp;B registry, not merely that it is
syntactically well-formed.

## Resolution and relation

`duns` is one-to-one with the owning organisation: every Change Item
sharing the same `organization` value SHOULD share the same `duns`
value, where present. A mismatch between two Change Items' `duns`
values under the same `organization` slug is a strong signal of a
labelling error, an organisational rename in progress, or a
not-yet-reconciled merger — worth flagging rather than silently
accepting.
