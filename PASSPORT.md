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
