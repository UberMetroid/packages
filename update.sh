#!/usr/bin/env bash
# update.sh — Compile and run the APT and RPM indexer scripts.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ==========================================
# 1. Update APT Repository
# ==========================================
echo "=========================================="
echo "Updating APT repository..."
echo "=========================================="

echo "Regenerating binary GPG keyring..."
gpg --dearmor < "$REPO_ROOT/apt/ubermetroid-key.gpg" > "$REPO_ROOT/apt/ubermetroid-keyring.gpg"

echo "Compiling APT indexer..."
rustc "$REPO_ROOT/apt/update.rs" -o "$REPO_ROOT/apt/update"

echo "Running APT indexer..."
(
    cd "$REPO_ROOT/apt"
    ./update
)

echo "Cleaning up APT build artifacts..."
rm -f "$REPO_ROOT/apt/update"

# ==========================================
# 2. Update RPM (DNF) Repository
# ==========================================
echo ""
echo "=========================================="
echo "Updating RPM repository..."
echo "=========================================="

mkdir -p "$REPO_ROOT/rpm/pool"

(
    cd "$REPO_ROOT/rpm"

    if command -v createrepo_c &> /dev/null; then
        echo "Running createrepo_c..."
        createrepo_c --update .
    elif command -v nix-shell &> /dev/null; then
        echo "Running createrepo_c via nix-shell..."
        nix-shell -p createrepo_c --run "createrepo_c --update ."
    else
        echo "Warning: createrepo_c and nix-shell not found, skipping RPM repository indexing."
    fi

    # Sign the repository metadata if secret key is available
    if [ -f "repodata/repomd.xml" ]; then
        echo "Signing repomd.xml..."
        if gpg --list-secret-keys "jerydleuck@gmail.com" &> /dev/null; then
            rm -f repodata/repomd.xml.asc
            gpg --batch --yes --default-key "jerydleuck@gmail.com" --detach-sign --armor repodata/repomd.xml
            echo "Signed RPM repomd.xml successfully."
        else
            echo "Warning: GPG signing key not found, skipping RPM repomd.xml signature."
        fi
    fi
)

echo ""
echo "=========================================="
echo "All repository updates completed!"
echo "=========================================="
