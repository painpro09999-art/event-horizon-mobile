# Event Horizon Mobile

## WHAT
The local mobile control plane is a zero-budget runtime for secure, offline task orchestration on a phone. It must keep execution local, avoid cloud dependencies, and respect memory and thermal limits.

## HOW
- Run a four-session tmux matrix on Termux
- Use Unix domain sockets for local IPC
- Store task and compute escrow state in SQLite
- Enforce execution safety through AST scanning and safe subprocess execution
- Keep orchestration modular, testable, and resource-aware

## WHY
This architecture is optimized for constrained devices. It reduces attack surface, minimizes charging and network dependencies, and preserves a deterministic local execution model.

## FEEDBACK
- Prefer simple, auditable code over clever abstractions.
- Keep every execution path containment-safe.
- Validate resource budgets before task dispatch.
- Fail closed when security checks detect unsafe execution.
