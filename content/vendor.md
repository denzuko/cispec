---
title: "vendor"
term: "vendor"
core: false
recommendedFor: ["any CI acquired through or serviced by a third-party commercial entity"]
related: ["manufacturer", "contract-ref", "cost", "sla", "costcenter"]
docOid: "1.3.6.1.4.1.42387.2.3.8"
docGuid: "b57413eb-ea61-5ce2-a9a9-274832e2eea0"
date: 2026-06-30
draft: false
---

`org.cispec.vendor` identifies who sells or services a Change Item
to the owning organisation — the entity the organisation has a
direct commercial relationship with. This is distinct from
[`org.cispec.manufacturer`](/manufacturer/), which identifies who
*produces* the thing.

In most supply chains these are different entities: Cisco manufactures
the switch; CDW sells it. Pfizer manufactures the vaccine; a GPO or
distributor supplies it. Anthropic manufactures the Claude models;
AWS Marketplace or a reseller may be the commercial vendor. Lockheed
Martin manufactures the F-35; the DLA or a prime contractor may be
the procurement vendor for specific components or services.

The distinction matters operationally: `manufacturer` is who to call
for a product recall, a CVE advisory, or a firmware update.
`vendor` is who to call for a contract dispute, a renewal, a support
ticket, or an invoice query. Both facts are needed; neither is
derivable from the other.

Applies to any CI with a vendor relationship: physical equipment,
software licences, SaaS products, AI API access, maintenance
contracts, pharmaceutical supply, facility services.

## Value format

The vendor's commonly used trading name.

```sh
org.cispec.vendor=CDW
org.cispec.vendor=AWS-Marketplace
org.cispec.vendor=McKesson
org.cispec.vendor=Anthropic
org.cispec.vendor=Booz-Allen-Hamilton
```

Note: where the manufacturer sells directly with no intermediary,
`vendor` and `manufacturer` may carry the same value. This is not
a redundancy — it is a statement that the commercial relationship
is direct.

## Conformance

`org.cispec.vendor` is RECOMMENDED for any CI with a vendor
relationship. Not REQUIRED for Declared conformance.

## Attestation

`vendor` is independently attestable against procurement records,
invoices, and contract documentation. For federal procurement,
vendornames are verifiable against SAM.gov registrations.

## Resolution and relation

Every Change Item sharing the same `vendor` value forms an edge
in the namespace's knowledge graph — "every CI sourced from
`CDW`" is a real, expected query for vendor risk management,
contract renewal planning, and supply chain security reviews.
