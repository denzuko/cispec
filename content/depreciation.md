---
title: "depreciation"
term: "depreciation"
core: false
recommendedFor: ["any CI recorded as a capitalised asset on an organisation's books"]
related: ["cost", "billing-model", "acquired", "expiry", "costcenter"]
docOid: "1.3.6.1.4.1.42387.2.3.5"
docGuid: "0e456549-e677-5ad3-8c7f-49210439cb48"
date: 2026-06-30
draft: false
---

`org.cispec.depreciation` records the depreciation method and useful
life period applied to a capitalised Change Item — how its acquisition
cost is amortised over time for accounting and tax purposes.

Only applies to capitalised (capex) assets — physical equipment,
on-premises software licences, leasehold improvements, and other
fixed assets recorded on the balance sheet. CIs under opex, on-demand,
or subscription billing models do not depreciate in the accounting
sense. [`org.cispec.billing-model`](/billing-model/) signals which
model applies.

Applies across domains wherever capital assets appear: servers and
network equipment, vehicles and aircraft, industrial machinery,
medical devices, weapons systems and defence equipment, laboratory
instruments, and facilities improvements.

## Value format

Depreciation method and useful life — colon-separated.

```sh
org.cispec.depreciation=straight-line:5Y
org.cispec.depreciation=MACRS:7Y
org.cispec.depreciation=declining-balance:3Y
org.cispec.depreciation=units-of-production
```

Common useful life periods follow IRS or applicable tax authority
guidelines (5-year for computers and peripherals, 7-year for office
furniture and fixtures, 39-year for non-residential real property
under US MACRS).

## Conformance

`org.cispec.depreciation` is RECOMMENDED for any CI recorded as a
capitalised fixed asset. Not REQUIRED for Declared conformance.

## Attestation

`depreciation` is independently attestable against the organisation's
fixed asset register, tax filings, and financial statements. For
regulated industries (defence, pharmaceuticals, utilities) the
depreciation schedule may be verifiable against regulatory filings.

## Resolution and relation

`depreciation` pairs with [`cost`](/cost/) (the amount being
depreciated) and [`acquired`](/acquired/) (the start date of the
depreciation schedule). Together these three facts give an auditor
the current book value of a capitalised CI at any point in time.
