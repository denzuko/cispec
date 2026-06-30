#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause
# cispec.org — pinned Hugo extended build for Cloudflare Pages.
# CF Pages framework presets do not reliably select the extended binary;
# this script downloads and pins it explicitly.
set -eu

HUGO_VERSION="0.146.0"
HUGO_TARBALL="hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_TARBALL}"

echo "Fetching Hugo ${HUGO_VERSION} extended..."
curl -sL "${HUGO_URL}" -o /tmp/hugo.tar.gz
tar -xzf /tmp/hugo.tar.gz -C /tmp hugo
chmod +x /tmp/hugo

/tmp/hugo version
/tmp/hugo --minify --baseURL "https://cispec.org/"
