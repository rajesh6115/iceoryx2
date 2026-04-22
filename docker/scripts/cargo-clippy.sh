#!/usr/bin/env bash
set -euo pipefail
source /root/.cargo/env
cd /workspace
cargo clippy --all-targets -- -D warnings "$@"
