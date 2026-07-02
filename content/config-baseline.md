---
title: "config-baseline"
term: "config-baseline"
core: false
experimental: true
recommendedFor: ["any CI subject to a formal configuration baseline or hardening profile"]
related: ["scan-policy", "boundary", "classification", "version", "checksum"]
docOid: "1.3.6.1.4.1.42387.2.8.5"
docGuid: "fe80be18-0f77-57cd-b57d-29cc26688589"
date: 2026-06-30
draft: false
---

> **Experimental.** Use this term in implementations, but treat the
> value format as advisory — the right way to reference baseline
> documents varies across domains (DISA STIGs, CIS Benchmarks, OSCAL
> templates, pharmaceutical GxP baselines) and has not yet been settled.
> The pointer shape is correct: point at the baseline document, not
> inline its content. If you implement `config-baseline` in production,
> share what reference scheme you used. Real-world feedback is what
> settles the format and advances this term to Stable.

`org.cispec.config-baseline` is a bare reference pointer to the
configuration baseline or hardening profile the Change Item is
configured against — the template or standard that defines its
expected configuration state. This generalises OSCAL's
`baseline-template` property into a cross-domain term.

The underlying fact is universal: any managed CI has a baseline
configuration it should conform to. A server has a CIS Benchmark or
DISA STIG. A network device has a hardening guide. A pharmaceutical
manufacturing system has a validated baseline configuration under GxP.
A medical device has a type-approved reference configuration. A
classified workstation has an NSA/CNSS-approved baseline. The term
is the same; the reference scheme and the governing authority vary
by domain and by organisation.

This is a pointer — the same pattern as [`custody-chain`](/custody-chain/)
and [`contract-ref`](/contract-ref/): the key cites the baseline;
the baseline's content lives in a configuration management or
compliance system.

## Value format

A baseline identifier — a STIG identifier, CIS Benchmark version, a
URI, or an internal baseline reference. The experimental status means
the preferred reference scheme is not yet formally mandated.

```sh
org.cispec.config-baseline=DISA-STIG-RHEL9-v1r1
org.cispec.config-baseline=CIS-Ubuntu22-L2-v1.0.0
org.cispec.config-baseline=NIST-NCP-USGCB-RHEL7
org.cispec.config-baseline=https://baselines.example.org/prod-server-v3
org.cispec.config-baseline=GXP-VALIDATED-BASELINE-2026-001
```

## Conformance

`org.cispec.config-baseline` is RECOMMENDED for any CI under a formal
configuration baseline or hardening programme. Not REQUIRED for
Declared conformance.

## Attestation

`config-baseline` is independently attestable where the referenced
baseline is a public standard (DISA STIGs, CIS Benchmarks are
publicly verifiable) or an auditable internal document. Configuration
compliance against the baseline is a separate assessment concern
outside this specification's scope.

## Resolution and relation

"Every CI configured against `DISA-STIG-RHEL9-v1r1`" is a real
fleet-wide compliance query — the set of assets for which a new STIG
release requires reassessment.
