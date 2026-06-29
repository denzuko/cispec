---
title: "ast/forbidden-calls.rego — Forbidden Call Gate"
description: "OPA/Rego gate rejecting calls to unsafe C standard library functions in static analysis output."
date: 2026-06-29
draft: false
---

# ast/forbidden-calls.rego

Verifies that a C99 project's static analysis output contains no calls
to functions on the DPS forbidden list. Accepts two input formats:
SARIF 2.1.0 (preferred, from any SARIF-emitting analyser) and a simple
JSON array of call-site records for lighter toolchains.

```sh
# SARIF input (from cppcheck, clang-tidy, etc.)
cimatrix verify-gate ast/forbidden-calls.rego --input analysis.sarif

# Simple call-site array
cimatrix verify-gate ast/forbidden-calls.rego --input callsites.json
```

## Forbidden functions

These functions are unconditional violations. Any call to them in
production C99 code fails the gate.

| Function | Reason | Replacement |
|---|---|---|
| `gets()` | No length limit; guaranteed buffer overflow | `fgets()` |
| `strcpy()` | No bounds checking | `strlcpy()` or `strncpy()` |
| `strcat()` | No bounds checking | `strlcat()` or `strncat()` |
| `sprintf()` | No bounds checking | `snprintf()` |
| `scanf()` | Input can overflow destination buffer | `fgets()` + `sscanf()` |
| `system()` | Shell injection risk | Direct `execve()` family |
| `popen()` | Shell injection risk | Direct `execve()` family |

## Deprecated functions (warnings, not violations)

| Function | Reason | Replacement |
|---|---|---|
| `strncpy()` | Does not guarantee NUL termination | `strlcpy()` |
| `strncat()` | Length argument is remaining space, not total buffer size | `strlcat()` |

## Input formats

### SARIF 2.1.0

Standard SARIF emitted by cppcheck, clang-tidy, gcc with
`-fanalyzer`, or any SARIF-capable tool. The gate reads
`runs[*].results[*]` and matches `ruleId` against the forbidden set.

```json
{
  "version": "2.1.0",
  "runs": [{
    "results": [{
      "ruleId": "gets",
      "level": "error",
      "locations": [{
        "physicalLocation": {
          "artifactLocation": { "uri": "src/main.c" },
          "region": { "startLine": 42 }
        }
      }]
    }]
  }]
}
```

### Call-site array

Lighter alternative for tools that do not emit SARIF:

```json
[
  { "function": "gets",   "file": "src/main.c", "line": 42 },
  { "function": "strcpy", "file": "src/util.c", "line": 17 }
]
```

The gate detects format by checking for `input.runs`.

## Source

```rego
# SPDX-License-Identifier: BSD-2-Clause
# Package: cispec.ast.forbidden_calls
# Canonical source: https://cispec.org/gates/ast/forbidden-calls.rego
# Spec version: 1.0

package cispec.ast.forbidden_calls

import future.keywords.contains
import future.keywords.if
import future.keywords.in

cispec_version := "1.0"

forbidden := {
    "gets":    "use fgets(); gets() has no length limit",
    "strcpy":  "use strlcpy() or strncpy(); strcpy() risks buffer overflow",
    "strcat":  "use strlcat() or strncat(); strcat() risks buffer overflow",
    "sprintf": "use snprintf(); sprintf() risks buffer overflow",
    "scanf":   "use fgets() + sscanf(); scanf() risks buffer overflow",
    "system":  "do not call system(); shell injection risk",
    "popen":   "do not call popen(); shell injection risk",
}

deprecated := {
    "strncpy": "strncpy() does not guarantee NUL termination; prefer strlcpy()",
    "strncat": "strncat() length argument is remaining space, not total; prefer strlcat()",
}

# ----------------------------------------------------------------
# SARIF input mode
# ----------------------------------------------------------------

deny contains msg if {
    some run in input.runs
    some result in run.results
    fn := result.ruleId
    reason := forbidden[fn]
    loc := result.locations[0].physicalLocation
    msg := sprintf(
        "forbidden call to %s() at %s:%d — %s",
        [fn, loc.artifactLocation.uri, loc.region.startLine, reason]
    )
}

# ----------------------------------------------------------------
# Call-site array input mode
# ----------------------------------------------------------------

deny contains msg if {
    not input.runs
    some call in input
    reason := forbidden[call.function]
    msg := sprintf(
        "forbidden call to %s() at %s:%d — %s",
        [call.function, call.file, call.line, reason]
    )
}

# ----------------------------------------------------------------
# Deprecated (warnings)
# ----------------------------------------------------------------

warn contains msg if {
    not input.runs
    some call in input
    reason := deprecated[call.function]
    msg := sprintf(
        "deprecated function %s() at %s:%d — %s",
        [call.function, call.file, call.line, reason]
    )
}
```

## Integration with cppcheck

```sh
cppcheck --enable=all --output-file=analysis.sarif --template=sarif src/
cimatrix verify-gate ast/forbidden-calls.rego --input analysis.sarif
```

## Integration with clang-tidy

```sh
clang-tidy src/*.c -- -std=c99 2>&1 | \
  clang-tidy-sarif > analysis.sarif
cimatrix verify-gate ast/forbidden-calls.rego --input analysis.sarif
```

## Integration in CI

```yaml
- name: Static analysis
  run: cppcheck --enable=all --template=sarif src/ > analysis.sarif

- name: Forbidden call gate
  uses: denzuko/cimatrix@v1
  with:
    gate-file: ast/forbidden-calls.rego
    gate-input: analysis.sarif
```
