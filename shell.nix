#let 
#  pkgs = import (builtins.fetchGit {
#      name = "nixos-23.05";
#    url = "https://github.com/nixos/nixpkgs/";
#    ref = "refs/heads/nixos-unstable";
#    rev = "ef99fa5c5ed624460217c31ac4271cfb5cb2502c";
#  }) {};
{ pkgs ? import <nixpkgs> {} }:

  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs.buildPackages; [ 

      nodejs_20
      cosmopolitan
      zip
      vhs
      ffmpeg_6-full

    ];

    shellHook =
      ''
        echo '[🔥] dependencies ready'
        ./make standalone
        echo '[🔥] bundled executable: xrsh.com'
        echo -e "\n run: ./xrsh.com to launch XR Shell\n\n"
      '';
}
