# Bare Stack Build: Lean / Vampire / E

Цель: развернуть минимальный стек проверки на чистой машине и понять, какие
компоненты должны быть доступны до переноса артефакта из песочницы в TLFL или
proof-lab.

Этот документ не публикует claims. Он только описывает техническую сборку.

## 1. Минимальный стек

```text
Git
Lean 4 / Lake
Python 3
Z3
Vampire
E prover
```

В канонической цепочке песочницы:

```text
LLM/GPT/Codex -> Lean -> TLFL -> И1
                  \
                   -> Z3 / Vampire / E proof-status mirrors
```

## 2. macOS / Homebrew

Установить базовые инструменты:

```bash
brew install git python z3 eprover
```

Lean лучше ставить через `elan`:

```bash
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
```

Проверить:

```bash
lean --version
lake --version
z3 --version
eprover --version
```

Vampire часто ставится отдельно из релиза проекта или через локальный binary.
После установки binary должен быть доступен как один из вариантов:

```text
vampire
vampire_z3_rel_static
```

Проверить:

```bash
vampire --version
```

или:

```bash
vampire_z3_rel_static --version
```

## 3. Linux / Debian-like

Базовый стек:

```bash
sudo apt-get update
sudo apt-get install -y git curl python3 z3 eprover
```

Lean через `elan`:

```bash
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
```

Проверить:

```bash
lean --version
lake --version
z3 --version
eprover --version
```

Vampire может потребовать ручной установки binary из официального release.
Положить binary в каталог из `PATH`, например:

```bash
chmod +x vampire
sudo mv vampire /usr/local/bin/vampire
vampire --version
```

## 4. Проверка песочницы

Из корня песочницы:

```bash
./scripts/check_sandbox.sh
```

Ожидаемый результат:

```text
TMI-OS sandbox check
sandbox check: PASS
```

## 5. Проверка TLFL рядом с песочницей

Если рядом лежит TLFL repo:

```bash
cd ../TMI-Lean-Formal-Library-TLFL-0.1-Formal-Library-for-Interface-Event-Theory-in-Lean-4
lake build TMI
lake build OLean
lake env lean lean/TMI/Regression.lean
lake build TMI.SelfThinkingUniverse
```

Ожидаемый смысл:

```text
Lean package builds.
OLean boundary builds.
Regression checks.
SelfThinkingUniverse checks.
```

## 6. Проверка proof-lab рядом с песочницей

Если рядом лежит `tmi_proof_lab_v0_2`:

```bash
cd ../../tmi_proof_lab_v0_2
make tptp-static
make intelligence-proof-matrix
make intelligence-z3
make external-atp-pair
make proof-kernel
```

Ожидаемый статус текущего полного proof package:

```text
198 theorem targets
63 model boundaries
295 TPTP files
Z3 / Vampire / E gates pass
```

## 7. Что делать, если prover отсутствует

```text
lean/lake missing   -> install elan, reload shell
z3 missing          -> install z3 package
eprover missing     -> install eprover package
vampire missing     -> install Vampire binary and add it to PATH
proof-lab mismatch  -> do not edit claims; first sync reports and rerun checks
```

## 8. Boundary

Песочница не утверждает, что наличие prover binary доказывает теорию целиком.
Она проверяет только техническую готовность стека:

```text
tool exists
command runs
guard passes
artifact can be promoted only after review
```

