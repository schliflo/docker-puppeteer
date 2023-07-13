FROM ghcr.io/puppeteer/puppeteer:20.8.1

ENV APPLICATION_USER=pptruser \
    APPLICATION_GROUP=pptruser \
    PPTR_VERSION=20.8.1 \
    PATH="/home/pptruser/tools:${PATH}"

COPY tools tools

RUN mkdir screenshots
