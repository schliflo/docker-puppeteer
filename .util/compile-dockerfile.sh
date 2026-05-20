#!/bin/bash
set -euo pipefail

PPTR_VERSION=$(awk '/^puppeteer@/{getline; gsub(/"/, "", $2); print $2; exit}' yarn.lock)

if [ -z "$PPTR_VERSION" ]; then
  echo "ERROR: could not determine puppeteer version from yarn.lock" >&2
  exit 1
fi

sed -e "s/<PPTR_VERSION>/$PPTR_VERSION/" Dockerfile.template > Dockerfile
