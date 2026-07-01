---
title: "cispec"
description: "org.cispec — a domain-scoped identifier namespace for attesting Change Items across IT, OT, and service delivery."
date: 2026-06-30
draft: false
---

# org.cispec

`org.cispec` is a domain-scoped identifier namespace for attesting and
identifying Change Items. A Change Item (CI) is any tracked unit of change
in a configuration management database — software, hardware, industrial
control systems, cryptographic assets, evidence and case files, access and
identity changes, contracts, facilities, or any other thing an organisation
tracks because its state and relationships affect service delivery, cost,
risk, or compliance.

"CI" denotes Change Item. It does not refer to continuous integration.

This document is the specification. It is also the index: every term in
the namespace resolves at its own address under this domain and is
linked from here and from every other term that relates to it.

## What this is

`org.cispec` works the way any reverse-DNS namespace works — Java
packages, Android application IDs, D-Bus service names, IANA OID arcs.
The prefix is a domain-scoped claim to uniqueness and authority, nothing
more. A term under `org.cispec.*` does not get imported into a
context the way a library is imported; it gets cited, the way a UPC
barcode or a MIME type is cited. Any system, language, or tool can carry
an `org.cispec.*` string as a label without requiring permission,
a build dependency, or a runtime relationship with this site.

The full set of terms — core and extended — forms a knowledge graph.
Terms relate to other terms. Most terms are expected to support some
form of relation or reverse lookup (for example: every Change Item that
lists a given identity as its `owner`). This specification does not
mandate a discovery or traversal mechanism for that graph. Resolving
"what does this term mean" is what this site does. Resolving "what is
this term's value for a specific asset, right now" — and traversing
relations between values — is implementation-defined: an organisation's
CMDB, ERP, LDAP tree, or any other system of record it chooses to run.
`dps-meta` is one sample implementation among many possible ones and is
not a reference architecture this specification describes or endorses.

## Predecessor namespace

`org.cispec` supersedes `net.matrix.*`, retired following the Dynatrace
acquisition of matrix.net. The label keys, value semantics, and design
intent carry forward unchanged from `net.matrix.*`'s original 2014
development; only the namespace prefix and the resolution mechanism
(public HTTP/TLS, in place of the original DNS RR / Hesiod lookup
pattern) have changed. Projects migrating from `net.matrix.*` should
treat this as a MAJOR semver event for any consumer of the label
namespace; the substitution is a direct prefix replacement with no
change to key names or value formats.

| Retired (`net.matrix.*`) | Current (`org.cispec.*`) |
|---|---|
| `net.matrix.organization` | [`org.cispec.organization`](/organization/) |
| `net.matrix.orgunit` | [`org.cispec.orgunit`](/orgunit/) |
| `net.matrix.owner` | [`org.cispec.owner`](/owner/) |
| `net.matrix.oid` | [`org.cispec.oid`](/oid/) |
| `net.matrix.duns` | [`org.cispec.duns`](/duns/) |
| `net.matrix.customer` | [`org.cispec.customer`](/customer/) |
| `net.matrix.costcenter` | [`org.cispec.costcenter`](/costcenter/) |
| `net.matrix.application` | [`org.cispec.application`](/application/) |
| `net.matrix.role` | [`org.cispec.role`](/role/) |
| `net.matrix.version` | [`org.cispec.version`](/version/) |
| `net.matrix.environment` | [`org.cispec.environment`](/environment/) |

## Requirement language

