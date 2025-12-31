# Structural Explainability: The Basics

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
![Build Status](https://github.com/structural-explainability/StructuralExplainability/actions/workflows/ci.yml/badge.svg)
[![Check Links](https://github.com/structural-explainability/StructuralExplainability/actions/workflows/links.yml/badge.svg)](https://github.com/structural-explainability/StructuralExplainability/actions/workflows/links.yml)

> Lean 4 formalization of the contextual structural explainability layer.

## What This Formalizes

This repository provides a Lean 4 formalization
of the Structural Explainability layer.
It:

- encodes the neutrality constraints as predicates,
- defines conformance predicates shared by AE / EP / CEE,
- proves basic composability.

It intentionally includes no domain logic,
no examples, no governance, and no interpretation.
It provides a small predicate and typeclass layer ensuring downstream specs compose without contradiction.

It depends only on spec-se.

## Build and Run

```shell
lake update
lake build
lake exe verify
```

## Annotations

[ANNOTATIONS.md](./ANNOTATIONS.md)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)
