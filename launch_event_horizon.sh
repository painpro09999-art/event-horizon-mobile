#!/usr/bin/env bash
set -euo pipefail

if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux is required. Install it in Termux using: pkg install tmux"
  exit 1
fi

SESSION="event_horizon"

if tmux has-session -t "$SESSION" 2>/dev/null; then
  echo "Session '$SESSION' already exists. Reusing it."
else
  tmux new-session -d -s "$SESSION" -n core
  tmux send-keys -t "$SESSION:core" "cd \"$(pwd)\" && python3 -m event_horizon.orchestrator serve --socket /tmp/event_horizon.sock" C-m

  tmux new-window -t "$SESSION" -n governor
  tmux send-keys -t "$SESSION:governor" "cd \"$(pwd)\" && python3 -c 'import time; print(\"Governor active\"); time.sleep(600)'" C-m

  tmux new-window -t "$SESSION" -n orchestrator
  tmux send-keys -t "$SESSION:orchestrator" "cd \"$(pwd)\" && python3 -c 'import time; print(\"Orchestrator active\"); time.sleep(600)'" C-m

  tmux new-window -t "$SESSION" -n ledger
  tmux send-keys -t "$SESSION:ledger" "cd \"$(pwd)\" && python3 -c 'import time; print(\"Ledger active\"); time.sleep(600)'" C-m
fi

tmux attach -t "$SESSION"
