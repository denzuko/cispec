# CLAUDE.md — cispec

## What this repo is

Source for [cispec.org](https://cispec.org) — the `org.cispec` Change
Item attribution namespace. A flat knowledge graph, not a document tree:
every page is a peer term definition, linked to related terms directly.

## Build system

Hugo static site, no theme dependency, no Hugo extended requirement.

```sh
hugo --minify --baseURL "https://cispec.org/"
```

No server-side processing. Output goes to `public/`. Deployed via
Cloudflare Pages (or any static host) connected directly to this repo.

## Site shape — read before adding any page

There is no `/types/`, `/spec/`, `/gates/`, `/tools/`, or `/asn/`
section. Do not recreate them. The root page (`content/_index.md`) is
the normative specification text. Every other page is a flat term
definition at `content/<term>.md`, rendering at `cispec.org/<term>/`.

A term page's frontmatter drives its rendering:

```yaml
title: "owner"
term: "owner"
core: true                              # universal core key, or omit/false
requiredFor: ["any CI"]                 # REQUIRED context(s), RFC 2119 sense
recommendedFor: [...]                   # RECOMMENDED context(s)
optionalFor: [...]                      # OPTIONAL context(s)
oidArc: "iso.org.dod.internet.42387"    # only if this term carries an OID
related: ["organization", "oid", ...]   # outbound graph edges
```

## What does NOT belong in this repo

- Rego policy gates — these live in cimatrix, this repo only describes
  conformance requirements in prose.
- The cimatrix CLI or any tooling docs — cimatrix.org's job, not this
  repo's.
- Reference implementations of the C99/Lisp baking pattern
  (`matrix_id.h`, `matrix-id.lisp`) — these are authored inline by
  consumers (e.g. `dps-meta`'s `identity/c99.lisp`), not hosted here.
  This repo describes the pattern in prose (the carrier-format section
  of the root page); it does not ship a canonical file implementing it.
  Governance informs implementation at development time. Implementation
  does not fetch from governance at runtime.

## Minting new terms — the two MUSTs

Before adding a new term page, apply both tests from the root page:

1. Does it identify, attest, or relate to a tracked Change Item under
   IT/OT service delivery, asset management, cost accounting, or chain
   of custody? If not, it does not belong here.
2. Does an existing term, used with a structured/qualified value,
   already express this fact? If yes, do not add a new term — document
   the qualified-value pattern on the existing term's page instead.

## Namespace

`org.cispec` is the canonical label prefix, reverse-DNS scoped the same
way `net.matrix` (its retired predecessor) was. `net.matrix.*` must
never appear in new content; the migration table on the root page is
the only place it's referenced, as history.

## Commit conventions

Conventional commits. Scope: `term` (new or edited term page), `site`
(layout/config), `docs` (README/CLAUDE.md).
