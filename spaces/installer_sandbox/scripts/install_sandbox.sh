#!/usr/bin/env bash
set -euo pipefail

space_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
repo_root="$(cd "$space_root/../.." && pwd)"

target_root="${1:-}"
if [[ -z "$target_root" ]]; then
  target_root="$(mktemp -d "${TMPDIR:-/tmp}/tmi-os-installer-sandbox.XXXXXX")"
fi

echo "TMI-OS installer sandbox"
echo "source: $repo_root"
echo "target: $target_root"

required=(
  "PASSPORT.md"
  "codex/PASSPORT.md"
  "control/DICTIONARY.md"
  "examples/hello.i1"
)

for path in "${required[@]}"; do
  if [[ ! -f "$repo_root/$path" ]]; then
    echo "installer sandbox: missing source file $path" >&2
    exit 1
  fi
done

mkdir -p "$target_root/codex" "$target_root/control" "$target_root/examples" "$target_root/reports" "$target_root/scripts"

cp "$repo_root/PASSPORT.md" "$target_root/PASSPORT.md"
cp "$repo_root/codex/PASSPORT.md" "$target_root/codex/PASSPORT.md"
cp "$repo_root/control/DICTIONARY.md" "$target_root/control/DICTIONARY.md"
cp "$repo_root/examples/hello.i1" "$target_root/examples/hello.i1"

cat > "$target_root/INSTALLATION_AXIS.md" <<'AXIS'
# Installation Axis

```text
AxisInstallFromPassport :=
  read(PASSPORT.md)
  -> accept_foreign_passports_as_immutable_inputs
  -> protect_passport_rights
  -> reject_fake_passports
  -> load_control_dictionary(control/DICTIONARY.md)
  -> derive_role_passports(codex/PASSPORT.md)
  -> run_guard
  -> write_report
```
AXIS

cat > "$target_root/scripts/check_installed_surface.sh" <<'CHECK'
#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

for path in PASSPORT.md codex/PASSPORT.md control/DICTIONARY.md examples/hello.i1 INSTALLATION_AXIS.md; do
  test -f "$path"
done

grep -q "ForeignPassportAcceptanceLaw" PASSPORT.md
grep -q "PassportRightsGuard" PASSPORT.md
grep -q "FakePassportDefense" PASSPORT.md
grep -q "AxisInstallFromPassport" INSTALLATION_AXIS.md
grep -q "CodexExperimentRole" codex/PASSPORT.md
grep -q "CONTROL_DICTIONARY" control/DICTIONARY.md
grep -q "Intent" examples/hello.i1

if grep -RInE 'github_pat_|ghp_|sk-[A-Za-z0-9_-]{20,}|BEGIN (RSA |OPENSSH |EC |DSA )?PRIVATE KEY|password *=|token *=|api[_-]?key *=' . \
  --exclude=check_installed_surface.sh; then
  echo "installed surface check: secret-like pattern found" >&2
  exit 1
fi

echo "installed surface check: PASS"
CHECK

chmod +x "$target_root/scripts/check_installed_surface.sh"
"$target_root/scripts/check_installed_surface.sh"

cat > "$target_root/reports/installer_status.txt" <<REPORT
status: PASS
source: TMI-OS-Experiment
target: $target_root
axis: AxisInstallFromPassport
passport: PASSPORT.md
role_passport: codex/PASSPORT.md
dictionary: control/DICTIONARY.md
program: examples/hello.i1
REPORT

mkdir -p "$space_root/reports"
cat > "$space_root/reports/installer_sandbox_status.txt" <<REPORT
status: PASS
source: TMI-OS-Experiment
target: <temporary-sandbox-root>
axis: AxisInstallFromPassport
passport: PASSPORT.md
role_passport: codex/PASSPORT.md
dictionary: control/DICTIONARY.md
program: examples/hello.i1
REPORT

echo "installer sandbox install: PASS"
echo "report: $space_root/reports/installer_sandbox_status.txt"
