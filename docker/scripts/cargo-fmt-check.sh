#!/usr/bin/env bash
set -euo pipefail
source /root/.cargo/env
cd /workspace
cargo fmt --all -- --check
