---
title: "schemas"
term: "schemas"
core: false
date: 2026-06-30
draft: false
---

Machine-readable versions of the `org.cispec` label set in seven
formats. All are published under BSD-2-Clause and define the same 51
terms against the same value constraints documented on the individual
term pages. Use whichever format your toolchain consumes.

## Downloads

| Format | File | Use |
|---|---|---|
| JSON Schema (Draft 2020-12) | [cispec.schema.json](/cispec.schema.json) | cimatrix gates, CycloneDX extensions, REST API validation, any JSON toolchain |
| ASN.1 | [cispec.asn1](/cispec.asn1) | SNMP, X.509, BER/DER encoding, `asn1c`, OSS Nokalva, telecom toolchains |
| XML Schema (XSD 1.0) | [cispec.xsd](/cispec.xsd) | CycloneDX-XML, SPDX-XML, SOAP, any XML Schema-aware toolchain |
| Document Type Definition | [cispec.dtd](/cispec.dtd) | Legacy XML tooling predating XSD |
| Protocol Buffers (proto3) | [cispec.proto](/cispec.proto) | gRPC, binary serialisation, `protoc` code generation for Go/Java/Python/JS |
| S-expressions | [cispec.sexp](/cispec.sexp) | Common Lisp toolchain; machine-readable by `READ` without compilation |
| ANSI X12 / EDIFACT | [cispec.edi](/cispec.edi) | Federal contracting (WAWF/DIBBS), DoD invoicing (DFARS 252.232-7003), EDI trading partners |

## Versioning

Schema files are versioned alongside the specification. Each file's
internal `version` annotation records which spec version it targets.
A change that renames, removes, or changes the meaning of a term
produces a new schema version. Adding new optional terms does not.

## Adding extension terms to your validator

All schemas include an extension point for terms outside the
`org.cispec.*` namespace. If your organisation needs a fact not
covered by any existing term, use your own reverse-DNS namespace
(`net.example.my-term`) rather than `org.cispec.*`. See
[Minting new terms](/#minting-new-terms) for the rules that govern
what belongs in `org.cispec.*` and what does not.
