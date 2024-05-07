FROM ghcr.io/puppeteer/puppeteer:22.8.0

ENV APPLICATION_USER=pptruser \
    APPLICATION_GROUP=pptruser \
    PPTR_VERSION=22.8.0 \
    PATH="/home/pptruser/tools:${PATH}"

COPY tools tools

RUN mkdir screenshots
