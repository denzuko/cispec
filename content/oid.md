---
title: "oid"
term: "oid"
core: true
recommendedFor: ["any CI where a client/owner OID is known"]
related: ["owner", "duns", "customer"]
docOid: "1.3.6.1.4.1.42387.2.2"
docGuid: "c79d496e-04f0-559c-9e88-63109933cddb"
date: 2026-06-30
draft: false
---

`org.cispec.oid` is a relational pointer to the **client's own** OID
arc — the customer or owning party's IANA Private Enterprise Number
or equivalent registered arc, not the labelling organisation's own
identity. Its purpose is practical: a Change Item carrying this label
lets anyone with the label set walk directly to that client's MIB or
SNMP tree, without needing a separate lookup step to find which arc
belongs to them.

This term does not identify the Change Item itself or the
organisation applying the label — see [`organization`](/organization/)
and [`owner`](/owner/) for that. `oid` identifies whose external
registry tree this Change Item relates to, when that relationship is
known and relevant.

## Value format

A dot-notation OID string rooted at the client's own registered arc.

```sh
org.cispec.oid=iso.org.dod.internet.<client-pen>
```

There is no canonical example value here, deliberately — every
conformant use of this term points at a *different* PEN, namely
whichever client the Change Item relates to. A label set with no known
client OID simply omits this term; it is not REQUIRED.

## Conformance

`org.cispec.oid` is RECOMMENDED only where a client or owning party's
OID arc is actually known and the relationship is meaningful to
record. It is not REQUIRED for Declared conformance, and most Change
Items will not carry it at all.

## Attestation

`oid` is independently attestable in the same sense as
[`duns`](/duns/): a PEN is verifiable against the IANA Private
Enterprise Number registry directly, by any party, without relying on
the asserting organisation's own infrastructure. Whether the *specific
sub-arc* cited within that PEN is accurate (the right device, the
right system) depends on the client's own SNMP/MIB tree being
correctly walked — IANA attests that the PEN belongs to the named
client, not that any particular sub-arc value is currently correct.

## Resolution and relation

`oid` does not form a meaningful reverse-lookup edge within this
namespace's own knowledge graph the way `owner` or `organization` do —
it points *outward*, at a different organisation's registry entirely,
not at other Change Items sharing this label.

## A retired predecessor pattern

An earlier, internal-only convention at Da Planet Security allocated
client sub-arcs directly under DPS's own PEN
(`iso.org.dod.internet.42387.{customer}.{costcenter}`) rather than
pointing at each client's independently-registered arc. That pattern
predates this specification, does not carry forward into `org.cispec`,
and survives only in legacy internal DPS documentation. Conformant use
of `org.cispec.oid` always points at the client's own registered arc,
never at a DPS-allocated sub-arc standing in for one.

## References

- [IANA Private Enterprise Number registry](https://www.iana.org/assignments/enterprise-numbers/)
- [RFC 1065](https://www.rfc-editor.org/rfc/rfc1065) — Structure and
  Identification of Management Information for TCP/IP-based Internets
