---
title: "organization"
term: "organization"
core: true
requiredFor: ["any CI"]
related: ["orgunit", "owner", "oid", "duns"]
docOid: "1.3.6.1.4.1.42387.2.1"
docGuid: "8ef717a5-d8c0-512d-8cc5-9d62cea811ca"
date: 2026-06-30
draft: false
---

`org.cispec.organization` identifies the owning organisation of a
Change Item — the entity ultimately accountable for it within whatever
governance structure applies. This is distinct from
[`org.cispec.owner`](/owner/), which identifies a specific individual
or role; `organization` identifies the entity that individual or role
sits inside.

`organization` and [`orgunit`](/orgunit/) follow the same O/OU split
defined in [X.500/X.520](https://www.itu.int/rec/T-REC-X.520) and
carried into LDAP and X.509 Distinguished Names (RFC 4514:
`organizationName` and `organizationalUnitName` as separate, sibling
attributes). `net.matrix`'s original CMDB design adopted this
distinction directly — the two terms are not redundant with each
other despite both being organisational-identity facts, the same way
O and OU are deliberately kept separate in a certificate's Subject DN
rather than collapsed into one field.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no leading
or trailing hyphen.

```sh
org.cispec.organization=daplanet
```

The slug SHOULD be stable for the lifetime of the organisation it
identifies. A rename, merger, or acquisition that changes the
organisation's legal identity is a MAJOR event for any conformant label
set referencing the old slug, the same way a namespace rescope is a
MAJOR semver event for this specification itself.

## Conformance

`org.cispec.organization` is REQUIRED for Declared conformance on any
Change Item, regardless of type.

## Attestation

`organization` is not independently attestable by this specification.
The slug is a self-asserted identifier; this specification does not
require it to resolve to a registry, a DNS zone, or a CA-issued
credential. Where independent verification of organisational identity
matters — federal contracting, regulated audit — pair `organization`
with [`org.cispec.duns`](/duns/), which is externally verifiable
against the D&amp;B registry, or [`org.cispec.oid`](/oid/), which is
externally verifiable against the IANA Private Enterprise Number
registry. `organization` itself carries no attestation mechanism.

## Resolution and relation

Every Change Item sharing the same `organization` value forms an edge
in the namespace's knowledge graph — "everything `daplanet` owns" is a
real, expected query, the same as for `owner`. This specification does
not define how that query is answered; see the
[governance/validation/implementation layering](/#governance-validation-and-implementation-are-separate-layers)
section on the root page.
