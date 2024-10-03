#!/bin/sh
REDBEAN_VERSION=https://redbean.dev/redbean-3.0.0.com
APP=xrsh
DIR=$(dirname $(readlink -f $0))

export PATH=$PATH:.
silent(){ "$@" 1>/dev/null 2>/dev/null; }

deps(){ # check dependencies
  echo "[v] checking dependencies "
  test -f ${APP}.com || {
    wget "$REDBEAN_VERSION" -O ${APP}.com
    chmod +x ${APP}.com
  }
}

standalone(){ # build standalone xrsh.com binary
  rm ${APP}.com || true
  deps
  #cp index.html /tmp/index.html
  #sed -i 's|isoterminal=".*"|isoterminal="iso: ./../xrsh.iso"|g' index.html
  zip -x "*.git*" -r ${APP}.com index.html xrsh.iso .args LICENSE src/index.{html,css} src/assets src/com/*.js src/com/isoterminal/{libv86.js,bios,v86.wasm,feat,core.js}
  #cp /tmp/index.html index.html
  sha256sum ${APP}.com > ${APP}.txt
  ls -lah ${APP}.com
}

dev(){ # start dev http server
  cd "$DIR"
  test -f xrsh.com || standalone
  test -f /tmp/cert.pem || openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout /tmp/key.pem -out /tmp/cert.pem
  ./xrsh.com -c 0 -C /tmp/cert.pem -K /tmp/key.pem -D . "$@"
}

shell(){ # run xrsh shell via docker
  OCI=$(which podman || which docker)
  set -x
  $OCI rm -f xrsh || true
  $OCI run --name xrsh -d \
    -v ./src/com/isoterminal/mnt:/mnt busybox:1.31.1-musl tail -f /dev/null
  $OCI exec -it xrsh /bin/sh -i -c 'ln -s /mnt/profile /etc/profile && sh --login'
}

recordings(){ # compile vhs recordings
  export PATH=$PATH:src/com/isoterminal/mnt
  export BROWSER=0
  test -z $1 && find src/tests/vhs/* | xargs -n1 vhs 
  test -z $1 || vhs $1
}

usage(){
  echo "Usage:"
  awk '/\(\){ #/ { gsub(/\(\){ #/," <----",$0); print "  ./make "$0 }' $0 
}

test -z $1 && usage
test -z $1 || "$@"
