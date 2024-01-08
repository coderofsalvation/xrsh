# xrsh

<img src='src/assets/logo.svg' width="25%"/>

## Wiki / Roadmap

See [the wiki here](https://forgejo.isvery.ninja/xrsh/xrsh/wiki/Home#milestones)

## Install 

No need! Just surf to the public version [here](https://coderofsalvation.github.io/xrsh) or download the [standalone binary](https://) in the releases section <br>
The apps live in the [apps-repo](https://github.com/coderofsalvation/xrsh-apps).<br>

## Developers 

```
$ git clone https://forgejo.isvery.ninja/xrsh/xrsh
$ git clone https://forgejo.isvery.ninja/xrsh/xrsh-apps
$ cd xrsh/src
$ ln -s ../../xrsh-apps/app .
$ ln -s ../../xrsh-apps/com .
```

> now surf to xrsh/src/index.html

<b>developers:</b> run `./make dev` (spins up a [redbean.com](https://redbean.dev) https-server)

> NOTE: if you value optimization over prototype-ability, you can minify the code by running `cd src && npm install parcel && parcel index.html`
