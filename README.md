# IdleScreen packages

Signed APT and DNF index: **[idlescreen.github.io/packages](https://idlescreen.github.io/packages/)**

## Fedora

```bash
sudo curl -fsSL https://idlescreen.github.io/packages/rpm/idlescreen.repo \
  -o /etc/yum.repos.d/idlescreen.repo
sudo dnf install idle-cosmic
# optional
sudo dnf install idle-tui
```

## Debian / Ubuntu / Pop!_OS

```bash
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://idlescreen.github.io/packages/apt/idlescreen-keyring.gpg \
  -o /etc/apt/keyrings/idlescreen.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/idlescreen.gpg] https://idlescreen.github.io/packages/apt stable main" \
  | sudo tee /etc/apt/sources.list.d/idlescreen.list
sudo apt update
sudo apt install idle-cosmic
```

## Products (what users install)

| Package | Role |
|---------|------|
| **idle-cosmic** | COSMIC: daemon + all savers + applet |
| **idle-tui** | Live TUI |
| **idle-studio** | Offline director |

Engine packages (`idle-daemon`, `idle-cli`, `idle-saver-*`) are dependencies — not the advertised install path.

CLI after install: **`idle`**.

## Source

Engine: [idlescreen/idle](https://github.com/idlescreen/idle)
