#!/usr/bin/env bash
set -euo pipefail

space_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
repo_root="$(cd "$space_root/../.." && pwd)"

LEAN_BIN="${LEAN:-/Users/test/.elan/bin/lean}"
LAKE_BIN="${LAKE:-/Users/test/.elan/bin/lake}"
VAMPIRE_BIN="${VAMPIRE:-/opt/homebrew/bin/vampire}"
EPROVER_BIN="${EPROVER:-/opt/homebrew/bin/eprover}"

echo "TMI-OS experiment bare stack clean build"
echo "space: $space_root"

require_tool() {
  local name="$1"
  local path="$2"
  if [[ ! -x "$path" ]]; then
    echo "missing required tool: $name at $path" >&2
    exit 1
  fi
}

require_tool "lean" "$LEAN_BIN"
require_tool "lake" "$LAKE_BIN"
require_tool "vampire" "$VAMPIRE_BIN"
require_tool "eprover" "$EPROVER_BIN"

echo
echo "[versions]"
"$LEAN_BIN" --version
"$LAKE_BIN" --version
"$VAMPIRE_BIN" --version | head -n 1
"$EPROVER_BIN" --version | head -n 1

echo
echo "[experiment guard]"
"$repo_root/scripts/check_experiment.sh"

echo
echo "[lean smoke]"
"$LEAN_BIN" "$space_root/lean/Smoke.lean"

echo
echo "[vampire smoke]"
"$VAMPIRE_BIN" "$space_root/tptp/experiment_smoke.p" | tee "$space_root/reports/vampire_smoke.txt"
grep -Eq 'Termination reason: Refutation|SZS status Theorem' "$space_root/reports/vampire_smoke.txt"

echo
echo "[e prover smoke]"
"$EPROVER_BIN" --auto --tstp-in "$space_root/tptp/experiment_smoke.p" | tee "$space_root/reports/eprover_smoke.txt"
grep -Eq '# Proof found!|SZS status Theorem' "$space_root/reports/eprover_smoke.txt"

cat > "$space_root/reports/local_clean_build_status.txt" <<REPORT
status: PASS
space: bare_stack_clean_build
lean: $("$LEAN_BIN" --version | head -n 1)
lake: $("$LAKE_BIN" --version | head -n 1)
vampire: $("$VAMPIRE_BIN" --version | head -n 1)
eprover: $("$EPROVER_BIN" --version | head -n 1)
REPORT

echo
echo "bare stack clean build: PASS"
