FROM ghcr.io/puppeteer/puppeteer:19.2.0

ENV PPTR_VERSION=19.2.0 \
    PATH="/home/pptruser/tools:${PATH}"

COPY tools tools

RUN mkdir screenshots
