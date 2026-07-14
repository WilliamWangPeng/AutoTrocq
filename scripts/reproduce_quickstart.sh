#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
build="$root/build/quickstart"

python3 -m pip install -e "$root"
autotrocq doctor
autotrocq generate "$root/examples/bool_nat_section.json" --out "$build"
autotrocq replay "$build/BoolNatSection.v" \
  --report "$build/BoolNatSection.replay.json"
python3 -m unittest discover -s "$root/tests" -v

printf 'Quickstart completed successfully.\nReplay report: %s\n' \
  "$build/BoolNatSection.replay.json"

