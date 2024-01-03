#!/bin/sh
REDBEAN_VERSION=https://redbean.dev/redbean-2.2.com
APP=xrsh

export PATH=$PATH:.
silent(){ "$@" 1>/dev/null 2>/dev/null; }

install(){
  echo "[v] checking dependencies "
  test -f ${APP}.com || {
    wget "$REDBEAN_VERSION" -O ${APP}.com
    chmod +x ${APP}.com
  }
  standalone
}

standalone(){
  test -f ${APP}.com || install
  cd src
  set -x
  zip -r ../${APP}.com *
  ls -lah ../${APP}.com
}

dev(){
  test -d xrsh-apps || git clone https://forgejo.isvery.ninja/xrsh/xrsh-apps
  cd src
  ln -s ../xrsh-apps/app .
  ln -s ../xrsh-apps/com .
  cd -
  cd /tmp
  test -f redbean.com || wget "$REDBEAN_VERSION" -O redbean.com && chmod 755 redbean.com
  test -f cert.pem    || openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
  cd -
  cd "$dir"
  /tmp/redbean.com -c 0 -C /tmp/cert.pem -K /tmp/key.pem -D src "$@"
}

test -z $1 && install
test -z $1 || "$@"
