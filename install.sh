#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPENCLAW_DIR="${OPENCLAW_DIR:-$HOME/.openclaw}"

echo "Installing AI Team into: $OPENCLAW_DIR"
mkdir -p "$OPENCLAW_DIR"

install_agent() {
  local agent="$1"
  local target="$OPENCLAW_DIR/workspace-$agent"
  if [ "$agent" = "default" ]; then
    target="$OPENCLAW_DIR/workspace"
  fi

  echo "→ $agent -> $target"
  mkdir -p "$target"
  cp -R "$ROOT_DIR/agents/$agent/." "$target/"
}

for dir in "$ROOT_DIR"/agents/*; do
  [ -d "$dir" ] || continue
  agent="$(basename "$dir")"
  install_agent "$agent"
done

echo ""
echo "Done. If OpenClaw is already running, restart the Gateway or reload agents if needed."
