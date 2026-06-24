#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

echo "TMI-OS sandbox check"

for path in README.md docs/BOUNDARY.md examples/hello.i1 sandbox/index.html; do
  test -f "$path"
done

if grep -RInE 'github_pat_|ghp_|sk-[A-Za-z0-9_-]{20,}|BEGIN (RSA |OPENSSH |EC |DSA )?PRIVATE KEY|password *=|token *=|api[_-]?key *=' . \
  --exclude=check_sandbox.sh \
  --exclude-dir=.git; then
  echo "sandbox check: secret-like pattern found" >&2
  exit 1
fi

if grep -RInE 'claim *= *(biological_life|legal_identity|empirical_physics)|auto_publish *= *true' . \
  --exclude=check_sandbox.sh \
  --exclude-dir=.git; then
  echo "sandbox check: forbidden claim pattern found" >&2
  exit 1
fi

echo "sandbox check: PASS"
