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
`iso.org.dod.internet.42387` and a UUIDv5 deterministically derived from
that OID's dotted-decimal form (namespace `6ba7b810-9dad-11d1-80b4-
00c04fd430c8`, the standard DNS namespace per
[RFC 4122 §4.3](https://www.rfc-editor.org/rfc/rfc4122#section-4.3)).
These identify the *document defining a term*, not the term's
own label value — `org.cispec.owner`'s page has a document OID and
GUID; the string `org.cispec.owner` itself, as a label applied to a
Change Item, does not.

Sub-arcs are organised by cross-cutting fact category, not by CI type,
because the term-page graph itself is flat and relations between terms
are already expressed as ordinary links — encoding the same category
information twice, once in the OID tree and once in the link graph,
would let the two drift out of agreement. The OID tree instead serves
formal, hierarchical consumers (ASN.1, SNMP-adjacent, X.509-adjacent
tooling) that require a real tree to generate codecs and constraints;
it carries no meaning beyond providing each document a stable,
sequential, hierarchically-organised citation handle.

| Arc | Category |
|---|---|
| `.1` | identity — who or what is accountable |
| `.2` | registry — external authoritative numbers |
| `.3` | financial — cost and billing facts |
| `.4` | lifecycle — state and time facts |
| `.5` | custody — provenance and evidence facts |
| `.6` | CI-type extension keys, sub-numbered per type |

A new category arc is allocated only when a term genuinely does not fit
any existing category — the same necessity discipline that governs
minting a new term at all.

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

## Licence

BSD-2-Clause. SPDX-License-Identifier: `BSD-2-Clause`.
IANA PEN: 42387. D&amp;B DUNS: 039-271-257.
