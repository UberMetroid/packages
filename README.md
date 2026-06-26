# UberMetroid Packages Repository

This repository serves as the central distribution hub for the **UberMetroid** ecosystem. Each application is distributed through three channels:

* **Nix flake** — source of truth for build configuration
* **Nix container** — minimal OCI images produced via `pkgs.dockerTools.buildLayeredImage`
* **APT** — Debian / Ubuntu packages built from the same Rust code

## Distribution Channels

| Channel | Target | Contents |
| :--- | :--- | :--- |
| **Nix flake** | NixOS, Unraid Nix Plugin | Source-of-truth build config |
| **Nix container** | Docker Hub (`ubermetroid/*`) | OCI images, no Alpine |
| **APT** | Debian, Ubuntu, Pop!_OS | Compiled `.deb` packages |

## Supported Applications

| Application | Nix flake | Nix container | APT |
| :--- | :---: | :---: | :---: |
| **beam**   | ✓ | ✓ | ✓ |
| **grid**   | ✓ | ✓ | ✓ |
| **pad**    | ✓ | ✓ | ✓ |
| **todo**   | ✓ | ✓ | ✓ |
| **trace**  | ✓ | ✓ | ✓ |
| **trance** | ✓ | — | ✓ |

---

## 1. Debian / Ubuntu Setup (APT)

To install any UberMetroid application:

### Automated Installation (Recommended)
```bash
curl -fsSL https://ubermetroid.github.io/packages/apt/install.sh | sudo bash
sudo apt install beam    # or grid, pad, todo, trace, trance
```

For manual installation instructions and GPG keyring details, see the [APT Readme](apt/README.md).

---

## 2. NixOS / Unraid Nix Setup (Flakes)

Run any application directly:

```bash
nix run github:UberMetroid/beam
nix run github:UberMetroid/grid
nix run github:UberMetroid/pad
nix run github:UberMetroid/todo
nix run github:UberMetroid/trace
nix run github:UberMetroid/trance
```

Or import into your flake inputs:

```nix
inputs = {
  ubermetroid-beam.url = "github:UberMetroid/beam";
  ubermetroid-grid.url = "github:UberMetroid/grid";
  ubermetroid-pad.url = "github:UberMetroid/pad";
  ubermetroid-todo.url = "github:UberMetroid/todo";
  ubermetroid-trace.url = "github:UberMetroid/trace";
  ubermetroid-trance.url = "github:UberMetroid/trance";
};
```

---

## 3. Container Images (Docker Hub)

Images are Nix-built (no Alpine) and published to Docker Hub:

```bash
docker pull ubermetroid/beam:latest
docker pull ubermetroid/grid:latest
docker pull ubermetroid/pad:latest
docker pull ubermetroid/todo:latest
docker pull ubermetroid/trace:latest
```

For Unraid users, see the [unraid-templates](https://github.com/UberMetroid/unraid-templates) repository for one-click installation.