# Contributing to cispec

## Licence

All contributions are published under BSD-2-Clause.
SPDX-License-Identifier: `BSD-2-Clause`

## Adding or editing a term

1. Apply both minting tests from the root page (ITIL-scope, redundancy)
   before adding a new term — see CLAUDE.md for the exact text.
2. Add `content/<term>.md` with the frontmatter shape documented in
   CLAUDE.md.
3. Link the new term from every related existing term's `related` list,
   and link back. The graph should never have a one-directional edge.
4. Open a pull request — squash merge only.

## What this repo does not host

Rego gates, CLI tooling, and reference implementations of the C99/Lisp
baking pattern do not belong here. See CLAUDE.md's "What does NOT
belong in this repo" section before proposing any of these.

## Namespace rule

`org.cispec.*` only. No `net.matrix.*` strings outside the historical
migration table on the root page.

## Conventional commits

Scope: `term`, `site`, `docs`.
