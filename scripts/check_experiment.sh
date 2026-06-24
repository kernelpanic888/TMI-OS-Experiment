#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

echo "TMI-OS experiment check"

for path in PASSPORT.md codex/PASSPORT.md control/DICTIONARY.md README.md docs/BOUNDARY.md docs/DEPLOY_FROM_PASSPORT.md examples/hello.i1 experiment/index.html spaces/installer_sandbox/README.md spaces/installer_sandbox/scripts/install_sandbox.sh spaces/installer_sandbox/scripts/check_installer_sandbox.sh; do
  test -f "$path"
done

for token in ForeignPassportAcceptanceLaw PassportRightsGuard FakePassportDefense; do
  grep -q "$token" PASSPORT.md
  grep -q "$token" codex/PASSPORT.md
done

grep -q "AxisInstallFromPassport" PASSPORT.md
grep -q "AxisInstallFromPassport" docs/DEPLOY_FROM_PASSPORT.md

for term in CONTROL_DICTIONARY ForeignPassport Provenance Integrity Quarantine BuildAxis AxisInstall InstallerSandbox; do
  grep -q "$term" control/DICTIONARY.md
done

if grep -RInE 'github_pat_|ghp_|sk-[A-Za-z0-9_-]{20,}|BEGIN (RSA |OPENSSH |EC |DSA )?PRIVATE KEY|password *=|token *=|api[_-]?key *=' . \
  --exclude=check_experiment.sh \
  --exclude=install_sandbox.sh \
  --exclude=check_installer_sandbox.sh \
  --exclude-dir=.git; then
  echo "experiment check: secret-like pattern found" >&2
  exit 1
fi

if grep -RInE 'claim *= *(biological_life|legal_identity|empirical_physics)|auto_publish *= *true' . \
  --exclude=check_experiment.sh \
  --exclude-dir=.git; then
  echo "experiment check: forbidden claim pattern found" >&2
  exit 1
fi

echo "experiment check: PASS"
