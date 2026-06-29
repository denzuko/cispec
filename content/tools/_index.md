---
title: "Tools"
description: "Tooling documentation for org.cispec conformance verification."
date: 2026-06-29
draft: false
---

# Tools

## cimatrix

`cimatrix` is the validation toolkit for `org.cispec` conformance. It is
a thin CLI wrapper around `strings(1)`, `opa check`, and `slsa-verifier`,
compiled to a standalone binary using the same build model as `dps/meta`
(qlot exec ros build → portable binary).

Repository: [github.com/denzuko/cimatrix](https://github.com/denzuko/cimatrix)  
GitHub Action: `uses: denzuko/cimatrix@v1`

### Installation

```sh
# Via GitHub Releases
curl -sLO https://github.com/denzuko/cimatrix/releases/latest/download/cimatrix-linux-amd64
chmod +x cimatrix-linux-amd64
mv cimatrix-linux-amd64 ~/.local/bin/cimatrix

# Verify SLSA attestation before use
slsa-verifier verify-artifact cimatrix-linux-amd64 \
  --provenance-path cimatrix-linux-amd64.intoto.jsonl \
  --source-uri github.com/denzuko/cimatrix
```

### Commands

#### verify-binary

Extracts `org.cispec.*` strings from a compiled binary using `strings(1)`
and verifies all required keys are present and syntactically valid.

```sh
cimatrix verify-binary ./my-binary
```

Exit codes: `0` = Verified conformance. `1` = violations found. `2` = tool error.

```sh
# Example output (conformant)
✓ org.cispec.organization=daplanet
✓ org.cispec.orgunit=dps
✓ org.cispec.application=my-tool
✓ org.cispec.version=1.0.0
✓ org.cispec.specversion=1.0
PASS: Verified conformance (5 labels found)

# Example output (violation)
✗ org.cispec.version — absent
FAIL: 1 violation(s)
```

#### verify-gate

Runs an OPA/Rego gate against input, using the cispec gate library as the
base policy bundle.

```sh
cimatrix verify-gate ./policy/slsa.rego
cimatrix verify-gate ./policy/attribution.rego --input labels.json
cimatrix verify-gate ./policy/ --input sbom.json  # all gates in directory
```

Gates are pulled from `https://cispec.org/gates/` on first run and cached
in `~/.cache/cimatrix/gates/`. Pass `--offline` to use the cache only.

#### verify-slsa

Wraps `slsa-verifier` with cispec-aware output formatting and records the
spec version in the verification report.

```sh
cimatrix verify-slsa ./my-binary ./my-binary.intoto.jsonl \
  --source-uri github.com/denzuko/my-tool
```

### GitHub Action

```yaml
- name: Verify org.cispec conformance
  uses: denzuko/cimatrix@v1
  with:
    binary: ./my-binary
    gate-dir: ./policy/
    slsa-provenance: ./my-binary.intoto.jsonl
    source-uri: github.com/denzuko/my-tool
```

The action uploads a SARIF report as a workflow artefact and annotates
the PR with any violations.

### Build model

`cimatrix` is built with the same model as `dps/meta`:

```sh
qlot exec ros build cimatrix.ros
```

The resulting binary is self-contained, links no shared Lisp runtime, and
carries its own `org.cispec.*` attribution strings verifiable by
`cimatrix verify-binary cimatrix`.

The binary itself is SLSA Level 3 attested via the `denzuko/cimatrix`
release workflow.
