#!/usr/bin/env bash
set -euo pipefail
source /root/.cargo/env
cd /workspace
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON -DBUILD_TESTING=ON "$@"
