#!/bin/sh
REDBEAN_VERSION=https://redbean.dev/redbean-2.2.com
APP=xrsh
DIR=$(dirname $(readlink -f $0))

export PATH=$PATH:.
silent(){ "$@" 1>/dev/null 2>/dev/null; }

install(){
  echo "[v] checking dependencies "
  test -f ${APP}.com || {
    wget "$REDBEAN_VERSION" -O ${APP}.com
    chmod +x ${APP}.com
  }
}

standalone(){
  rm ${APP}.com || true
  test -f ${APP}.com || install
  set -x
  zip -x "*.git*" -r ${APP}.com index.html LICENSE src/index.{html,css} src/assets src/com/*.js src/com/isoterminal/{xrsh.iso,libv86.js,bios,v86.wasm}
  sha256sum ${APP}.com > ${APP}.txt
  ls -lah ${APP}.com
}

dev(){
  cd "$DIR"
  test -f xrsh.com || standalone
  test -f /tmp/cert.pem || openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout /tmp/key.pem -out /tmp/cert.pem
  ./xrsh.com -c 0 -C /tmp/cert.pem -K /tmp/key.pem -D . "$@"
}

test -z $1 && install
test -z $1 || "$@"
