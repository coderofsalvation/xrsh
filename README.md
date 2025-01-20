# xrsh

<img src='xrsh.svg' width="25%"/>

## [click here for the website / hosted repo](https://xrsh.isvery.ninja)

## XRSH Manual 

Documentation for XRSH users can be found [here](https://forgejo.isvery.ninja/xrsh/xrsh-buildroot/src/branch/main/buildroot-v86/board/v86/rootfs_overlay/root/manual.md)

> TIP: this is also available by typing `ctrl/cmd+a+0` or `man xrsh` inside XRSH

## Wiki / Roadmap

See [the wiki here](https://forgejo.isvery.ninja/xrsh/xrsh/wiki/Home#milestones)

## Install 

> NOTE: installation is optional: just surf to the public version [here](https://xrsh.isvery.ninja)

<details>
    <summary>run standalone binary</summary>

1. Download [xrsh.com](https://forgejo.isvery.ninja/xrsh/xrsh/raw/branch/main/xrsh.com)
2. optional: run `unzip xrsh.com` to verify repository contents
3. run `chmod +x xrsh.com` in your console (only linux/mac)
4. run `./xrsh.com` in (any) shell
5. Profit! ✔
</details>
<details>
<summary>install using nixos</summary>

[NIX](https://nixos.org/) is a convenient way to install or develop xrsh:

1. `nix-shell -p xrsh thttpd`
2. `thttpd -p 8080 -d /nix/store/5q4vd50gmh52jh48z62ln1j05xzfh1fz-xrsh-0.142`
3. point your browser to `localhost:8080`
4. profit!
</details>

<summary>run OCI container [podman/docker]</summary>
<details>

1. `$(which podman || which docker) run -p 8080:8080 docker.io/coderofsalvation/xrsh`
2. point your browser to `localhost:8080`
3. profit!

> NOTE 1: to add files use the `-D <dir>` overlay webroot parameter.

> NOTE 2: to enable SSL and add (iso)file try something like this:

```
$ mkdir data
$ cp ../xrsh.iso data/. # copy custom iso
$ $(which podman || which docker) run -p 8080:8080 -v data/cert:etc/cert -v data:/data docker.io/coderofsalvation/xrsh /xrsh.com -D /data -c 0 -C /etc/cert/cert.pem -K /etc/cert/key.pem
```

> or as an exercise in constructive laziness setup a reverse proxy like [zoraxy](https://github.com/tobychui/zoraxy), [go-proxy](https://github.com/yusing/go-proxy), [droxy], caddy or nginx-reverse-proxymanager.   

</details>

<details>
<summary>install in yunohost</summary>

1. search for xrsh in the application catalog 
2. click install
3. profit!
</details>

<details>
<summary>build using nix</summary>

1. `nix-build -E "with import <nixpkgs> { }; callPackage ./nix/xrsh-package.nix"`
2. optionally see the other nix-files in `nix`-folder
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

## Inspired by

* [mimetype hooks](https://forgejo.isvery.ninja/xrsh/xrsh-buildroot/src/branch/main/buildroot-v86/board/v86/rootfs_overlay/root/hook.d/mimetype): [Future of Text's](https://github.com/TheElectronicLiteratureLab/spasca-fsbased-interrop-companion/)
* [xterm](https://invisible-island.net/xterm/)
* [xr-terminal](https://github.com/RangerMauve/xr-terminal) of Mauve (an amazingly talented dev)
* [Fabien Beneout's PIM](https://fabien.benetou.fr/) (the WIKI containing all secrets & ideas in life)
