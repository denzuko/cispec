---
title: "orgunit"
term: "orgunit"
core: true
requiredFor: ["any CI"]
related: ["organization", "owner", "costcenter"]
docOid: "1.3.6.1.4.1.42387.2.1.1"
docGuid: "8da4c483-9e88-5831-8c1d-e3b2d584794e"
date: 2026-06-30
draft: false
---

`org.cispec.orgunit` identifies the organisational unit responsible for
a Change Item — a team, department, or business unit within the owning
organisation. Where [`org.cispec.organization`](/organization/) names
the accountable legal entity, `orgunit` narrows that to the part of the
entity actually responsible for day-to-day handling.

`organization` and `orgunit` follow the O/OU split defined in
[X.500/X.520](https://www.itu.int/rec/T-REC-X.520) and carried into
LDAP and X.509 Distinguished Names (RFC 4514). This is a distinct
attestation layer from `organization`, not a redundant restatement of
it — the same reasoning that keeps O and OU as separate fields in a
certificate Subject DN rather than one combined field. `net.matrix`'s
original CMDB design adopted this distinction directly.

`orgunit` is also the natural home for cost-accounting sub-billing: an
organisation MAY structure unit slugs to align with cost centre
boundaries — `hr`, `it`, `r-and-d` as distinct units each billing
against their own [`org.cispec.costcenter`](/costcenter/) — which is
an ITIL cost-accounting practice, not a constraint this specification
imposes. `orgunit` and `costcenter` remain distinct terms because a
single org unit can span multiple cost centres and vice versa; this
specification does not assume a one-to-one mapping.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no leading
or trailing hyphen.

```sh
org.cispec.orgunit=dps
```

The slug is scoped within its parent `organization` — `dps` under
`daplanet` need not be globally unique, only unique within that
organisation's own unit naming.

## Conformance

`org.cispec.orgunit` is REQUIRED for Declared conformance on any
Change Item, regardless of type.

## Attestation

`orgunit` is not independently attestable. It is an internal
organisational structure detail with no external registry to verify
against; this specification does not require it to resolve anywhere.
Verification of organisational structure, where it matters, is an
implementation concern for the owning organisation's own directory or
HR system — out of scope here, per the
[governance/validation/implementation layering](/#governance-validation-and-implementation-are-separate-layers).

## Resolution and relation

Every Change Item sharing the same `orgunit` value forms an edge in
the namespace's knowledge graph — "everything `dps` is responsible
for" is a real, expected query, answered the same way as for
[`owner`](/owner/) and [`organization`](/organization/): by whatever
system of record the organisation runs, not by this specification.
