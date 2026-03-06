FROM httpd:alpine
LABEL \
    org.opencontainers.image.title="Httpd webdav" \
    org.opencontainers.image.vendor="Ubuntu build system" \
    org.opencontainers.image.licenses="Apache" \
    org.opencontainers.image.created="2026-03-03" \
    maintainer="slackman.cn"


# Install build base
WORKDIR /build
COPY dist/* build-system.sh ./

RUN \
  apk add --upgrade --update-cache curl apr-util && \
  mkdir -p /var/www/html && \
  mkdir -p /var/www/conf && \
  bash build-system.sh && \
  # clean up
  apk del curl;


EXPOSE 80
