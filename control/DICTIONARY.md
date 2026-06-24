# Control Dictionary

Status:

```text
CONTROL_DICTIONARY
NOT_LANGUAGE_CORE
GUARD_ONLY
```

Purpose:

```text
This dictionary is used only for control.
It does not introduce a deep language layer.
It names the terms that the experiment checks before build, push, or promotion.
```

## Core Control Terms

```text
Passport :=
  canonical record that states identity, boundary, role, and allowed transition.

ForeignPassport :=
  passport that belongs to another canon, author, domain, or source.

SourceCanon :=
  original canon of a foreign passport.

AuthorCanon :=
  author-owned canon that must not be overwritten by CodexRole.

Guard :=
  boundary check that allows, blocks, quarantines, or sends to review.

Provenance :=
  trace of origin, authorship, source path, and custody.

Integrity :=
  evidence that the passport was not silently changed or forged.

Rights :=
  authorship, license, boundary, and representation rights of the passport.

Boundary :=
  what the artifact claims, what it does not claim, and where it may move.

Quarantine :=
  holding state for unverified, suspicious, or broken-provenance passports.

Review :=
  human or higher-control decision before promotion.

BuildAxis :=
  Lean 4 / Vampire / E check path used by this experiment.

AxisInstall :=
  installing the build axis from the domain passport.

InstallerSandbox :=
  small dry-run domain used to test installer behavior without global install.
```

## Control Actions

```text
accept_as_immutable_input(ForeignPassport)
verify_provenance(Passport)
verify_integrity(Passport)
verify_rights(Passport)
verify_boundary(Passport)
quarantine_if_unverified(Passport)
do_not_mutate(ForeignPassport)
do_not_claim_ownership(ForeignPassport)
```

## Control Chains

```text
BuildAxis(Passport) :=
  GuardCheck
  -> Lean4
  -> Vampire
  -> EProver
  -> Report
```

```text
AxisInstallFromPassport(Passport) :=
  Passport
  -> ControlDictionary
  -> InstallerSandbox
  -> GuardCheck
  -> BuildAxis
  -> ControlledPush
```

## Non-Goals

```text
This dictionary is not a full programming language.
This dictionary is not a public ontology.
This dictionary is not a replacement for TLFL or Lean.
This dictionary is a control vocabulary for passport-gated deployment.
```
