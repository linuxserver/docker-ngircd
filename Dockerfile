FROM ghcr.io/linuxserver/baseimage-alpine:3.13

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="anoma"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	ngircd \
	ngircd-doc

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 6667
VOLUME ["/config"]
