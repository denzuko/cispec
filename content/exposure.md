---
title: "exposure"
term: "exposure"
core: false
recommendedFor: ["any CI whose public accessibility is a meaningful security or compliance fact"]
related: ["boundary", "classification", "environment", "ip-address", "fqdn"]
docOid: "1.3.6.1.4.1.42387.2.8.3"
docGuid: "9aeb523a-c902-5fef-9398-709b424208ff"
date: 2026-06-30
draft: false
---

`org.cispec.exposure` records whether and how a Change Item is
accessible from outside its immediate network boundary — its
public accessibility posture. This is the fact that determines
exposure to external threat actors, governs which vulnerability
scanning policies apply, and is required by FedRAMP's OSCAL
inventory model (the `public` property) as part of machine-readable
authorization packages mandated by RFC-0024.

This is distinct from [`org.cispec.boundary`](/boundary/) (which
boundary the CI sits within), [`org.cispec.classification`](/classification/)
(what the CI is certified/regulated as), and
[`org.cispec.environment`](/environment/) (what programme the CI is
assigned to). A CI can be inside a FedRAMP authorization boundary
(`boundary=fedramp-ato-2026-prod`) and publicly accessible
(`exposure=public`) simultaneously — these are independent facts.

Applies to any CI where external accessibility is a security-relevant
fact: servers, network equipment, APIs, services, IoT devices,
facilities (physical perimeter exposure), and any other asset where
the distinction between public, restricted, and private access matters
for threat modelling and compliance.

## Value format

One of three values:

```sh
org.cispec.exposure=public
org.cispec.exposure=restricted
org.cispec.exposure=private
```

- `public` — accessible from the general internet or unauthenticated
  external parties without prior arrangement
- `restricted` — accessible to authenticated external parties or
  specific external networks only (partner networks, VPN users,
  agency-to-agency connections)
- `private` — accessible only from within the owning organisation's
  own network perimeter; no external access of any kind

## Conformance

`org.cispec.exposure` is RECOMMENDED for any CI where public
accessibility is a security or compliance consideration. Not REQUIRED
for Declared conformance.

## Attestation

`exposure` is independently attestable via network scanning, firewall
rule review, and external probe testing. For FedRAMP specifically,
the `public` value corresponds to the OSCAL `public=yes` property
and is subject to verification during 3PAO assessment.

## Resolution and relation

"Every CI with `exposure=public`" is a fundamental vulnerability
management query — the set of CIs directly reachable by external
threat actors and therefore subject to the highest priority patching
and monitoring obligations.
