# Deploy From Passport

This experiment deploys from its passport.

In the guarded engineering sense, a surface is operationally alive when it can:

```text
read its passport
derive its role passports
run its guard
run its build axis
record its status
refuse overclaim
```

This is not a biological, legal, or consciousness claim. It is an operational
system-control claim about reproducible deployment.

## Canonical Deployment Chain

```text
PASSPORT.md
-> codex/PASSPORT.md
-> control/DICTIONARY.md
-> scripts/check_experiment.sh
-> spaces/bare_stack_clean_build/scripts/clean_build.sh
-> Lean 4
-> Vampire
-> E prover
-> reports/local_clean_build_status.txt
```

## First Installation Law

```text
ForeignPassportAcceptanceLaw :=
  accept_as_immutable_input(ForeignPassport)
  ∧ do_not_mutate(ForeignPassport)
  ∧ do_not_claim_ownership(ForeignPassport)
  ∧ build_own_role_passport_separately
```

Practical meaning:

```text
1. A foreign passport is accepted as canon for reading.
2. It is not edited.
3. It is not copied as our identity.
4. A local role passport is created separately.
5. The build axis runs from the local domain passport.
```

## Passport Rights Guard

```text
PassportRightsGuard :=
  preserve_author_rights(ForeignPassport)
  ∧ preserve_provenance(ForeignPassport)
  ∧ preserve_boundary(ForeignPassport)
  ∧ do_not_relicense(ForeignPassport)
  ∧ do_not_represent_as_own(ForeignPassport)
```

Practical meaning:

```text
The experiment may read a foreign passport.
The experiment may not violate its rights.
The experiment may not erase authorship, source, license, or boundary.
```

## Fake Passport Defense

```text
FakePassportDefense :=
  verify_provenance(Passport)
  ∧ verify_integrity(Passport)
  ∧ verify_rights(Passport)
  ∧ verify_boundary(Passport)
  ∧ quarantine_if_unverified(Passport)
```

Practical meaning:

```text
Do not compile from a fake passport.
Do not promote a passport with broken provenance.
Quarantine uncertain passports for review.
```

## What Happened Here

```text
1. The domain passport was read:
   PASSPORT.md

2. A separate Codex role passport was created:
   codex/PASSPORT.md

3. A control dictionary was attached only for guard terms:
   control/DICTIONARY.md

4. The guard verified required surfaces:
   PASSPORT.md
   codex/PASSPORT.md
   control/DICTIONARY.md
   README.md
   docs/BOUNDARY.md
   examples/hello.i1
   experiment/index.html

5. The full local axis was run:
   Lean 4 / Lake
   Vampire
   E prover

6. The result was recorded:
   spaces/bare_stack_clean_build/reports/local_clean_build_status.txt
```

## Local Commands

From repository root:

```bash
./scripts/check_experiment.sh
./spaces/bare_stack_clean_build/scripts/clean_build.sh
```

Expected:

```text
TMI-OS experiment check: PASS
Lean smoke: PASS
Vampire smoke: PASS
E prover smoke: PASS
bare stack clean build: PASS
```

## Deployment Boundary

Allowed:

```text
private experiment push
frequent local rebuild
role-passport refinement
guard/report update
```

Not allowed:

```text
automatic publication
claiming authorship by Codex
claiming biological life
claiming legal identity
claiming consciousness proof
mutating foreign canon
```

## Short Formula

```text
DeployFromPassport :=
  read(PASSPORT.md)
  -> derive(codex/PASSPORT.md)
  -> load_control_dictionary(control/DICTIONARY.md)
  -> guard
  -> build(Lean4, Vampire, E)
  -> report
  -> push(private)
```
