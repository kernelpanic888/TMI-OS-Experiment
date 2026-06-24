#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

echo "TMI-OS experiment check"

for path in PASSPORT.md codex/PASSPORT.md control/DICTIONARY.md README.md docs/BOUNDARY.md examples/hello.i1 experiment/index.html; do
  test -f "$path"
done

for token in ForeignPassportAcceptanceLaw PassportRightsGuard FakePassportDefense; do
  grep -q "$token" PASSPORT.md
  grep -q "$token" codex/PASSPORT.md
done

for term in CONTROL_DICTIONARY ForeignPassport Provenance Integrity Quarantine BuildAxis; do
  grep -q "$term" control/DICTIONARY.md
done

if grep -RInE 'github_pat_|ghp_|sk-[A-Za-z0-9_-]{20,}|BEGIN (RSA |OPENSSH |EC |DSA )?PRIVATE KEY|password *=|token *=|api[_-]?key *=' . \
  --exclude=check_experiment.sh \
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
