---
title: "specversion"
term: "specversion"
core: true
recommendedFor: ["any CI"]
related: ["version", "oid"]
docOid: "1.3.6.1.4.1.42387.2.4.1"
docGuid: "41319691-4383-59de-944f-28dc072ea408"
date: 2026-06-30
draft: false
---

`org.cispec.specversion` records the version of this specification a
label set was authored and validated against.

## Value format

A semantic version 2.0 string matching a published specification
version.

```sh
org.cispec.specversion=1.0
```

## Conformance

`org.cispec.specversion` is RECOMMENDED on every Change Item. It allows
a validator encountering an older label set to apply the correct
historical conformance rules rather than the current ones.

## Attestation

`specversion` is not independently attestable. It is a self-asserted
claim about which version of this specification a label set targets;
this specification provides no mechanism to verify the claim beyond
checking that the value corresponds to a real, published spec version.
A validator MAY treat an unrecognised `specversion` value as a
conformance warning.

## Resolution and relation

`specversion` does not form a meaningful reverse-lookup edge the way
[`owner`](/owner/) or [`organization`](/organization/) do — querying
"every Change Item authored against spec v1.0" is possible but
typically only useful during a MAJOR version migration, to find label
sets that still need updating.
