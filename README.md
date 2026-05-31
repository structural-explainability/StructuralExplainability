# Structural Explainability: The Basics

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
![Build Status](https://github.com/structural-explainability/StructuralExplainability/actions/workflows/ci-lean.yml/badge.svg?branch=main)
[![Check Links](https://github.com/structural-explainability/StructuralExplainability/actions/workflows/links.yml/badge.svg)](https://github.com/structural-explainability/StructuralExplainability/actions/workflows/links.yml)

> Superseded Lean 4 formalization of the contextual Structural Explainability layer.

## Status

This repository is superseded by the active `se-theory-*` and formal-contract repositories.

Active development has moved to:

- [`se-theory-structural-explainability`](https://github.com/structural-explainability/se-theory-structural-explainability)
- [`se-formal-contract`](https://github.com/structural-explainability/se-formal-contract)

This repository is retained for provenance, earlier implementation history,
and compatibility with prior references. It may receive maintenance updates for
tooling, build hygiene, metadata, or release alignment, but it is no longer the
active theory source.

## What This Formalizes

This repository provides an earlier Lean 4 formalization of the Structural
Explainability layer. It:

- encodes neutrality constraints as predicates;
- defines conformance predicates shared by AE / EP / CEE;
- proves basic composability.

It intentionally includes no domain logic, no examples, no governance, and no
interpretation. It provides a small predicate and typeclass layer for checking
that downstream specifications compose without contradiction.

## Current Replacement Path

Use the active repositories for current work:

| Need | Use |
| ---- | --- |
| Active Structural Explainability theory | [`se-theory-structural-explainability`](https://github.com/structural-explainability/se-theory-structural-explainability) |
| Machine-readable formal contract exports | [`se-formal-contract`](https://github.com/structural-explainability/se-formal-contract) |

## Build and Run

```shell
lake update
lake build
lake exe verify

npx markdownlint-cli2 --fix
```

## Annotations

[ANNOTATIONS.md](./ANNOTATIONS.md)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)
