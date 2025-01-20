{ lib, stdenv, fetchgit, cosmopolitan, zip, bash }:

stdenv.mkDerivation rec {
  pname = "xrsh";
  version = "0.142";

  src = cosmopolitan.src;

  inherit (cosmopolitan) buildInputs patches strictDeps cosmocc;

  nativeBuildInputs = [ zip bash ] ++ cosmopolitan.nativeBuildInputs; # expose zip during build (./make needs it)

  outputs = ["out"];

  xrsh = fetchgit {
    url = "https://codeberg.org/xrsh/xrsh";
    rev = "2a98ab1027de6f23f007a1c793784ca5200a0022";
    hash = "sha256-ARs6cIBXHyDEooYV4Xsdn201whuPxJTwof81Z8zr4NU=";
    fetchSubmodules = true;
  };

  buildFlags = cosmopolitan.buildFlags ++ [ "o//tool/net/redbean.com" ];

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
    find
    bash ./make standalone $out/bin/xrsh.com

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
