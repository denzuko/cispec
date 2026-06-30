---
title: "owner"
term: "owner"
core: true
requiredFor: ["any CI"]
related: ["organization", "orgunit", "oid", "customer", "costcenter", "custody-chain"]
docOid: "1.3.6.1.4.1.42387.2.1.2"
docGuid: "54cfcb4f-03f8-548e-80e7-75aea99c3580"
date: 2026-06-30
draft: false
---

`org.cispec.owner` identifies the individual or role accountable for a
Change Item. It is the single key for ownership and responsibility;
role-qualified ownership (a shift supervisor, an approving authority, an
incident commander) is expressed as a structured value on this key, not
as a separate term.

## Value format

An identity-contact value, in one of two forms:

A bare identity — an email address or directory identifier:

```sh
org.cispec.owner=denzuko@dapla.net
org.cispec.owner=shift-supervisor:j.martinez@example.org
```

A GPG key ID attesting to a domain — `<key-id>@<domain>`, where the key
identified vouches for the named domain, not for an email mailbox at
that domain:

```sh
org.cispec.owner=FC13F74B@dapla.net
```

A single GPG key MAY attest to more than one domain — historically a
single identity at Da Planet Security has attested to multiple
domains (`matrix.net`, `computekindustries.com`, `dapla.net`) using
one key. The `@domain` suffix in this form names which domain the
attestation applies to in this specific label, not which domains the
key is capable of attesting to in general.

A role-qualified value (a colon-separated prefix on either form)
narrows accountability to a specific function or context. A single
Change Item MAY carry more than one `org.cispec.owner` label if more
than one role applies (for example, a technical owner and a business
owner with distinct identities).

## Conformance

`org.cispec.owner` is REQUIRED for Declared conformance on any Change
Item, regardless of type.

## Attestation

`owner` supports two attestation tiers, and which tier applies depends
entirely on the value's own form:

A bare email or directory identifier is **not independently
attestable** — it is a self-asserted claim, the same as
[`organization`](/organization/) or [`orgunit`](/orgunit/).

A GPG-key-ID form (`<key-id>@<domain>`) **is independently
attestable**, in the historical pattern this namespace's identity
layer was originally built on: an organisation-managed Certificate
Authority, participating in the CA/Browser Forum, backed by a
directory service, issuing certificates whose CN matches the attested
domain — paired with a GPG key as a second, independently checkable
signature layer. Both the certificate chain and the GPG key fingerprint
are verifiable by any party against public infrastructure (a
CT log, a CA's own OCSP/CRL endpoint, a keyserver or WKD lookup for the
fingerprint) without trusting the asserting organisation's own
systems — the same publicly-rooted trust model as
[`duns`](/duns/) and [`oid`](/oid/), applied to identity rather than
to a registry number.

This specification does not mandate the GPG/CA tier; a bare identity
remains conformant for Declared status. Verified or Attested
conformance for a Change Item where ownership integrity matters
SHOULD prefer the GPG-key-ID form, and cimatrix gates checking
ownership attestation SHOULD verify the certificate chain and key
fingerprint independently rather than accepting the string as written.

## Resolution and relation

Every Change Item that lists a given identity as `owner` forms an edge
in the namespace's knowledge graph — "everything `denzuko@dapla.net`
owns" is a real, expected query. This specification does not define how
that query is answered. An organisation's own CMDB, ERP, or directory
service is responsible for traversal; this site only defines what the
`owner` value means once it is read.
