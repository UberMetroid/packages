# idlescreen-cosmic metapackage

Product install for COSMIC users:

```text
idlescreen-cosmic
  Depends:    idlescreen, idlescreen-applet, idlescreen-savers
  Recommends: idlescreen-tui, idlescreen-cli
```

Legacy packages `trance`, `trance-applet`, `trance-plugins-all` are **Obsoleted /
Replaced** by the names above (transition from IdleScreen 1.x → 2.0).

## Build a local .deb (equivs)

```bash
sudo apt install equivs
cd metapackages/idlescreen-cosmic
equivs-build control
```

Source app: [app-cosmic](https://github.com/idlescreen/app-cosmic).
