#!/usr/bin/env bash
# update.sh — Compile and run the APT indexer script.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Compile update.rs from the root
echo "Compiling indexer..."
rustc apt/update.rs -o apt/update

# Run it inside the apt/ directory
echo "Running indexer..."
cd apt
./update

# Clean up
echo "Cleaning up build artifacts..."
rm -f update
