{ lib, stdenv, fetchgit, cosmopolitan }:

stdenv.mkDerivation rec {
  pname = "xrsh";
  version = "0.2";

  src = cosmopolitan.src;

  inherit (cosmopolitan) nativeBuildInputs buildInputs patches strictDeps cosmocc;

  outputs = ["out"];

#  xrsh = fetchzip {
#    url = "https://codeberg.org/xrsh/xrsh/archive/24e117f5125e4b2ecd7432baf6fdd5f60e6b3a70.tar.gz";
#    sha256 = "1x0h5krz90y8ngrzgbpjd6xdr171y54p3lqwyirq8j6ilzlq5d5i";
#  };
#
#  xrshcom = fetchzip {
#    url = "https://codeberg.org/xrsh/xrsh-com/archive/c668a8ba8f65c3d36e3a4da5ea8b87af5eb6091c.tar.gz";
#    sha256 = "0mpl7h4fxg5i4lxw5447pqr12rsffcf24xdrqwqzr1zzpkdkslks";
#  };

  xrsh = fetchgit {
    url = "https://codeberg.org/xrsh/xrsh";
    rev = "4330037206add994093c46eb5443fffd6f6221ce";
    hash = "sha256-igvhSR+n25iHfgHBUniStdVANtrIVHmKpY3LCEIYsx4=";
    fetchSubmodules = true;
  };

  buildFlags = cosmopolitan.buildFlags ++ [ "o//tool/net/redbean.com" ];

  #buildPhase = '' 
  #  make o//tool/net/redbean.com
  #'';

  dontUnpack = false;
  dontBuild = false;
  dontFixup = true; # essential, otherwise cosmopolitcan libc exec-header gets corrupted
  
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin

    set -x
    cp o/tool/net/redbean.com $out/bin/xrsh.com
    chmod +x $out/bin/xrsh.com 
  
    cd $xrsh
    ./make standalone $out/bin/xrsh.com

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
