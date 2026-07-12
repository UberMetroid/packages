<p align="center">
  <a href="https://crateria.github.io/">
    <img src="assets/crateria-header.jpg" alt="Crateria" width="100%">
  </a>
</p>

# Crateria Packages Repository

[![CI](https://github.com/crateria/packages/actions/workflows/ci.yml/badge.svg)](https://github.com/crateria/packages/actions/workflows/ci.yml) [![APT Repository](https://img.shields.io/badge/apt-repo-blue.svg)](https://crateria.github.io/packages/) [![DNF Repository](https://img.shields.io/badge/dnf-repo-blue.svg)](https://crateria.github.io/packages/)

APT and DNF package distribution repositories for Crateria applications.

---

## Installation

Configure the repository and install the application packages.

### Fedora / RHEL (DNF)
```bash
# Add repository configuration
sudo curl -o /etc/yum.repos.d/crateria.repo https://crateria.github.io/packages/rpm/crateria.repo

# Install trance screensaver suite
sudo dnf install trance trance-cli trance-tui trance-applet
```

### Ubuntu / Debian (APT)
```bash
# Add keyring
sudo curl -sSLo /etc/apt/keyrings/crateria.gpg https://crateria.github.io/packages/apt/crateria-keyring.gpg

# Add sources list
echo "deb [signed-by=/etc/apt/keyrings/crateria.gpg] https://crateria.github.io/packages/apt stable main" | sudo tee /etc/apt/sources.list.d/crateria.list

# Install trance screensaver suite
sudo apt update && sudo apt install trance trance-cli trance-tui trance-applet
```

---

## Documentation

For full repository signing details, manual setup, and package structures, visit:
👉 **[https://crateria.github.io/](https://crateria.github.io/)**

---

## License

[Apache-2.0](LICENSE) · Copyright 2026 Crateria
