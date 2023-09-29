FROM alpine:3.15 AS downloader

ARG TEMPLATE_REPO="https://gitlab.com/andreyfree2020/web-sites.git"

RUN apk add git \
    && git clone ${TEMPLATE_REPO} /tmp

FROM nginx:1.23

ARG TEMPLATE_NAME="coffee-shop-html-template"

COPY --from=downloader /tmp/${TEMPLATE_NAME} /usr/share/nginx/html

