;;;; SPDX-License-Identifier: BSD-2-Clause
;;;;
;;;; cispec.sexp — S-expression schema for the org.cispec
;;;; Change Item attribution namespace.
;;;;
;;;; Canonical governance: https://cispec.org/
;;;; Validation toolkit:   https://cimatrix.org/
;;;; IANA PEN:             42387
;;;; Spec version:         1.0
;;;;
;;;; This schema is the native format for the dps-meta/cimatrix Lisp
;;;; toolchain. It is both machine-readable (loadable by READ) and
;;;; human-readable without compilation. Validators consuming this
;;;; schema can load it directly:
;;;;
;;;;   (let ((schema (with-open-file (f "cispec.sexp") (read f))))
;;;;     (cimatrix:validate label-set schema))
;;;;
;;;; Schema structure:
;;;;   A plist whose keys are schema-level properties:
;;;;     :version     — spec version this schema targets
;;;;     :terms       — list of term definitions
;;;;     :required    — keys required for Declared conformance
;;;;     :conformance — conformance level definitions
;;;;
;;;; Each term definition is a plist:
;;;;     :key         — the full org.cispec.* key name (string)
;;;;     :doc-oid     — document identifier OID
;;;;     :doc-guid    — document identifier UUIDv5
;;;;     :type        — value type (:slug :identity :version :oid-string
;;;;                                :duns-string :digest-string
;;;;                                :reference-pointer :string)
;;;;     :pattern     — optional regex pattern (PCRE string)
;;;;     :conformance — :required :recommended or :optional
;;;;     :context     — list of CI types this term applies to,
;;;;                    or :universal for all CI types
;;;;     :description — short description string

