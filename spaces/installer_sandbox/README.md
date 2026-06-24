# Installer Sandbox

Маленькая песочница для проверки установки оси по паспорту.

Она не ставит TMI-OS глобально, не пишет в `$HOME`, не ходит в сеть и не
публикует артефакты. Ее задача проще: взять минимальный набор файлов из
экспериментального домена, развернуть временный чистый срез и проверить, что
из него можно прочитать паспорт, словарь, роль Codex и минимальную программу.

```text
AxisInstallFromPassport
  := PASSPORT.md
  -> control/DICTIONARY.md
  -> codex/PASSPORT.md
  -> examples/hello.i1
  -> installed-surface guard
  -> report
```

## Run

From repository root:

```bash
./spaces/installer_sandbox/scripts/check_installer_sandbox.sh
```

Expected:

```text
installer sandbox check: PASS
```

## Boundary

Allowed:

```text
temporary dry-run install
passport guard check
local report
```

Not allowed:

```text
global install
network push
publication
mutation of foreign passport
copying private data
```
