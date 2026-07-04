#!/usr/bin/env bash
exec cargo run --release --bin prune -- "$@"
