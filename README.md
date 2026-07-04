# UberMetroid Packages Repository

This repository serves as the central distribution hub for the **UberMetroid** ecosystem applications (such as `trance`, `beam`, `todo`, etc.). It supports distribution across multiple package managers and environments.

Supported formats:
*   **APT** (Debian, Ubuntu, Pop!_OS) — hosted under `/apt` and served via GitHub Pages

---

## 1. Debian / Ubuntu Setup (APT)

To install compiled Debian packages (such as `trance`):

### Installation Setup
To add the repository and install packages:

1. **Import the repository GPG key:**
   ```bash
   sudo mkdir -p /etc/apt/keyrings
   curl -fsSL https://ubermetroid.github.io/packages/apt/ubermetroid-key.gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/ubermetroid-keyring.gpg
   ```

2. **Add the repository entry:**
   ```bash
   echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/ubermetroid-keyring.gpg] https://ubermetroid.github.io/packages/apt stable main" | sudo tee /etc/apt/sources.list.d/ubermetroid.list
   ```

3. **Update and install packages:**
   ```bash
   sudo apt update
   sudo apt install trance
   ```

### Repository maintenance

The `apt/pool/main/` directory retains every version of every package
ever published, which has grown to ~143 MB / 131 files. To keep the
repository lean, prune the pool to the latest 3 versions of each
package:

```bash
./scripts/prune.sh          # default: keep latest 3
./scripts/prune.sh 5        # keep latest 5
```

After pruning, regenerate the APT index (see `apt/MAINTAINER.md`).
