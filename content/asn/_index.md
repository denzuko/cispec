---
title: "ASN Arc — IANA PEN 42387"
description: "OID subtree documentation for Da Planet Security under IANA Private Enterprise Number 42387."
date: 2026-06-29
draft: false
---

# ASN Arc — IANA PEN 42387

Da Planet Security holds IANA Private Enterprise Number **42387** under the
`iso.org.dod.internet.private.enterprises` arc.

Canonical dotted-decimal OID: `1.3.6.1.4.1.42387`  
Human-readable form: `iso.org.dod.internet.private.enterprises.42387`  
Short form used in org.cispec labels: `iso.org.dod.internet.42387`

---

## Arc assignment

| Arc | Dotted decimal | Description |
|---|---|---|
| `iso.org.dod.internet.42387` | `1.3.6.1.4.1.42387` | Da Planet Security root |
| `iso.org.dod.internet.42387.1` | `1.3.6.1.4.1.42387.1` | cispec namespace |
| `iso.org.dod.internet.42387.1.1` | `1.3.6.1.4.1.42387.1.1` | Label schema |
| `iso.org.dod.internet.42387.1.2` | `1.3.6.1.4.1.42387.1.2` | Gate policy library |
| `iso.org.dod.internet.42387.1.3` | `1.3.6.1.4.1.42387.1.3` | Conformance levels |
| `iso.org.dod.internet.42387.2` | `1.3.6.1.4.1.42387.2` | Reserved — DPS internal |

Sub-arc assignments under `.42387.1.*` track the cispec spec major version.
New sub-arcs are allocated at each MAJOR version increment.

---

## Using the OID in labels

Set `org.cispec.oid` to the root arc unless a more specific sub-arc applies:

```
org.cispec.oid=iso.org.dod.internet.42387
```

For artefacts that are part of the cispec label schema itself:

```
org.cispec.oid=iso.org.dod.internet.42387.1.1
```

---

## DUNS notation

D&B DUNS `039-271-257` is represented in OID notation as:

```
iso.org.duns.039271257
```

Hyphens are stripped; the nine-digit number follows directly after the
`iso.org.duns.` prefix. Use this form in the `org.cispec.duns` label.

---

## References

- [IANA PEN registry](https://www.iana.org/assignments/enterprise-numbers/)
- [RFC 1065](https://www.rfc-editor.org/rfc/rfc1065) — Structure and
  Identification of Management Information for TCP/IP-based Internets
- [OID repository](https://www.oid-info.com/get/1.3.6.1.4.1.42387)
