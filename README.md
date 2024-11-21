# xrsh

<img src='xrsh.svg' width="25%"/>

## XRSH Manual 

Documentation for XRSH users can be found [here](https://forgejo.isvery.ninja/xrsh/xrsh-buildroot/src/branch/main/buildroot-v86/board/v86/rootfs_overlay/root/manual.md)

> TIP: this is also available by typing `ctrl/cmd+a+0` or `man xrsh` inside XRSH

## Wiki / Roadmap

See [the wiki here](https://forgejo.isvery.ninja/xrsh/xrsh/wiki/Home#milestones)

## Install 

> NOTE: installation is optional: just surf to the public version [here](https://xrsh.isvery.ninja)

<details>
<summary>install using nix</summary>

[NIX](https://nixos.org/) is a convenient way to install or develop xrsh:

1. run `nix-run -p xrsh --run "xrsh.com"` (pass `-p XXXX` to specify non-default 8080 port )
2. build it when package does not exist: `nix-build -E "with import <nixpkgs> { }; callPackage ./xrsh.nix"`
</details>

<details>
    <summary>install without nix</summary>

1. Download [xrsh.com](https://forgejo.isvery.ninja/xrsh/xrsh/raw/branch/main/xrsh.com)
2. optional: run `unzip xrsh.com` to verify repository contents
3. run `chmod +x xrsh.com` in your console (only linux/mac)
4. run `./xrsh.com` in (any) shell
5. Profit! ✔
</details>

<details>
    <summary>launch different .iso / modify files</summary>

You can specify a different `.iso` file in various ways:

1. open the `xrsh.com` as a zip (drag-drop into a zip-manager, or add `.zip` extension) 
2. method 1: overwrite `xrsh.iso`
3. method 2: open `src/index.html` and change `isoterminal="iso: ./../xrsh.iso"` to another file/URL

> see developer-section below on building your own iso

</details>

The browser auto-launches `https://localhost:8080` on most platforms

> pass `-p XXXX` to specify port (default:8080)

## Developers 

Make sure to clone the repo including submodules (the [xrsh-com](https://forgejo.isvery.ninja/xrsh/xrsh-com) repo)

```
$ git clone --recurse-submodules https://forgejo.isvery.ninja/xrsh/xrsh
$ cd xrsh
$ nix-shell  # optional but adviced (to get up and running instantly)
```

> Now serve the repo from a HTTPS webserver (for example run `./make dev`)

Run `./make standalone` to package everything into `xrsh.com`

* development of components (`src/com`) takes places [in this git submodule](https://forgejo.isvery.ninja/xrsh/xrsh-com)
* development of `xrsh.iso` takes places [in this gitsubmodule](https://forgejo.isvery.ninja/xrsh/xrsh-buildroot)


## Funding

This project is funded through [NGI0 Entrust](https://nlnet.nl/entrust), a fund established by [NLnet](https://nlnet.nl) with financial support from the European Commission's [Next Generation Internet](https://ngi.eu) program. Learn more at the [NLnet project page](https://nlnet.nl/project/xrsh).

[<img src="https://nlnet.nl/logo/banner.png" alt="NLnet foundation logo" width="20%" />](https://nlnet.nl)
[<img src="https://nlnet.nl/image/logos/NGI0_tag.svg" alt="NGI Zero Logo" width="20%" />](https://nlnet.nl/entrust)
