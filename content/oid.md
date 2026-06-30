---
title: "oid"
term: "oid"
core: true
recommendedFor: ["any CI"]
oidArc: "iso.org.dod.internet.42387"
related: ["organization", "duns", "specversion"]
docOid: "1.3.6.1.4.1.42387.2"
docGuid: "406fe072-ee1d-57ca-9047-522a456f3a2f"
date: 2026-06-30
draft: false
---

`org.cispec.oid` records the IANA OID arc an asset's identity is rooted
at. The root arc for Da Planet Security is held under IANA Private
Enterprise Number **42387**.

## Value format

A dot-notation OID string rooted at `iso.org.dod.internet.42387`
(dotted-decimal equivalent: `1.3.6.1.4.1.42387`).

```sh
org.cispec.oid=iso.org.dod.internet.42387
```

## Sub-arc assignment — namespace root

| Arc | Dotted decimal | Description |
|---|---|---|
| `iso.org.dod.internet.42387` | `1.3.6.1.4.1.42387` | Da Planet Security root |

This term's own value space is the *organisation-rooted* arc — what an
asset cites as its identity root. It is separate from the
*document-identifier* sub-arc scheme described on the
[root page](/#document-identifiers), which numbers the term pages
themselves rather than asset identity. The two trees share the same
root (`42387`) but diverge below it: the document-identifier tree
groups by cross-cutting fact category (`.1` identity, `.2` registry,
and so on), while an asset's own `org.cispec.oid` value is whatever
sub-arc that specific asset has been assigned, independent of which
term pages exist.

## Document-identifier index

Every term page on this site carries its own document OID and UUIDv5
(see [Document identifiers](/#document-identifiers) on the root page).
This table is the canonical, single-page index of all currently
assigned document identifiers:

| Term | Document OID | UUIDv5 |
|---|---|---|
| [organization](/organization/) | `1.3.6.1.4.1.42387.1` | `7535ebf6-a75f-5435-90d6-0a6ac2251c1c` |
| [orgunit](/orgunit/) | `1.3.6.1.4.1.42387.1.1` | `16c23eea-86dd-5065-bf86-d3ab8d82d262` |
| [owner](/owner/) | `1.3.6.1.4.1.42387.1.2` | `831f6dea-8726-55af-a732-ae977a90b55f` |
| [oid](/oid/) (this page) | `1.3.6.1.4.1.42387.2` | `406fe072-ee1d-57ca-9047-522a456f3a2f` |
| [duns](/duns/) | `1.3.6.1.4.1.42387.2.1` | `8ef717a5-d8c0-512d-8cc5-9d62cea811ca` |
| [customer](/customer/) | `1.3.6.1.4.1.42387.3` | `e27b14fc-2047-5b13-ae4e-1d33e7613872` |
| [costcenter](/costcenter/) | `1.3.6.1.4.1.42387.3.1` | `29e0e3c3-012a-5170-ad0b-877243508b36` |
| [version](/version/) | `1.3.6.1.4.1.42387.4` | `f23f2c63-1792-5f99-b728-a9d11e8292db` |
| [specversion](/specversion/) | `1.3.6.1.4.1.42387.4.1` | `00e1bab1-1b3f-5386-a324-7aa0473def91` |
| [environment](/environment/) | `1.3.6.1.4.1.42387.4.2` | `f498286a-4c99-5c1a-a278-bb83f930a2a0` |
| [custody-chain](/custody-chain/) | `1.3.6.1.4.1.42387.5` | `99ac3fc9-035d-58b9-99e2-41969039a970` |
| [hash-at-collection](/hash-at-collection/) | `1.3.6.1.4.1.42387.5.1` | `4d5c75e6-697d-5f7e-9c93-4781a7792483` |
| [application](/application/) | `1.3.6.1.4.1.42387.6.1.1` | `b7289218-6197-5e56-b5f4-4273ceab6f8d` |
| [role](/role/) | `1.3.6.1.4.1.42387.6.1.2` | `a62cdbbf-15c2-53bb-8c8b-3a2227ca13c6` |
| [purdue-level](/purdue-level/) | `1.3.6.1.4.1.42387.6.3.1` | `678fc553-e182-53b6-acf5-4048bb4075f5` |

Reserved arcs with no term minted yet: `.6.2` (hardware), `.6.4`
(network), `.6.5` (evidence), `.6.6` (access), `.6.7` (facility),
`.6.8` (contract), `.6.9` (crypto). New terms in these categories take
the next unused position within their reserved arc.

## Conformance

`org.cispec.oid` is RECOMMENDED for any Change Item where OID-rooted
identity matters for cross-system citation.

## Attestation

`oid` is independently attestable in the same sense as
[`duns`](/duns/): the root arc `42387` is verifiable against the IANA
Private Enterprise Number registry directly, by any party, without
relying on the asserting organisation's own infrastructure. A specific
sub-arc value beneath the root (an individual asset's assigned
sub-arc) is only as trustworthy as the organisation's own sub-arc
allocation records — IANA attests the root, not what an organisation
does beneath it.

## Resolution and relation

Every Change Item sharing the same `oid` root forms an edge in the
namespace's knowledge graph — "everything rooted at `42387`" resolves
to every asset Da Planet Security has assigned an OID-based identity
to, tracked by whatever internal registry the organisation maintains
for sub-arc allocation.

## References

- [IANA Private Enterprise Number registry](https://www.iana.org/assignments/enterprise-numbers/)
- [RFC 1065](https://www.rfc-editor.org/rfc/rfc1065) — Structure and
  Identification of Management Information for TCP/IP-based Internets
- [RFC 4122](https://www.rfc-editor.org/rfc/rfc4122) — A Universally
  Unique IDentifier (UUID) URN Namespace, §4.3 (name-based UUIDv5)
