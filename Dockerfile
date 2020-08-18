FROM node:alpine3.11

RUN apk add --no-cache git yarn

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

RUN git clone https://github.com/wladich/nakarte
RUN cp /app/nakarte/src/secrets.js.template /app/nakarte/src/secrets.js

RUN set -ex && (cd /app/nakarte && yarn)

ENTRYPOINT /app/entrypoint.sh