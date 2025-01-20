{ stdenv, fetchurl, fetchzip, lib, zip }:

stdenv.mkDerivation rec {
  pname = "xrsh";
  version = "0.0.13";

  redbean = fetchurl {
    url = "https://redbean.dev/redbean-2.2.com";
    hash = "sha256-24/HzFp3A7fMuDCjZutp5yj8eJL9PswJPAidg3qluRs=";
  };

  xrsh = fetchzip {
    url = "https://codeberg.org/xrsh/xrsh/archive/24e117f5125e4b2ecd7432baf6fdd5f60e6b3a70.tar.gz";
    sha256 = "1x0h5krz90y8ngrzgbpjd6xdr171y54p3lqwyirq8j6ilzlq5d5i";
  };

  xrshcom = fetchzip {
    url = "https://codeberg.org/xrsh/xrsh-com/archive/c668a8ba8f65c3d36e3a4da5ea8b87af5eb6091c.tar.gz";
    sha256 = "0mpl7h4fxg5i4lxw5447pqr12rsffcf24xdrqwqzr1zzpkdkslks";
  };

  buildInputs = [ zip ];

  dontUnpack = true;

  dontBuild = true;

  dontFixup = true; # essential, otherwise cosmopolitcan libc exec-header gets corrupted

  installPhase = ''
    install -D $redbean $out/bin/xrsh.com
    chmod +x $out/bin/xrsh.com
    
    cd $xrsh
    zip -x "*.git*" -r $out/bin/xrsh.com index.html src/index.{html,css} LICENSE src/assets 

    # add components
    mkdir /tmp/src 
    cp -r $xrshcom/* /tmp/src/.
    cd /tmp
    zip -x "*.git*" -r $out/bin/xrsh.com src/com/*.js src/com/isoterminal/{xrsh.iso,libv86.js,bios,v86.wasm}
  '';

  meta = with lib; {
    description = "XR shell which runs a linux ISO in WebXR";
    license = "MPL";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    homepage = "https://xrsh.isvery.ninja";
    maintainers = with maintainers; [ coderofsalvation ];
    platforms = [ "i686-linux" "x86_64-linux" "x86_64-windows" "i686-windows" "x86_64-darwin" ];
  };
}

