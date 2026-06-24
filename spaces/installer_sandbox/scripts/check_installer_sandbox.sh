#!/usr/bin/env bash
set -euo pipefail

space_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_root="$(mktemp -d "${TMPDIR:-/tmp}/tmi-os-installer-check.XXXXXX")"

echo "installer sandbox target: $tmp_root"
"$space_root/scripts/install_sandbox.sh" "$tmp_root"

grep -q "status: PASS" "$space_root/reports/installer_sandbox_status.txt"
grep -q "axis: AxisInstallFromPassport" "$space_root/reports/installer_sandbox_status.txt"

if [[ "${CLEAN_INSTALLER_SANDBOX:-0}" == "1" ]]; then
  rm -rf "$tmp_root"
  echo "installer sandbox temporary target removed"
else
  echo "installer sandbox kept for review: $tmp_root"
fi

echo "installer sandbox check: PASS"
