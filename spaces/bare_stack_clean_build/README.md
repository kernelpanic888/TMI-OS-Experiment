# Bare Stack Clean Build Space

Назначение: проверить голый локальный стек без основного TLFL repo и без
публикации.

Source passport:

```text
../../PASSPORT.md
```

```text
Lean smoke theorem
Vampire TPTP smoke theorem
E prover TPTP smoke theorem
Experiment guard-check
```

## Запуск

Из корня эксперимента:

```bash
./spaces/bare_stack_clean_build/scripts/clean_build.sh
```

## Что считается успехом

```text
Lean checks Smoke.lean
Vampire proves experiment_smoke.p
E prover proves experiment_smoke.p
Experiment guard passes
```

## Boundary

Это не proof-lab и не релиз TLFL. Это локальная проверка того, что доменный
минимум живет и может быть позднее перенесен или запушен.
