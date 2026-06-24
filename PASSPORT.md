# TMI-OS Experiment Passport

Status:

```text
EXPERIMENT_DOMAIN
PRIVATE_REPOSITORY
FREQUENT_PUSH_SURFACE
COMPILES_FROM_PASSPORT
```

## Name

```text
TMI-OS Experiment
```

## Canonical Chain

```text
LLM/GPT/Codex -> Lean -> TLFL -> И1
```

## Purpose

```text
Intent -> CanonicalRecord -> Passport -> GuardedAction
```

This repository is an experimental domain. It exists to make small slices
buildable, checkable, and ready for frequent push.

## Compile Rule

```text
compile_from(PASSPORT.md)
```

Meaning:

```text
Every experiment slice must be readable from this passport.
Every build must preserve the guard boundary.
Every promoted artifact must carry its own smaller passport or report.
```

## Installation Laws

First law:

```text
ForeignPassportAcceptanceLaw :=
  accept_as_immutable_input(ForeignPassport)
  ∧ do_not_mutate(ForeignPassport)
  ∧ do_not_claim_ownership(ForeignPassport)
  ∧ build_own_role_passport_separately
```

Reading:

```text
чужой паспорт принимается догматично как входной канон;
чужой паспорт не правится;
чужой паспорт не присваивается;
свой паспорт создается отдельно.
```

Second law:

```text
PassportRightsGuard :=
  preserve_author_rights(ForeignPassport)
  ∧ preserve_provenance(ForeignPassport)
  ∧ preserve_boundary(ForeignPassport)
  ∧ do_not_relicense(ForeignPassport)
  ∧ do_not_represent_as_own(ForeignPassport)
```

Reading:

```text
нельзя нарушать права чужого паспорта;
нельзя стирать источник;
нельзя менять границу;
нельзя выдавать чужой паспорт за свой.
```

Third law:

```text
FakePassportDefense :=
  verify_provenance(Passport)
  ∧ verify_integrity(Passport)
  ∧ verify_rights(Passport)
  ∧ verify_boundary(Passport)
  ∧ quarantine_if_unverified(Passport)
```

Reading:

```text
нельзя попасться на поддельный паспорт;
непроверенный паспорт не компилируется;
сомнительный паспорт отправляется в quarantine/review;
цепочка сборки идет только от проверенного паспорта.
```

## Role Passports

```text
Codex role passport:
  codex/PASSPORT.md
```

## Control Dictionary

```text
Control dictionary:
  control/DICTIONARY.md
```

Reading:

```text
словарь подключается только для контроля;
словарь не заглубляется как ядро языка;
словарь задает термины guard-проверки паспорта.
```

## Domain Boundary

Allowed:

```text
small I1 sketches
local boards
Lean smoke checks
TPTP smoke checks
Vampire / E prover smoke checks
guard reports
```

Not allowed:

```text
secrets
private keys
personal passports
work/client data
automatic publication
unreviewed claims
```

## Current Build Surface

```text
spaces/bare_stack_clean_build
```

Build command:

```bash
./spaces/bare_stack_clean_build/scripts/clean_build.sh
```

Expected:

```text
Lean smoke: PASS
Vampire smoke: PASS
E prover smoke: PASS
Experiment guard: PASS
```

## Guard Formula

```text
ExperimentPassport :=
  canonical_chain
  + build_surface
  + guard_boundary
  + local_report
  + no_auto_publish
```

## Public Boundary

This repository may later become public, but this passport does not itself
publish the experiment. Publication requires a separate release decision.