(:schema
 :version "1.0"
 :namespace "org.cispec"
 :governance "https://cispec.org/"
 :validation "https://cimatrix.org/"
 :iana-pen 42387
 :spdx "BSD-2-Clause"

 :terms
 (;; ----------------------------------------------------------------
  ;; Identity category — 42387.2.1.*
  ;; X.500/X.520 O/OU lineage (RFC 4514)
  ;; ----------------------------------------------------------------

  (:key "org.cispec.organization"
   :doc-oid  "1.3.6.1.4.1.42387.2.1"
   :doc-guid "8ef717a5-d8c0-512d-8cc5-9d62cea811ca"
   :type :slug
   :pattern "^[a-z0-9][a-z0-9-]*[a-z0-9]$|^[a-z0-9]$"
   :conformance :required
   :context :universal
   :description "Owning organisation slug. X.500/X.520 organizationName (O).")

  (:key "org.cispec.orgunit"
   :doc-oid  "1.3.6.1.4.1.42387.2.1.1"
   :doc-guid "8da4c483-9e88-5831-8c1d-e3b2d584794e"
   :type :slug
   :pattern "^[a-z0-9][a-z0-9-]*[a-z0-9]$|^[a-z0-9]$"
   :conformance :required
   :context :universal
   :description "Organisational unit slug. X.500/X.520 organizationalUnitName (OU).")

  (:key "org.cispec.owner"
   :doc-oid  "1.3.6.1.4.1.42387.2.1.2"
   :doc-guid "54cfcb4f-03f8-548e-80e7-75aea99c3580"
   :type :identity
   :conformance :required
   :context :universal
   :examples ("denzuko@dapla.net"
               "FC13F74B@dapla.net"
               "shift-supervisor:j.martinez@example.org")
   :description "Accountable individual or role. Bare email, GPG-key-ID@domain, or role:identity.")

  ;; ----------------------------------------------------------------
  ;; Registry category — 42387.2.2.*
  ;; ----------------------------------------------------------------

  (:key "org.cispec.oid"
   :doc-oid  "1.3.6.1.4.1.42387.2.2"
   :doc-guid "c79d496e-04f0-559c-9e88-63109933cddb"
   :type :oid-string
   :conformance :recommended
   :context :universal
   :description "Relational pointer to the CLIENT's own OID arc. Not DPS's 42387 arc.")

  (:key "org.cispec.duns"
   :doc-oid  "1.3.6.1.4.1.42387.2.2.1"
   :doc-guid "706730f3-ac1d-573b-94ae-b717305e4a35"
   :type :duns-string
   :pattern "^iso\\.org\\.duns\\.[0-9]{9}$"
   :conformance :optional
   :context :universal
   :description "D&B DUNS in OID notation: iso.org.duns.<9-digit-number>. Externally verifiable.")

  ;; ----------------------------------------------------------------
  ;; Financial category — 42387.2.3.*
  ;; ----------------------------------------------------------------

  (:key "org.cispec.customer"
   :doc-oid  "1.3.6.1.4.1.42387.2.3"
   :doc-guid "748000b4-ea01-58ab-9613-a73aa5658fda"
   :type :string
   :conformance :optional
   :context :universal
   :description "Customer identifier in the owning organisation's billing scheme.")

  (:key "org.cispec.costcenter"
   :doc-oid  "1.3.6.1.4.1.42387.2.3.1"
   :doc-guid "c7fe2951-e8c2-5ce0-adb9-3e941db9ac8b"
   :type :string
   :conformance :optional
   :context :universal
   :description "Cost centre identifier in the owning organisation's accounting scheme.")

  ;; ----------------------------------------------------------------
  ;; Lifecycle category — 42387.2.4.*
  ;; ----------------------------------------------------------------

  (:key "org.cispec.version"
   :doc-oid  "1.3.6.1.4.1.42387.2.4"
   :doc-guid "abc91671-732c-5697-b1bb-98113d9313e2"
   :type :version
   :pattern "^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(-.*)?$"
   :conformance :required
   :context :universal
   :description "Semver 2.0 version. Universal — software, firmware, document, policy.")

  (:key "org.cispec.specversion"
   :doc-oid  "1.3.6.1.4.1.42387.2.4.1"
   :doc-guid "41319691-4383-59de-944f-28dc072ea408"
   :type :string
   :conformance :recommended
   :context :universal
   :description "Spec version labels were authored against.")

  (:key "org.cispec.environment"
   :doc-oid  "1.3.6.1.4.1.42387.2.4.2"
   :doc-guid "fb2fecdf-cbaf-5f0c-bd16-cffe882b9eb0"
   :type :string
   :conformance :recommended
   :context :universal
   :qualified-forms ("purdue-level:0" "purdue-level:1" "purdue-level:2"
                     "purdue-level:3" "purdue-level:4" "purdue-level:5")
   :description "Deployment/operational environment. Bare slug or purdue-level:<n> for ICS.")

  ;; ----------------------------------------------------------------
  ;; Custody category — 42387.2.5.*
  ;; Evidence CI type
  ;; ----------------------------------------------------------------

  (:key "org.cispec.custody-chain"
   :doc-oid  "1.3.6.1.4.1.42387.2.5"
   :doc-guid "af7616e3-6c41-59af-947e-cd4af86b6d69"
   :type :reference-pointer
   :conformance :required
   :context (:evidence)
   :description "Bare pointer to the chronological custody record. Not the record itself.")

  (:key "org.cispec.checksum"
   :doc-oid  "1.3.6.1.4.1.42387.2.5.1"
   :doc-guid "85cbd708-dcd0-5e36-8070-95f46ce00006"
   :type :digest-string
   :pattern "^[a-z0-9]+:[a-fA-F0-9]+$"
   :conformance :required
   :context (:evidence)
   :recommended-for (:software :hardware :ics)
   :description "Cryptographic hash: algorithm:hexdigest. REQUIRED for evidence CIs at collection time.")

  ;; ----------------------------------------------------------------
  ;; CI-type extension keys — 42387.2.6.*
  ;; Software: 42387.2.6.1.*
  ;; ----------------------------------------------------------------

  (:key "org.cispec.application"
   :doc-oid  "1.3.6.1.4.1.42387.2.6.1.1"
   :doc-guid "3d021461-8d8b-5428-959a-eef4e7a3cd4d"
   :type :string
   :conformance :required
   :context (:software)
   :description "Application or service name.")

  (:key "org.cispec.role"
   :doc-oid  "1.3.6.1.4.1.42387.2.6.1.2"
   :doc-guid "5bedd70b-5466-578d-a7b9-0e25d5017287"
   :type :slug
   :pattern "^[a-z0-9][a-z0-9-]*[a-z0-9]$|^[a-z0-9]$"
   :conformance :recommended
   :context (:software)
   :description "Functional role slug."))

 ;; ----------------------------------------------------------------
 ;; Required keys for Declared conformance (any CI type)
 ;; ----------------------------------------------------------------

 :required
 ("org.cispec.organization"
  "org.cispec.orgunit"
  "org.cispec.owner"
  "org.cispec.version")

 ;; ----------------------------------------------------------------
 ;; Conformance level definitions
 ;; ----------------------------------------------------------------

 :conformance
 ((:level :declared
   :description "Required core keys present and well-formed. Self-asserted.")
  (:level :verified
   :description "Mechanically verified by cimatrix. Terms resolve at public TLS domain.")
  (:level :attested
   :description "SLSA provenance attestation exists and has been verified."))

 ;; ----------------------------------------------------------------
 ;; Value type primitives (referenced by :type above)
 ;; ----------------------------------------------------------------

 :type-definitions
 ((:type :slug
   :description "Lower-case alphanumeric slug with hyphens; no leading or trailing hyphen."
   :pattern "^[a-z0-9][a-z0-9-]*[a-z0-9]$|^[a-z0-9]$")
  (:type :identity
   :description "Email address, GPG-key-ID@domain, or role:identity colon-qualified form.")
  (:type :version
   :description "Semver 2.0 version string.")
  (:type :oid-string
   :description "OID in dotted-decimal or iso.* human-readable form.")
  (:type :duns-string
   :description "D&B DUNS in OID notation: iso.org.duns.<9-digit-number>."
   :pattern "^iso\\.org\\.duns\\.[0-9]{9}$")
  (:type :digest-string
   :description "Cryptographic digest: algorithm-name:hex-digest, colon-separated."
   :pattern "^[a-z0-9]+:[a-fA-F0-9]+$")
  (:type :reference-pointer
   :description "Bare reference: case ID, hash, or URI an external system resolves.")
  (:type :string
   :description "Unconstrained non-empty string.")))
