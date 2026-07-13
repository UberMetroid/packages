<p align="center">
  <a href="https://crateria.github.io/">
    <img src="assets/crateria-header.jpg" alt="Crateria" width="100%">
  </a>
</p>

# Crateria Package Repositories

[![CI](https://github.com/crateria/packages/actions/workflows/ci.yml/badge.svg)](https://github.com/crateria/packages/actions/workflows/ci.yml)

Official hosted APT and DNF software repositories for the Crateria organization.

## Adding the Repository

### Debian / Ubuntu / Pop!_OS
```bash
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://crateria.github.io/packages/apt/crateria-keyring.gpg -o /etc/apt/keyrings/crateria.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/crateria.gpg] https://crateria.github.io/packages/apt stable main" | sudo tee /etc/apt/sources.list.d/crateria.list
sudo apt update
```

### Fedora
```bash
sudo curl -fsSL https://crateria.github.io/packages/rpm/crateria.repo -o /etc/yum.repos.d/crateria.repo
```
