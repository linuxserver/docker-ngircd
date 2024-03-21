# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.19

# set version label
ARG BUILD_DATE
ARG VERSION
ARG NGIRCD_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="anoma"

RUN \
  echo "**** install packages ****" && \
  if [ -z ${NGIRCD_RELEASE+x} ]; then \
    NGIRCD_RELEASE=$(curl -sL "http://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/APKINDEX.tar.gz" | tar -xz -C /tmp \
    && awk '/^P:ngircd$/,/V:/' /tmp/APKINDEX | sed -n 2p | sed 's/^V://'); \
  fi && \
  apk add --no-cache \
    ngircd==${NGIRCD_RELEASE} \
    ngircd-doc==${NGIRCD_RELEASE} && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 6667

VOLUME /config
