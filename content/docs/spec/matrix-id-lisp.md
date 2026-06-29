---
title: "matrix-id.lisp — Canonical SBCL Reference Module"
description: "SBCL Common Lisp reference implementation for embedding org.cispec attribution strings in compiled images."
date: 2026-06-29
draft: false
---

# matrix-id.lisp

SBCL Common Lisp reference module. Load before compiling your system to embed
`org.cispec.*` attribution strings in the compiled image. The strings are
defined as `defconstant` forms and survive `save-lisp-and-die` dumps.

## Source

```lisp
;;;; SPDX-License-Identifier: BSD-2-Clause
;;;;
;;;; matrix-id.lisp — org.cispec Change Item attribution module
;;;; Canonical source: https://cispec.org/spec/matrix-id.lisp
;;;; Spec version: 1.0
;;;;
;;;; Embeds org.cispec.* attribution strings into a compiled SBCL image
;;;; as defconstant forms. Strings survive save-lisp-and-die dumps and
;;;; are present in the compiled fasl.
;;;;
;;;; Usage: load before compiling your system, or add to your .asd file
;;;; as a component with :depends-on ("matrix-id").
;;;;
;;;; Required parameters — set via environment or redefine before loading:
;;;;   CISPEC_ORGANIZATION
;;;;   CISPEC_ORGUNIT
;;;;   CISPEC_APPLICATION
;;;;   CISPEC_VERSION

(defpackage #:org.cispec.matrix-id
  (:use #:cl)
  (:export
   #:+organization+
   #:+orgunit+
   #:+owner+
   #:+oid+
   #:+duns+
   #:+customer+
   #:+costcenter+
   #:+application+
   #:+role+
   #:+version+
   #:+environment+
   #:+specversion+
   #:label-set
   #:verify-required))

(in-package #:org.cispec.matrix-id)

;;; ----------------------------------------------------------------
;;; Helper — read from environment with fallback
;;; ----------------------------------------------------------------

(defun env-or (var default)
  "Return the value of environment variable VAR, or DEFAULT if unset or empty."
  (let ((val (uiop:getenv var)))
    (if (and val (plusp (length val))) val default)))

;;; ----------------------------------------------------------------
;;; Required attribution constants
;;; ----------------------------------------------------------------

(defconstant +organization+
  (env-or "CISPEC_ORGANIZATION" "")
  "org.cispec.organization — owning organisation slug.")

(defconstant +orgunit+
  (env-or "CISPEC_ORGUNIT" "")
  "org.cispec.orgunit — organisational unit slug.")

(defconstant +application+
  (env-or "CISPEC_APPLICATION" "")
  "org.cispec.application — application or service name.")

(defconstant +version+
  (env-or "CISPEC_VERSION" "")
  "org.cispec.version — semver 2.0 version string.")

;;; ----------------------------------------------------------------
;;; Optional attribution constants
;;; ----------------------------------------------------------------

(defconstant +owner+
  (env-or "CISPEC_OWNER" "")
  "org.cispec.owner — identity contact (key fingerprint or handle).")

(defconstant +oid+
  (env-or "CISPEC_OID" "iso.org.dod.internet.42387")
  "org.cispec.oid — IANA OID arc.")

(defconstant +duns+
  (env-or "CISPEC_DUNS" "")
  "org.cispec.duns — D&B DUNS in OID notation.")

(defconstant +customer+
  (env-or "CISPEC_CUSTOMER" "")
  "org.cispec.customer — customer identifier.")

(defconstant +costcenter+
  (env-or "CISPEC_COSTCENTER" "")
  "org.cispec.costcenter — cost centre identifier.")

(defconstant +role+
  (env-or "CISPEC_ROLE" "")
  "org.cispec.role — functional role slug.")

(defconstant +environment+
  (env-or "CISPEC_ENVIRONMENT" "")
  "org.cispec.environment — deployment environment slug.")

(defconstant +specversion+
  "1.0"
  "org.cispec spec version this module implements.")

;;; ----------------------------------------------------------------
;;; Label set — returns an alist of all non-empty key/value pairs
;;; ----------------------------------------------------------------

(defun label-set ()
  "Return an alist of (key . value) pairs for all non-empty org.cispec labels."
  (remove-if (lambda (pair) (string= "" (cdr pair)))
             (list (cons "org.cispec.organization"  +organization+)
                   (cons "org.cispec.orgunit"       +orgunit+)
                   (cons "org.cispec.application"   +application+)
                   (cons "org.cispec.version"       +version+)
                   (cons "org.cispec.owner"         +owner+)
                   (cons "org.cispec.oid"           +oid+)
                   (cons "org.cispec.duns"          +duns+)
                   (cons "org.cispec.customer"      +customer+)
                   (cons "org.cispec.costcenter"    +costcenter+)
                   (cons "org.cispec.role"          +role+)
                   (cons "org.cispec.environment"   +environment+)
                   (cons "org.cispec.specversion"   +specversion+))))

;;; ----------------------------------------------------------------
;;; Verify required keys are populated
;;; ----------------------------------------------------------------

(defun verify-required ()
  "Signal an error if any required org.cispec key is empty.
   Call at load time to catch misconfigured builds early."
  (let ((required '((+organization+ . "org.cispec.organization")
                    (+orgunit+      . "org.cispec.orgunit")
                    (+application+  . "org.cispec.application")
                    (+version+      . "org.cispec.version"))))
    (dolist (pair required)
      (when (string= "" (symbol-value (car pair)))
        (error "org.cispec: required label ~A is empty; ~
                set environment variable ~:*~A before loading."
               (cdr pair)))))
  t)
```

## Usage in an ASDF system

Add `matrix-id` as a dependency in your `.asd` file:

```lisp
(asdf:defsystem "my-system"
  :depends-on ("org.cispec.matrix-id")
  :components ((:file "main")))
```

Call `(org.cispec.matrix-id:verify-required)` early in your build script
or entry-point to catch missing attribution before shipping.

## Printing the label set

```lisp
(dolist (pair (org.cispec.matrix-id:label-set))
  (format t "~A=~A~%" (car pair) (cdr pair)))
```

Output (example):

```
org.cispec.organization=daplanet
org.cispec.orgunit=dps
org.cispec.application=my-tool
org.cispec.version=1.0.0
org.cispec.oid=iso.org.dod.internet.42387
org.cispec.specversion=1.0
```

## Licence

BSD-2-Clause. SPDX-License-Identifier: `BSD-2-Clause`.  
Canonical source: `https://cispec.org/spec/matrix-id.lisp`
