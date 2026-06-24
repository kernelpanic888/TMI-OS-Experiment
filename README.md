# TMI-OS Sandbox

Голая независимая песочница для безопасных экспериментов.

```text
LLM/GPT/Codex -> Lean -> TLFL -> И1
```

Назначение:

```text
Intent -> CanonicalRecord -> Passport -> GuardedAction
```

## Что это

Это не основное ядро TLFL и не публикационный архив. Это отдельная рабочая
плоскость, где можно быстро проверять маленькие программы, формулы, доски и
guard-правила до переноса в основной слой.

## Что внутри

- `catalog/` - каталог доменных пространств песочницы.
- `examples/hello.i1` - минимальная программа на И1.
- `sandbox/index.html` - локальная визуальная песочница без зависимостей.
- `spaces/bare_stack_clean_build/` - чистая локальная сборка Lean / Vampire / E.
- `docs/BOUNDARY.md` - граница: что можно держать здесь, а что нельзя.
- `docs/BARE_STACK_BUILD.md` - сборка голого стека Lean / Z3 / Vampire / E.
- `scripts/check_sandbox.sh` - быстрый локальный guard-check.

## Запуск

Проверить песочницу:

```bash
./scripts/check_sandbox.sh
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
cd sandbox
python3 -m http.server 8766
```

Затем открыть:

```text
http://127.0.0.1:8766/
```

## Правило

```text
Песочница принимает идеи.
Песочница не публикует claims.
Песочница не хранит секреты.
Песочница не заменяет TLFL.
```
