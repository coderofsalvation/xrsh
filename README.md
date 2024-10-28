# xrsh

<img src='src/assets/logo.svg' width="25%"/>

## Wiki / Roadmap

See [the wiki here](https://forgejo.isvery.ninja/xrsh/xrsh/wiki/Home#milestones)

## Install 

> NOTE: installation is optional: just surf to the public version [here](https://xrsh.isvery.ninja)

<details>
<summary>install using nix</summary>

1. run `nix-run -p xrsh --run "xrsh.com"` (pass `-p XXXX` to specify non-default 8080 port )
2. build it when package does not exist: `nix-build -E "with import <nixpkgs> { }; callPackage ./xrsh.nix"`
</details>

<details>
    <summary>install without nix</summary>
1. Download [xrsh.com](https://forgejo.isvery.ninja/xrsh/xrsh/raw/branch/main/xrsh.com)
2. optional: run `unzip xrsh.com` to verify repository contents
3. run `chmod +x xrsh.com` in your console 
4. run `./xrsh.com` 
5. Profit! ✔
</details>

The browser auto-launches `https://localhost:8080` on most platforms

> pass `-p XXXX` to specify port (default:8080)

## Developers 

Make sure to clone the repo including submodules (the [xrsh-com](https://forgejo.isvery.ninja/xrsh/xrsh-com) repo)

```
$ git clone --recurse-submodules https://forgejo.isvery.ninja/xrsh/xrsh
```

> Now serve the repo from a HTTPS webserver (for example run `./make dev`)

Run `./make standalone` to package everything into `xrsh.com`


## Funding

This project is funded through [NGI0 Entrust](https://nlnet.nl/entrust), a fund established by [NLnet](https://nlnet.nl) with financial support from the European Commission's [Next Generation Internet](https://ngi.eu) program. Learn more at the [NLnet project page](https://nlnet.nl/project/xrsh).

[<img src="https://nlnet.nl/logo/banner.png" alt="NLnet foundation logo" width="20%" />](https://nlnet.nl)
[<img src="https://nlnet.nl/image/logos/NGI0_tag.svg" alt="NGI Zero Logo" width="20%" />](https://nlnet.nl/entrust)
