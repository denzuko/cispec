---
title: "schemas"
term: "schemas"
core: false
date: 2026-06-30
draft: false
---

Formal schema artefacts defining the `org.cispec` label set in six
formats. All artefacts are published under BSD-2-Clause. Each defines
the same 14 terms — core and extended — against the same value
constraints documented on the individual term pages.

These files are the formal counterpart to the prose on this site:
governance defines what terms mean; the schema files give that same
definition to machine validators, code generators, and protocol
toolchains.

## Downloads

| Format | File | Use |
|---|---|---|
| JSON Schema (Draft 2020-12) | [cispec.schema.json](/cispec.schema.json) | cimatrix gates, CycloneDX extensions, REST API validation, any JSON toolchain |
| ASN.1 | [cispec.asn1](/cispec.asn1) | SNMP, X.509, BER/DER encoding, `asn1c`, OSS Nokalva, telecom toolchains |
| XML Schema (XSD 1.0) | [cispec.xsd](/cispec.xsd) | CycloneDX-XML, SPDX-XML, SOAP, any XML Schema-aware toolchain |
| Document Type Definition | [cispec.dtd](/cispec.dtd) | Legacy XML tooling predating XSD |
| Protocol Buffers (proto3) | [cispec.proto](/cispec.proto) | gRPC, binary serialisation, `protoc` code generation for Go/Java/Python/JS |
| S-expressions | [cispec.sexp](/cispec.sexp) | `dps-meta`, `cimatrix`, and any Common Lisp toolchain; machine-readable by `READ` |
| ANSI X12 / EDIFACT | [cispec.edi](/cispec.edi) | Federal contracting (WAWF/DIBBS), DoD invoicing (DFARS 252.232-7003), EDI trading partners |

## Versioning

Schema files are versioned alongside the specification. The current
version is **1.0**. A schema file's internal `version` annotation
records which spec version it was authored against.

MAJOR spec changes that rename, remove, or semantically change a term
produce a new schema version. MINOR changes (new optional terms) extend
existing schemas without breaking existing validators.

## Adding terms to your validator

All schemas include an extension point for implementor-minted
`org.cispec.*` terms. See the [minting rules](/#minting-new-terms)
on the root page before adding extension terms — they must resolve
at a public TLS-verified domain, and must pass both the ITIL-scope and
redundancy tests.
