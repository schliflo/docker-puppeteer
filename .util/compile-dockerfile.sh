#!/bin/bash

yarn --frozen-lockfile
PPTR_VERSION=$(node -e "console.log(require('./node_modules/puppeteer/package.json')['version'])")
CHROME_REVISION=$(node .util/revision.js chromium)

sed -e "s/<PPTR_VERSION>/$PPTR_VERSION/" -e "s/<CHROME_REVISION>/$CHROME_REVISION/" Dockerfile.template > Dockerfile
