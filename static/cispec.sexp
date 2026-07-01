;;;; SPDX-License-Identifier: BSD-2-Clause
;;;; cispec.sexp — S-expression schema for org.cispec v1.0 — 51 terms
;;;; Canonical governance: https://cispec.org/
;;;; Validation toolkit:   https://cimatrix.org/
;;;; Load with: (with-open-file (f "cispec.sexp") (read f))

(:schema
 :version "1.0"
 :namespace "org.cispec"
 :governance "https://cispec.org/"
 :validation "https://cimatrix.org/"
 :iana-pen 42387
 :spdx "BSD-2-Clause"

 :required
 ("org.cispec.organization"
  "org.cispec.orgunit"
  "org.cispec.owner"
  "org.cispec.role"
  "org.cispec.application"
  "org.cispec.version")

 :conformance
 ((:level :declared  :description "Required core keys present. Self-asserted.")
  (:level :verified  :description "Mechanically verified by cimatrix. Terms resolve at public TLS domain.")
  (:level :attested  :description "SLSA-attested, cited in production artefacts."))

 :terms
 (;; ---- IDENTITY 42387.2.1.* ----
  (:key "org.cispec.organization"  :arc "2.1"     :guid "8ef717a5-d8c0-512d-8cc5-9d62cea811ca"
   :type :slug :core t :conformance :required :context :universal
   :description "Owning org slug. X.500 O.")
  (:key "org.cispec.orgunit"       :arc "2.1.1"   :guid "8da4c483-9e88-5831-8c1d-e3b2d584794e"
   :type :slug :core t :conformance :required :context :universal
   :description "Org unit slug. X.500 OU.")
  (:key "org.cispec.owner"         :arc "2.1.2"   :guid "54cfcb4f-03f8-548e-80e7-75aea99c3580"
   :type :identity :core t :conformance :required :context :universal
   :description "Accountable party. Email, GPG-key-ID@domain, or role:identity.")
  (:key "org.cispec.role"          :arc "2.1.3"   :guid "325eee00-01e1-58c8-bb0b-982ab775e039"
   :type :slug :core t :conformance :required :context :universal
   :description "Operational role this CI instance is fulfilling. Universal.")
  (:key "org.cispec.application"   :arc "2.1.4"   :guid "84784cd0-297e-5aec-962d-3e552cd55965"
   :type :string :core t :conformance :required :context :universal
   :description "Designed purpose or applied function. Universal.")

  ;; ---- REGISTRY 42387.2.2.* ----
  (:key "org.cispec.oid"           :arc "2.2"     :guid "c79d496e-04f0-559c-9e88-63109933cddb"
   :type :oid-string :conformance :recommended :context :universal
   :description "Relational pointer to the CLIENT's own OID arc.")
  (:key "org.cispec.duns"          :arc "2.2.1"   :guid "706730f3-ac1d-573b-94ae-b717305e4a35"
   :type :duns-string :pattern "^iso\\.org\\.duns\\.[0-9]{9}$"
   :conformance :optional :context :universal
   :description "D&B DUNS in OID notation.")

  ;; ---- FINANCIAL 42387.2.3.* ----
  (:key "org.cispec.customer"      :arc "2.3"     :guid "748000b4-ea01-58ab-9613-a73aa5658fda"
   :type :string :conformance :optional :context :universal
   :description "Customer identifier.")
  (:key "org.cispec.costcenter"    :arc "2.3.1"   :guid "c7fe2951-e8c2-5ce0-adb9-3e941db9ac8b"
   :type :string :conformance :optional :context :universal
   :description "Cost centre identifier.")
  (:key "org.cispec.cost"          :arc "2.3.2"   :guid "9d633303-4b6e-5c01-bbc0-2554769f3aa5"
   :type :string :conformance :recommended :context :universal
   :description "Acquisition cost. Format: amount:currency[:type].")
  (:key "org.cispec.unit-cost"     :arc "2.3.3"   :guid "13b2c028-55ec-59a4-b274-c01ddddc33cf"
   :type :string :conformance :recommended :context :universal
   :description "Ongoing cost rate. Format: rate:currency:per-unit.")
  (:key "org.cispec.billing-model" :arc "2.3.4"   :guid "dbee024f-8cc0-52d6-b300-d1aac6b07372"
   :type :string :conformance :recommended :context :universal
   :description "Commercial billing structure.")
  (:key "org.cispec.depreciation"  :arc "2.3.5"   :guid "0e456549-e677-5ad3-8c7f-49210439cb48"
   :type :string :conformance :recommended :context :universal
   :description "Depreciation method:period.")
  (:key "org.cispec.contract-ref"  :arc "2.3.6"   :guid "bc197921-a7a6-5d33-90f2-763de7e0eaa3"
   :type :string :conformance :recommended :context :universal
   :description "Procurement vehicle pointer.")
  (:key "org.cispec.usage"         :arc "2.3.7"   :guid "c8c1a366-27f8-56fc-991c-0a4f2c9b383d"
   :type :string :conformance :recommended :context :universal
   :description "Quantity consumed. Format: quantity:unit.")
  (:key "org.cispec.vendor"        :arc "2.3.8"   :guid "b57413eb-ea61-5ce2-a9a9-274832e2eea0"
   :type :string :conformance :recommended :context :universal
   :description "Seller or servicer of the CI.")

  ;; ---- LIFECYCLE 42387.2.4.* ----
  (:key "org.cispec.version"       :arc "2.4"     :guid "abc91671-732c-5697-b1bb-98113d9313e2"
   :type :version :pattern "^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(-.*)?$"
   :core t :conformance :required :context :universal
   :description "Semver 2.0 version. Universal.")
  (:key "org.cispec.specversion"   :arc "2.4.1"   :guid "41319691-4383-59de-944f-28dc072ea408"
   :type :string :conformance :recommended :context :universal
   :description "Spec version labels were authored against.")
  (:key "org.cispec.environment"   :arc "2.4.2"   :guid "fb2fecdf-cbaf-5f0c-bd16-cffe882b9eb0"
   :type :string :conformance :recommended :context :universal
   :qualified-forms ("purdue-level:0" "purdue-level:1" "purdue-level:2"
                     "purdue-level:3" "purdue-level:4" "purdue-level:5")
   :description "Operational programme/zone/tier. Distinct from location and classification.")
  (:key "org.cispec.expiry"        :arc "2.4.3"   :guid "9714b5bf-3536-5fc9-a53a-b8f0cf1a65db"
   :type :iso-date :conformance :recommended :context :universal
   :description "Expiry/EOL date. ISO 8601.")
  (:key "org.cispec.acquired"      :arc "2.4.4"   :guid "b07863b7-ed3e-5f79-9160-67efc0ebfe86"
   :type :iso-date :conformance :recommended :context :universal
   :description "Acquisition/provisioning date. ISO 8601.")

  ;; ---- CUSTODY 42387.2.5.* ----
  (:key "org.cispec.custody-chain" :arc "2.5"     :guid "af7616e3-6c41-59af-947e-cd4af86b6d69"
   :type :reference-pointer :conformance :required :context (:evidence :pharma :defence)
   :recommended-for (:regulated-physical-assets)
   :description "Bare pointer to chronological custody record.")
  (:key "org.cispec.checksum"      :arc "2.5.1"   :guid "85cbd708-dcd0-5e36-8070-95f46ce00006"
   :type :digest-string :pattern "^[a-z0-9]+:[a-fA-F0-9]+$"
   :conformance :required :context (:evidence)
   :recommended-for (:software :hardware :ics :pharma)
   :description "Cryptographic hash at collection. algorithm:hexdigest.")

  ;; ---- HARDWARE CI-TYPE 42387.2.6.2.* ----
  (:key "org.cispec.asset-tag"     :arc "2.6.2.1" :guid "f5bc9f9b-9561-5f8d-811c-33e5ce0ade50"
   :type :string :conformance :recommended :context :universal
   :description "Org-assigned inventory control number.")
  (:key "org.cispec.serial-number" :arc "2.6.2.5" :guid "a7746230-ebc5-5ddf-830d-60250cbb8799"
   :type :string :conformance :recommended :context :universal
   :description "OEM-assigned serial. Globally unique within manufacturer.")
  (:key "org.cispec.manufacturer"  :arc "2.6.2.2" :guid "d957a085-ddfe-55e3-a34f-6e886194e470"
   :type :string :conformance :recommended :context :universal
   :description "OEM — who produces the CI.")
  (:key "org.cispec.make"          :arc "2.6.2.3" :guid "8a7106c6-dcca-5f76-b59d-7bd2f391bb75"
   :type :string :conformance :recommended :context :universal
   :description "Product line or brand.")
  (:key "org.cispec.model"         :arc "2.6.2.4" :guid "6ddca6e5-bb57-505c-b995-70a5b05ff783"
   :type :string :conformance :recommended :context :universal
   :description "Specific variant/SKU. Applies to hardware and AI/LLM models.")

  ;; ---- NETWORK CI-TYPE 42387.2.6.4.* ----
  (:key "org.cispec.net-type"      :arc "2.6.4.1" :guid "908d6b60-25a3-5e42-b8f6-626a86445abf"
   :type :slug :conformance :recommended :context (:network)
   :description "Network element type classification.")
  (:key "org.cispec.ip-address"    :arc "2.6.4.2" :guid "fd4da795-a1a7-5415-a850-6c4d42ef644e"
   :type :string :conformance :recommended :context (:network :iot)
   :description "Primary management/operational IP address.")
  (:key "org.cispec.mac-address"   :arc "2.6.4.3" :guid "025348b7-866f-57af-9f56-b8dbb4e5a43e"
   :type :string :pattern "^([0-9a-f]{2}:){5}[0-9a-f]{2}$"
   :conformance :recommended :context (:network :iot)
   :description "Hardware MAC. IEEE 802 colon-separated lower-case hex.")
  (:key "org.cispec.fqdn"          :arc "2.6.4.4" :guid "e39b64b6-6144-5939-9cc1-aa8a91fd796b"
   :type :string :conformance :recommended :context (:network :iot)
   :description "Fully-qualified domain name. DNS-resolvable.")

  ;; ---- EVIDENCE EXTENDED 42387.2.6.5.* ----
  (:key "org.cispec.case-id"           :arc "2.6.5.1" :guid "354202bb-76bc-5709-9310-7e54cc05f03e"
   :type :string :conformance :recommended :context (:evidence :legal)
   :description "Investigation or legal matter identifier.")
  (:key "org.cispec.collection-method" :arc "2.6.5.2" :guid "a97c5cfd-a9eb-5811-84b2-607d3e8abc10"
   :type :slug :conformance :recommended :context (:evidence)
   :description "How the CI was acquired/collected.")

  ;; ---- ACCESS/CREDENTIAL CI-TYPE 42387.2.6.6.* ----
  (:key "org.cispec.assurance-level"  :arc "2.6.6.1" :guid "b21848ce-8791-5472-a3c0-2bb4074ac050"
   :type :string :conformance :recommended :context (:access)
   :description "Identity/authentication assurance level. framework:level.")
  (:key "org.cispec.key-type"         :arc "2.6.6.2" :guid "936e9ec5-0d4b-5e02-bac2-4e6af6f3ab08"
   :type :slug :conformance :recommended :context (:access :crypto)
   :description "Key or credential type slug.")

  ;; ---- FACILITY CI-TYPE 42387.2.6.7.* ----
  (:key "org.cispec.facility-class"  :arc "2.6.7.1" :guid "62053022-2d93-5d38-ad74-62a22699c40f"
   :type :string :conformance :recommended :context (:facility)
   :description "Facility tier/class. framework:class.")
  (:key "org.cispec.capacity"        :arc "2.6.7.2" :guid "d2cfe509-b432-5f4d-844d-ae3c8df8c79c"
   :type :string :conformance :recommended :context (:facility)
   :description "Rated capacity. quantity:unit[:resource-type].")

  ;; ---- CONTRACT CI-TYPE 42387.2.6.8.* ----
  (:key "org.cispec.contract-type"  :arc "2.6.8.1" :guid "813f67e2-6932-584a-993d-3d64e6a80c78"
   :type :slug :conformance :recommended :context (:contract)
   :description "Contract category when the contract is the CI.")
  (:key "org.cispec.counterparty"   :arc "2.6.8.2" :guid "bfb13628-0034-501b-8404-f05df058bfbf"
   :type :string :conformance :recommended :context (:contract)
   :description "Other party to the agreement.")

  ;; ---- CRYPTO CI-TYPE 42387.2.6.9.* ----
  (:key "org.cispec.algorithm"  :arc "2.6.9.1" :guid "d7fc8fc7-41b8-5365-b370-983eb3ca6cd4"
   :type :string :conformance :recommended :context (:crypto)
   :description "Cryptographic algorithm.")
  (:key "org.cispec.key-length" :arc "2.6.9.2" :guid "cb348b85-ab41-5808-bf2e-6b3dd60a2706"
   :type :integer :conformance :recommended :context (:crypto)
   :description "Key bit length.")

  ;; ---- PHYSICAL 42387.2.7.* ----
  (:key "org.cispec.location"  :arc "2.7" :guid "1192ce5e-1a38-5939-b4c8-be1263cb37fc"
   :type :string :conformance :recommended :context :universal
   :description "Physical location. Distinct from environment (programme assignment).")

  ;; ---- GOVERNANCE/COMPLIANCE 42387.2.8.* ----
  (:key "org.cispec.classification" :arc "2.8"   :guid "ff8c27e8-562e-5b8d-a887-ebb1daeeb039"
   :type :string :conformance :recommended :context :universal
   :description "Regulatory/safety category. ts/sci, phi, pci-cde, dal:a, cui.")
  (:key "org.cispec.retention"      :arc "2.8.1" :guid "b87b96e5-f583-5c4e-8cfc-49b0bb9739a7"
   :type :reference-pointer :conformance :recommended :context :universal
   :description "Retention schedule pointer.")
  (:key "org.cispec.boundary"       :arc "2.8.2" :guid "1eaea5b2-5b84-5829-ae8b-850ec19d0ff0"
   :type :string :conformance :recommended :context :universal
   :description "Named authorization/control boundary.")
  (:key "org.cispec.exposure"       :arc "2.8.3" :guid "9aeb523a-c902-5fef-9398-709b424208ff"
   :type :enum :values (:public :restricted :private)
   :conformance :recommended :context :universal
   :description "Public accessibility posture.")
  ;; EXPERIMENTAL
  (:key "org.cispec.scan-policy"    :arc "2.8.4" :guid "14e4a997-48d2-5319-8308-7ab97eadf2d4"
   :type :string :experimental t :conformance :recommended :context :universal
   :description "EXPERIMENTAL. Scanning policy. included:authenticated etc.")
  (:key "org.cispec.config-baseline" :arc "2.8.5" :guid "fe80be18-0f77-57cd-b57d-29cc26688589"
   :type :reference-pointer :experimental t :conformance :recommended :context :universal
   :description "EXPERIMENTAL. Config baseline pointer. STIG, CIS Benchmark, or URI.")

  ;; ---- SERVICE MANAGEMENT 42387.2.9.* ----
  (:key "org.cispec.sla"        :arc "2.9"   :guid "78ee1d87-4cab-5636-a51d-60b9c45ee3f5"
   :type :string :conformance :recommended :context :universal
   :description "SLA/maintenance commitment pointer.")
  (:key "org.cispec.commonname" :arc "2.9.1" :guid "4b7c32ea-11f0-5afa-bac9-08ee71694c37"
   :type :string :conformance :recommended :context :universal
   :description "Human-readable name. X.509 CN lineage."))

 :type-definitions
 ((:type :slug           :pattern "^[a-z0-9][a-z0-9-]*[a-z0-9]$|^[a-z0-9]$")
  (:type :identity       :description "Email, GPG-key-ID@domain, or role:identity.")
  (:type :version        :pattern "^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(-.*)?$")
  (:type :oid-string     :description "OID in dotted-decimal or iso.* form.")
  (:type :duns-string    :pattern "^iso\\.org\\.duns\\.[0-9]{9}$")
  (:type :digest-string  :pattern "^[a-z0-9]+:[a-fA-F0-9]+$")
  (:type :reference-pointer :description "Bare reference: case ID, hash, or URI.")
  (:type :iso-date       :pattern "^[0-9]{4}-[0-9]{2}-[0-9]{2}(T.*)?$")
  (:type :string         :description "Non-empty string.")
  (:type :integer        :description "Positive integer.")
  (:type :enum           :description "Enumerated values per :values list.")))
