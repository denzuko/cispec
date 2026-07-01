---
title: "expiry"
term: "expiry"
core: false
recommendedFor: ["any CI with a defined expiry, end-of-life, or renewal date"]
related: ["acquired", "version", "sla", "contract-ref", "retention", "classification"]
docOid: "1.3.6.1.4.1.42387.2.4.3"
docGuid: "9714b5bf-3536-5fc9-a53a-b8f0cf1a65db"
date: 2026-06-30
draft: false
---

`org.cispec.expiry` records when a Change Item expires, reaches
end-of-life, or requires renewal. This is one of the most universal
facts in the namespace — almost every CI type has some form of expiry:

- Software licences and subscriptions expire on contract end dates
- X.509 certificates have a `notAfter` field
- Access credentials and tokens expire by policy
- Drug lots expire by regulatory requirement
- Maintenance contracts expire at term end
- Equipment reaches vendor end-of-life on published dates
- Weapons systems reach service-life limits
- Building permits and facility certifications expire
- Security clearances require periodic reinvestigation
- AI model versions are deprecated on published timelines
- Budget appropriations expire at fiscal year end

`expiry` is a lifecycle trigger — downstream automation, procurement
workflows, and compliance monitoring systems act on this value to
initiate renewal, decommission, or replacement processes. In
[`org.cispec.costcenter`](/costcenter/) terms: the cost centre policy
knows what to do when a CI's `expiry` is reached; `expiry` is the
timestamp that fires that policy.

## Value format

An ISO 8601 date or datetime.

```sh
org.cispec.expiry=2027-12-31
org.cispec.expiry=2026-09-15T23:59:59Z
org.cispec.expiry=2028-03-31
```

## Conformance

`org.cispec.expiry` is RECOMMENDED for any CI with a defined expiry
or end-of-life date. Not REQUIRED for Declared conformance.

## Attestation

`expiry` is independently attestable against vendor documentation,
certificate fields, regulatory filings, contract terms, or
published EOL schedules. For X.509 certificates the `notAfter`
field is the authoritative source. For software EOL, vendor-published
EOL tables are the reference.

## Resolution and relation

`expiry` paired with [`acquired`](/acquired/) gives the full
active lifespan of a CI. Paired with [`contract-ref`](/contract-ref/)
it gives the contract term. Paired with [`cost`](/cost/) and
[`depreciation`](/depreciation/) it anchors the depreciation
schedule's end point.
