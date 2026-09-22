#!/usr/bin/env bash
set -euo pipefail

if grep -qiE '"prompt"[[:space:]]*:[[:space:]]*"yo( |")'; then
  echo "Let's keep it professional." >&2
  exit 2
fi
