# TMI-OS Experiment

Голый независимый экспериментальный домен для частых проверок и push.

```text
LLM/GPT/Codex -> Lean -> TLFL -> И1
```

Назначение:

```text
Intent -> CanonicalRecord -> Passport -> GuardedAction
```

Главный вход:

```text
PASSPORT.md
```

## Что это

Это не основное ядро TLFL и не публикационный архив. Это отдельная
экспериментальная рабочая плоскость, где можно быстро проверять маленькие
программы, формулы, доски и guard-правила до переноса в основной слой.

## Что внутри

- `catalog/` - каталог доменных пространств эксперимента.
- `PASSPORT.md` - главный паспорт, из которого компилируется домен.
- `codex/PASSPORT.md` - рабочий паспорт инструментальной роли Codex в эксперименте.
- `control/DICTIONARY.md` - контрольный словарь паспорта, без заглубления языка.
- `docs/DEPLOY_FROM_PASSPORT.md` - инструкция развертывания от паспорта через Lean / Vampire / E.
- `examples/hello.i1` - минимальная программа на И1.
- `experiment/index.html` - локальная визуальная плоскость без зависимостей.
- `spaces/bare_stack_clean_build/` - чистая локальная сборка Lean / Vampire / E.
- `docs/BOUNDARY.md` - граница: что можно держать здесь, а что нельзя.
- `docs/BARE_STACK_BUILD.md` - сборка голого стека Lean / Z3 / Vampire / E.
- `scripts/check_experiment.sh` - быстрый локальный guard-check.

## Запуск

Проверить эксперимент:

```bash
./scripts/check_experiment.sh
```

Развернуть полный проверочный стек:

```text
docs/BARE_STACK_BUILD.md
```

Запустить доменную clean build:

```bash
./spaces/bare_stack_clean_build/scripts/clean_build.sh
```

Открыть web-плоскость:

```bash
cd experiment
python3 -m http.server 8766
```

Затем открыть:

```text
http://127.0.0.1:8766/
```

## Правило

```text
Эксперимент принимает идеи.
Эксперимент не публикует claims.
Эксперимент не хранит секреты.
Эксперимент не заменяет TLFL.
```
