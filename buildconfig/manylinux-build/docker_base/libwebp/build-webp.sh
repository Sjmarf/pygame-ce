#!/bin/bash
set -e -x

cd $(dirname `readlink -f "$0"`)

WEBP=libwebp-1.3.2

curl -sL --retry 10 http://storage.googleapis.com/downloads.webmproject.org/releases/webp/${WEBP}.tar.gz > ${WEBP}.tar.gz
sha512sum -c webp.sha512

tar xzf ${WEBP}.tar.gz
cd $WEBP

./configure $PG_BASE_CONFIGURE_FLAGS
make
make install
