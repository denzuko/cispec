# CLAUDE.md — cispec

## What this repo is

Source for [cispec.org](https://cispec.org) — the public standards authority
site for the `org.cispec` Change Item attribution namespace.

Spec version: **1.0**  
Licence: BSD-2-Clause  
IANA PEN: 42387  
D&B DUNS: 039-271-257  

## Build system

Hugo static site. Build with:

```sh
hugo --minify --baseURL "https://cispec.org/"
```

No server-side processing. Output goes to `public/`. Deployed to
Cloudflare R2 via `cloudflare/wrangler-action`.

## Content rules

- Brand voice: dwightaspencer.com register — practitioner-to-practitioner,
  active voice, no rhetorical questions, max one em-dash per page,
  Oxford/ASA English (-ise endings, artefact, programme, licence).
- No pundit patterns ("some argue", "many believe", "it is worth noting").
- All normative text is in `content/spec/`.
- Gate source lives in `content/gates/`; each gate file is a Markdown page
  with the Rego source embedded in a fenced code block.
- Hugo frontmatter rule: `[related_post]` must be last if present.

## Namespace

`org.cispec` is the canonical label prefix. `net.matrix.*` is the
predecessor; do not introduce `net.matrix` strings anywhere in this repo.

## Versioning

Spec versions follow semver 2.0. `hugo.toml` `params.specVersion` and
gate file `cispec_version` rules must match the current stable version.

## Relationship to denzuko/cimatrix

This repo is the spec. `cimatrix` (separate repo) is the toolkit.
Do not conflate them. Gates documented here are the canonical source;
`cimatrix` pulls them from `https://cispec.org/gates/`.

## Commit conventions

Conventional commits. Scope: `spec`, `gates`, `site`, `ci`, `docs`.

Examples:
- `feat(spec): add org.cispec.specversion label key`
- `fix(gates): correct slug regex in attribution.rego`
- `docs(site): add migration guide for net.matrix rescope`
