---
title: "matrix_id.h — Canonical C99 Reference Header"
description: "Single-header C99 reference implementation for baking org.cispec attribution strings into compiled artefacts."
date: 2026-06-29
draft: false
---

# matrix_id.h

Single-header C99 reference implementation. Copy into your project's include
path. No build system integration required beyond `#include "matrix_id.h"`.

Configure via preprocessor defines before inclusion:

```sh
cc -DCISPEC_ORGANIZATION='"daplanet"' \
   -DCISPEC_ORGUNIT='"dps"' \
   -DCISPEC_APPLICATION='"my-tool"' \
   -DCISPEC_VERSION='"1.0.0"' \
   -include matrix_id.h \
   main.c -o my-tool
```

Or define in a dedicated translation unit (`matrix_id.c`) that includes this
header after setting the macros, and link normally.

## Source

```c
/* SPDX-License-Identifier: BSD-2-Clause
 *
 * matrix_id.h — org.cispec Change Item attribution header
 * Canonical source: https://cispec.org/spec/matrix_id.h
 * Spec version: 1.0
 *
 * Bakes org.cispec.* attribution strings into compiled artefacts as
 * volatile const char[] arrays, extractable with strings(1) without
 * executing the binary.
 *
 * Required defines (set before inclusion or via -D flags):
 *   CISPEC_ORGANIZATION   — owning organisation slug
 *   CISPEC_ORGUNIT        — organisational unit slug
 *   CISPEC_APPLICATION    — application or service name
 *   CISPEC_VERSION        — semver 2.0 version string
 *
 * Optional defines:
 *   CISPEC_OWNER          — identity contact (key fingerprint or handle)
 *   CISPEC_OID            — IANA OID arc (default: iso.org.dod.internet.42387)
 *   CISPEC_DUNS           — D&B DUNS in OID notation
 *   CISPEC_CUSTOMER       — customer identifier
 *   CISPEC_COSTCENTER     — cost centre identifier
 *   CISPEC_ROLE           — functional role slug
 *   CISPEC_ENVIRONMENT    — deployment environment slug
 *   CISPEC_SPECVERSION    — cispec spec version validated against (default: "1.0")
 */

#ifndef MATRIX_ID_H
#define MATRIX_ID_H

/* ------------------------------------------------------------------ */
/* Required keys — compilation fails if any are absent                 */
/* ------------------------------------------------------------------ */

#ifndef CISPEC_ORGANIZATION
#  error "matrix_id.h: CISPEC_ORGANIZATION must be defined"
#endif

#ifndef CISPEC_ORGUNIT
#  error "matrix_id.h: CISPEC_ORGUNIT must be defined"
#endif

#ifndef CISPEC_APPLICATION
#  error "matrix_id.h: CISPEC_APPLICATION must be defined"
#endif

#ifndef CISPEC_VERSION
#  error "matrix_id.h: CISPEC_VERSION must be defined"
#endif

/* ------------------------------------------------------------------ */
/* Defaults for optional keys                                          */
/* ------------------------------------------------------------------ */

#ifndef CISPEC_OID
#  define CISPEC_OID "iso.org.dod.internet.42387"
#endif

#ifndef CISPEC_SPECVERSION
#  define CISPEC_SPECVERSION "1.0"
#endif

/* ------------------------------------------------------------------ */
/* Attribution string array — volatile prevents dead-code elimination  */
/* ------------------------------------------------------------------ */

volatile const char CISPEC_ID_ORGANIZATION[]  =
    "org.cispec.organization=" CISPEC_ORGANIZATION;

volatile const char CISPEC_ID_ORGUNIT[]       =
    "org.cispec.orgunit=" CISPEC_ORGUNIT;

volatile const char CISPEC_ID_APPLICATION[]   =
    "org.cispec.application=" CISPEC_APPLICATION;

volatile const char CISPEC_ID_VERSION[]       =
    "org.cispec.version=" CISPEC_VERSION;

volatile const char CISPEC_ID_OID[]           =
    "org.cispec.oid=" CISPEC_OID;

volatile const char CISPEC_ID_SPECVERSION[]   =
    "org.cispec.specversion=" CISPEC_SPECVERSION;

#ifdef CISPEC_OWNER
volatile const char CISPEC_ID_OWNER[]         =
    "org.cispec.owner=" CISPEC_OWNER;
#endif

#ifdef CISPEC_DUNS
volatile const char CISPEC_ID_DUNS[]          =
    "org.cispec.duns=" CISPEC_DUNS;
#endif

#ifdef CISPEC_CUSTOMER
volatile const char CISPEC_ID_CUSTOMER[]      =
    "org.cispec.customer=" CISPEC_CUSTOMER;
#endif

#ifdef CISPEC_COSTCENTER
volatile const char CISPEC_ID_COSTCENTER[]    =
    "org.cispec.costcenter=" CISPEC_COSTCENTER;
#endif

#ifdef CISPEC_ROLE
volatile const char CISPEC_ID_ROLE[]          =
    "org.cispec.role=" CISPEC_ROLE;
#endif

#ifdef CISPEC_ENVIRONMENT
volatile const char CISPEC_ID_ENVIRONMENT[]   =
    "org.cispec.environment=" CISPEC_ENVIRONMENT;
#endif

/* ------------------------------------------------------------------ */
/* Sentinel — marks end of org.cispec block in strings(1) output      */
/* ------------------------------------------------------------------ */

volatile const char CISPEC_ID_SENTINEL[]      =
    "org.cispec.specversion=" CISPEC_SPECVERSION;

#endif /* MATRIX_ID_H */
```

## Verification

After building, confirm the strings are present:

```sh
strings ./my-binary | grep '^org\.cispec\.'
```

Expected output (minimum, required keys only):

```
org.cispec.organization=daplanet
org.cispec.orgunit=dps
org.cispec.application=my-tool
org.cispec.version=1.0.0
org.cispec.oid=iso.org.dod.internet.42387
org.cispec.specversion=1.0
```

For automated verification in CI, use `cimatrix verify-binary`:

```sh
cimatrix verify-binary ./my-binary
```

## Licence

BSD-2-Clause. SPDX-License-Identifier: `BSD-2-Clause`.  
Canonical source: `https://cispec.org/spec/matrix_id.h`
