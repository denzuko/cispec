---
title: "owner"
term: "owner"
core: true
requiredFor: ["any CI"]
related: ["organization", "orgunit", "oid", "customer", "costcenter", "custody-chain", "purdue-level"]
date: 2026-06-30
draft: false
---

`org.cispec.owner` identifies the individual or role accountable for a
Change Item. It is the single key for ownership and responsibility;
role-qualified ownership (a shift supervisor, an approving authority, an
incident commander) is expressed as a structured value on this key, not
as a separate term.

## Value format

An identity-contact value: an email address, a key fingerprint, or a
fingerprint-qualified address, optionally prefixed with a role
qualifier separated by a colon.

```sh
org.cispec.owner=denzuko@dapla.net
org.cispec.owner=FC13F74B@cispec.org
org.cispec.owner=shift-supervisor:j.martinez@example.org
```

A bare identity value (no role qualifier) is read as the general
accountable owner. A role-qualified value narrows that accountability
to a specific function or context, and a single Change Item MAY carry
more than one `org.cispec.owner` label if more than one role applies
(for example, a technical owner and a business owner with distinct
identities).

## Conformance

`org.cispec.owner` is REQUIRED for Declared conformance on any Change
Item, regardless of type.

## Resolution and relation

Every Change Item that lists a given identity as `owner` forms an edge
in the namespace's knowledge graph — "everything `denzuko@dapla.net`
owns" is a real, expected query. This specification does not define how
that query is answered. An organisation's own CMDB, ERP, or directory
service is responsible for traversal; this site only defines what the
`owner` value means once it is read.
