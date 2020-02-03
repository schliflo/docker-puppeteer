FROM node:12-slim

ENV APPLICATION_USER=pptruser \
    APPLICATION_GROUP=pptruser \
    NODE_PATH="/usr/local/share/.config/yarn/global/node_modules:${NODE_PATH}" \
    PATH="/tools:${PATH}" \
    LANG="C.UTF-8"

RUN apt-get update \
    && apt-get install -yq \
        gconf-service \
        libasound2 \
        libatk1.0-0 \
        libc6 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libgcc1 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libglib2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libstdc++6 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        fonts-ipafont-gothic \
        fonts-wqy-zenhei \
        fonts-thai-tlwg \
        fonts-kacst \
        ttf-freefont \
        ca-certificates \
        fonts-liberation \
        libappindicator1 \
        libnss3 \
        lsb-release \
        xdg-utils \
        wget \
    && wget https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64.deb \
    && dpkg -i dumb-init_*.deb \
    && rm -f dumb-init_*.deb \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -r $APPLICATION_GROUP \
    && useradd -r -g $APPLICATION_USER -G audio,video $APPLICATION_GROUP \
    && mkdir -p /home/pptruser/Downloads \
    && mkdir -p /usr/local/share/.config/yarn/global/node_modules \
    && mkdir -p /screenshots \
    && mkdir -p /app \
    && mkdir -p /tools \
    && chown -R $APPLICATION_USER:$APPLICATION_GROUP /home/pptruser \
    && chown -R $APPLICATION_USER:$APPLICATION_GROUP /usr/local/share/.config/yarn/global/node_modules \
    && chown -R $APPLICATION_USER:$APPLICATION_GROUP /screenshots \
    && chown -R $APPLICATION_USER:$APPLICATION_GROUP /app
    && chown -R $APPLICATION_USER:$APPLICATION_GROUP /tools

COPY --chown=$APPLICATION_USER:$APPLICATION_GROUP ./tools /tools

ENV PPTR_VERSION=2.1.0

RUN yarn global add \
    puppeteer@$PPTR_VERSION \
    && yarn cache clean \
    && fix_permissions

WORKDIR /app

USER pptruser

ENTRYPOINT ["dumb-init", "--"]

CMD ["node", "index.js"]
