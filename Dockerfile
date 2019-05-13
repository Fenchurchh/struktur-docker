FROM node:11.1.0-alpine

LABEL maintainer="Mirko Friedrich <mirko@uioo.io>" \
      org.label-schema.vendor="struktur" \
      org.label-schema.name="struktur Docker image" \
      org.label-schema.description="struktur containerized" \
      org.label-schema.url="https://struktur.online" \
      org.label-schema.vcs-url="https://github.com/struktur/struktur-docker" \
      org.label-schema.version=latest \
      org.label-schema.schema-version="1.0"

WORKDIR /usr/src/api

RUN echo "unsafe-perm = true" >> ~/.npmrc

RUN npm install -g strapi@alpha@3.0.0-alpha.26.2

COPY strapi.sh ./
RUN chmod +x ./strapi.sh

EXPOSE 1337

COPY healthcheck.js ./
HEALTHCHECK --interval=15s --timeout=5s --start-period=30s \
      CMD node /usr/src/api/healthcheck.js

CMD ["./strapi.sh"]
