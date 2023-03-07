FROM ghcr.io/puppeteer/puppeteer:19.7.3

ENV APPLICATION_USER=pptruser \
    APPLICATION_GROUP=pptruser \
    PPTR_VERSION=19.7.3 \
    PATH="/home/pptruser/tools:${PATH}"

COPY tools tools

RUN mkdir screenshots
