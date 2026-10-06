# Event Horizon Mobile

A zero-budget, offline-first mobile orchestration engine designed to run in a Termux Linux environment on a phone. This repository is the first working foundation for the architecture described in the project vision: a local execution matrix, in-device ledger, security gate, and a minimal orchestration loop.

## Goals

- Run an offline local control plane on a mobile device
- Use tmux sessions to isolate execution roles
- Keep messaging local with Unix domain sockets (UDS)
- Record compute and task budgets in SQLite
- Audit unsafe code before execution
- Provide a clean upgrade path to multi-agent orchestration

## Project structure

- `launch_event_horizon.sh` – bootstrap the mobile 4-session tmux matrix
- `sword_and_shield_engine.py` – AST security scanner and patcher
- `run_all_tests.sh` – local test runner
- `event_horizon/` – runtime modules for ledger, bus, orchestrator, and security
- `src/store-nanite-ledger.ts` – TypeScript-facing ledger model for future app integration
- `docs/workspace.dsl` – C4 model for architecture-as-code
- `.cursor/rules/event_horizon_rules.mdc` – repo-level invariants
- `CLAUDE.md` – context governance and execution rules

## First milestone

The initial milestone includes:

- Termux bootstrap script for four tmux sessions
- local UDS message bus
- SQLite-backed task ledger with escrow budgets
- AST safety scanning for dangerous execution patterns
- safe subprocess execution wrapper
- minimal orchestrator loop for local task flow
- CI workflow and tests

## Running tests

```bash
bash run_all_tests.sh
```

## Quick start

```bash
chmod +x launch_event_horizon.sh run_all_tests.sh
./launch_event_horizon.sh
```

## Safety notes

This project intentionally enforces strict execution guardrails:

- no raw `os.system` execution paths
- no `eval`/`exec` style code execution
- subprocess calls must use argument lists, not shell-joined strings
- memory and battery checks are treated as first-class concerns

## License

MIT
