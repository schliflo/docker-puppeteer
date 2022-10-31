#!/bin/bash

yarn --frozen-lockfile
PPTR_VERSION=$(node -e "console.log(require('./node_modules/puppeteer/package.json')['version'])")

sed -e "s/<PPTR_VERSION>/$PPTR_VERSION/" Dockerfile.template > Dockerfile
