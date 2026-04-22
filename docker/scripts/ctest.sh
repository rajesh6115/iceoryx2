#!/usr/bin/env bash
set -euo pipefail
cd /workspace/build
ctest --output-on-failure "$@"
