---
title: "oid"
term: "oid"
core: true
recommendedFor: ["any CI"]
oidArc: "iso.org.dod.internet.42387"
related: ["organization", "duns", "specversion"]
date: 2026-06-30
draft: false
---

`org.cispec.oid` records the IANA OID arc an asset's identity is rooted
at. The root arc for Da Planet Security is held under IANA Private
Enterprise Number **42387**.

## Value format

A dot-notation OID string rooted at `iso.org.dod.internet.42387`
(dotted-decimal equivalent: `1.3.6.1.4.1.42387`).

```
org.cispec.oid=iso.org.dod.internet.42387
```

## Sub-arc assignment

| Arc | Dotted decimal | Description |
|---|---|---|
| `iso.org.dod.internet.42387` | `1.3.6.1.4.1.42387` | Da Planet Security root |
| `iso.org.dod.internet.42387.1` | `1.3.6.1.4.1.42387.1` | org.cispec namespace |

New sub-arcs are allocated as needed; this table is the canonical
record and is updated as sub-arcs are assigned.

## Conformance

`org.cispec.oid` is RECOMMENDED for any Change Item where OID-rooted
identity matters for cross-system citation.

## References

- [IANA Private Enterprise Number registry](https://www.iana.org/assignments/enterprise-numbers/)
- [RFC 1065](https://www.rfc-editor.org/rfc/rfc1065) — Structure and
  Identification of Management Information for TCP/IP-based Internets