The key words MUST, MUST NOT, REQUIRED, SHOULD, SHOULD NOT, RECOMMENDED,
MAY, and OPTIONAL are used as defined in
[RFC 2119](https://www.rfc-editor.org/rfc/rfc2119). Each term page
states, inline, which of these levels apply to it and in what context
— there is no separate conformance document. A label set is conformant
for a given context when every term marked REQUIRED for that context is
present and well-formed.

## Minting new terms

`org.cispec` is an open namespace. A term does not need to appear on
this site, or be registered with any authority, to be minted and used.
Anyone may mint `org.cispec.<term>` for their own attestable thing. Two
rules govern whether a minted term is legitimate:

**A term MUST resolve.** `org.cispec.<term>` MUST be reachable via
GET or HEAD over public, TLS-verified, non-split-horizon DNS at a
stable address (this site, or any domain the minting party controls and
is willing to stand behind as authoritative for that term) before it is
used in any artefact intended for external verification — a SLSA
attestation, a customer-facing SBOM, evidence intended for an auditor
or court. A term that only resolves inside a private or split-horizon
DNS view is not a legitimate member of the public namespace; it is
private-use labelling that happens to share a prefix, and validation
tooling checking for Verified or Attested conformance MUST resolve the
term from a neutral, public resolver at validation time, not trust
whatever resolution context the artefact's producer used at minting
time.

**A term MUST be necessary.** Before minting `org.cispec.<term>`,
the minting party MUST confirm both of the following:

1. The term identifies, attests, or relates to a tracked Change Item
   affecting IT/OT service delivery, asset management, cost accounting,
   or chain of custody. Terms describing facts with no bearing on a
   tracked, managed change — cosmetic attributes, opinions, anything
   that would never appear in a configuration management database —
   MUST NOT be minted under this namespace.
2. No existing core or extended term, used with an appropriately
   structured or qualified value, already expresses the same fact. A
   role-qualified identity (`org.cispec.owner` with a value like
   `shift-supervisor:j.martinez@example.org`) is reuse of an existing
   term, not grounds for a new one.

These two rules are deliberately not enforced by any central registry.
Resolution can be checked mechanically by any validator. Necessity is a
judgement call the minting party makes honestly, the same way an
engineer applying RFC 2119 keywords correctly is a matter of judgement
applied in good faith, not a gate any tool can fully automate.

## Governance, validation, and implementation are separate layers

This site (`cispec.org`) is **governance**. It defines what terms mean
and what conformance requires. It hosts no code, no policy-gate source,
and no tooling.

[`cimatrix.org`](https://cimatrix.org) is **validation**. It checks
that a given artefact's `org.cispec.*` labels are syntactically and
semantically conformant to this specification — required terms present,
values well-formed, resolution verified. It does not perform reverse
lookups against any organisation's CMDB, ERP, or system of record, and
it asserts nothing about whether a given relation is *true* in the real
world — only whether the labels as written are well-formed.

Everything else — how an organisation's own CMDB, ERP, or directory
answers "what does this label's value actually point to, right now" —
is **implementation**. It is out of scope for this specification, out
of scope for cimatrix, and not something either project correlates
against or depends on.

## Document identifiers

Each term page on this site carries its own sub-arc OID under
`iso.org.dod.internet.42387.2` and a UUIDv5 deterministically derived
from that OID's dotted-decimal form (namespace `6ba7b810-9dad-11d1-
80b4-00c04fd430c8`, the standard DNS namespace per
[RFC 4122 §4.3](https://www.rfc-editor.org/rfc/rfc4122#section-4.3)).
These identify the *document defining a term*, not the term's own
label value — `org.cispec.owner`'s page has a document OID and GUID;
the string `org.cispec.owner` itself, as a label applied to a Change
Item, does not.

The document-identifier tree is rooted at `42387.2`, not `42387`
directly. The `42387.1` arc is Da Planet Security's own internal
infrastructure (LDAP, documentation, SNMP, ASN.1) and is out of scope
for this specification; this site neither documents nor allocates
against it. `org.cispec`'s own document tree occupies `42387.2` so the
two never collide.

Sub-arcs below `42387.2` are organised by cross-cutting fact category,
not by CI type, because the term-page graph itself is flat and
relations between terms are already expressed as ordinary links —
encoding the same category information twice, once in the OID tree
and once in the link graph, would let the two drift out of agreement.
The OID tree instead serves formal, hierarchical consumers (ASN.1,
SNMP-adjacent, X.509-adjacent tooling) that require a real tree to
generate codecs and constraints; it carries no meaning beyond
providing each document a stable, sequential, hierarchically-organised
citation handle.

| Arc | Category |
|---|---|
| `42387.2.1` | identity — who or what is accountable |
| `42387.2.2` | registry — external authoritative numbers |
| `42387.2.3` | financial — cost and billing facts |
| `42387.2.4` | lifecycle — state and time facts |
| `42387.2.5` | custody — provenance and evidence facts |
| `42387.2.6` | CI-type extension keys, sub-numbered per type |
| `42387.2.7` | physical — location and physical presence facts |
| `42387.2.8` | governance/compliance — classification, retention, boundary |
| `42387.2.9` | service management — SLA, common name |

A new category arc is allocated only when a term genuinely does not fit
any existing category — the same necessity discipline that governs
minting a new term at all.

### Index

The canonical, single-page index of every currently assigned document
identifier:

| Term | Document OID | UUIDv5 |
|---|---|---|
| [organization](/organization/) | `1.3.6.1.4.1.42387.2.1` | `8ef717a5-d8c0-512d-8cc5-9d62cea811ca` |
| [orgunit](/orgunit/) | `1.3.6.1.4.1.42387.2.1.1` | `8da4c483-9e88-5831-8c1d-e3b2d584794e` |
| [owner](/owner/) | `1.3.6.1.4.1.42387.2.1.2` | `54cfcb4f-03f8-548e-80e7-75aea99c3580` |
| [oid](/oid/) | `1.3.6.1.4.1.42387.2.2` | `c79d496e-04f0-559c-9e88-63109933cddb` |
| [duns](/duns/) | `1.3.6.1.4.1.42387.2.2.1` | `706730f3-ac1d-573b-94ae-b717305e4a35` |
| [customer](/customer/) | `1.3.6.1.4.1.42387.2.3` | `748000b4-ea01-58ab-9613-a73aa5658fda` |
| [costcenter](/costcenter/) | `1.3.6.1.4.1.42387.2.3.1` | `c7fe2951-e8c2-5ce0-adb9-3e941db9ac8b` |
| [version](/version/) | `1.3.6.1.4.1.42387.2.4` | `abc91671-732c-5697-b1bb-98113d9313e2` |
| [specversion](/specversion/) | `1.3.6.1.4.1.42387.2.4.1` | `41319691-4383-59de-944f-28dc072ea408` |
| [environment](/environment/) | `1.3.6.1.4.1.42387.2.4.2` | `fb2fecdf-cbaf-5f0c-bd16-cffe882b9eb0` |
| [custody-chain](/custody-chain/) | `1.3.6.1.4.1.42387.2.5` | `af7616e3-6c41-59af-947e-cd4af86b6d69` |
| [checksum](/checksum/) | `1.3.6.1.4.1.42387.2.5.1` | `85cbd708-dcd0-5e36-8070-95f46ce00006` |
| [application](/application/) | `1.3.6.1.4.1.42387.2.6.1.1` | `3d021461-8d8b-5428-959a-eef4e7a3cd4d` |
| [role](/role/) | `1.3.6.1.4.1.42387.2.6.1.2` | `5bedd70b-5466-578d-a7b9-0e25d5017287` |

`purdue-level` was minted, then retired and folded into
[`environment`](/environment/) as a qualified value
(`environment=purdue-level:<n>`) — it failed the redundancy test
against an existing core key. Its document OID
(`1.3.6.1.4.1.42387.2.6.3.1`) is retired, not reassigned.

| [location](/location/) | `1.3.6.1.4.1.42387.2.7` | `1192ce5e-1a38-5939-b4c8-be1263cb37fc` |
| [classification](/classification/) | `1.3.6.1.4.1.42387.2.8` | `ff8c27e8-562e-5b8d-a887-ebb1daeeb039` |
| [retention](/retention/) | `1.3.6.1.4.1.42387.2.8.1` | `b87b96e5-f583-5c4e-8cfc-49b0bb9739a7` |
| [boundary](/boundary/) | `1.3.6.1.4.1.42387.2.8.2` | `1eaea5b2-5b84-5829-ae8b-850ec19d0ff0` |
| [sla](/sla/) | `1.3.6.1.4.1.42387.2.9` | `78ee1d87-4cab-5636-a51d-60b9c45ee3f5` |
| [commonname](/commonname/) | `1.3.6.1.4.1.42387.2.9.1` | `4b7c32ea-11f0-5afa-bac9-08ee71694c37` |
| [asset-tag](/asset-tag/) | `1.3.6.1.4.1.42387.2.6.2.1` | `f5bc9f9b-9561-5f8d-811c-33e5ce0ade50` |
| [manufacturer](/manufacturer/) | `1.3.6.1.4.1.42387.2.6.2.2` | `d957a085-ddfe-55e3-a34f-6e886194e470` |
| [make](/make/) | `1.3.6.1.4.1.42387.2.6.2.3` | `8a7106c6-dcca-5f76-b59d-7bd2f391bb75` |
| [model](/model/) | `1.3.6.1.4.1.42387.2.6.2.4` | `6ddca6e5-bb57-505c-b995-70a5b05ff783` |

| [cost](/cost/) | `1.3.6.1.4.1.42387.2.3.2` | `9d633303-4b6e-5c01-bbc0-2554769f3aa5` |
| [unit-cost](/unit-cost/) | `1.3.6.1.4.1.42387.2.3.3` | `13b2c028-55ec-59a4-b274-c01ddddc33cf` |
| [billing-model](/billing-model/) | `1.3.6.1.4.1.42387.2.3.4` | `dbee024f-8cc0-52d6-b300-d1aac6b07372` |
| [depreciation](/depreciation/) | `1.3.6.1.4.1.42387.2.3.5` | `0e456549-e677-5ad3-8c7f-49210439cb48` |
| [contract-ref](/contract-ref/) | `1.3.6.1.4.1.42387.2.3.6` | `bc197921-a7a6-5d33-90f2-763de7e0eaa3` |
| [usage](/usage/) | `1.3.6.1.4.1.42387.2.3.7` | `c8c1a366-27f8-56fc-991c-0a4f2c9b383d` |
| [vendor](/vendor/) | `1.3.6.1.4.1.42387.2.3.8` | `b57413eb-ea61-5ce2-a9a9-274832e2eea0` |
| [expiry](/expiry/) | `1.3.6.1.4.1.42387.2.4.3` | `9714b5bf-3536-5fc9-a53a-b8f0cf1a65db` |
| [acquired](/acquired/) | `1.3.6.1.4.1.42387.2.4.4` | `b07863b7-ed3e-5f79-9160-67efc0ebfe86` |

Reserved arcs: `.2.6.3` (retired — formerly purdue-level), `.2.6.4`
(network), `.2.6.5` (evidence extended), `.2.6.6` (access), `.2.6.7`
(facility extended), `.2.6.8` (contract), `.2.6.9` (crypto). Physical
category terms extend `.2.7.*`; governance/compliance extend `.2.8.*`;
service management extend `.2.9.*`.

## Versioning

This specification follows semver 2.0.

- **MAJOR** — a term is renamed, removed, or its semantics change in a
  way that breaks existing conformant labels.
- **MINOR** — a new term is added, or a new requirement-level
  annotation is introduced.
- **PATCH** — editorial corrections and clarifications only.

The current specification version is **{{< param "specVersion" >}}**.
A label set SHOULD record the specification version it was authored
against using [`org.cispec.specversion`](/specversion/).

## Specification status

The coloured strip on the left edge of every page signals this
specification's current position in the adoption lifecycle. Status
and version are independent — a version number tracks content changes
to the spec; status tracks where the spec sits in real-world adoption.
A spec at `3.2.1` can still be Draft; a spec at `0.9.4` can be Adopted.

| Status | Colour | Meaning |
|---|---|---|
| **Draft** | amber | Terms are not guaranteed stable between releases. Do not cite in compliance documentation or customer deliverables. |
| **Stable** | neon green | At least one reference implementation exists (cimatrix). Terms are frozen for this version. Safe to build against and cite. |
| **Adopted** | pale green | Two or more independent implementations confirmed in production outside the spec author's own tooling. Real-world deployment pressure has been survived. |

Gate conditions for advancement — based on implementation evidence,
not version numbers, following the same principle as
[RFC 6410](https://www.rfc-editor.org/rfc/rfc6410):

- **Draft → Stable:** spec published with at least one reference
  implementation. cimatrix is that implementation for `org.cispec`.
- **Stable → Adopted:** two independent implementations confirmed in
  production use outside Da Planet Security's own tooling.

Current status: **Draft** (v{{< param "specVersion" >}}).

## Licence

BSD-2-Clause. SPDX-License-Identifier: `BSD-2-Clause`.
IANA PEN: 42387. D&amp;B DUNS: 039-271-257.
