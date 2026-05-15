#!/usr/bin/env bash
set -euo pipefail

OVERWRITE=0
if [[ "${1:-}" == "--overwrite" ]]; then
  OVERWRITE=1
elif [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  cat <<'HELP'
AI Team for OpenClaw installer

Usage:
  ./install.sh              Install missing agent files, keep existing files
  ./install.sh --overwrite  Backup and replace existing agent files

Optional env:
  OPENCLAW_DIR=/custom/path/.openclaw ./install.sh
HELP
  exit 0
elif [[ -n "${1:-}" ]]; then
  echo "Unknown option: $1" >&2
  echo "Run: ./install.sh --help" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPENCLAW_DIR="${OPENCLAW_DIR:-$HOME/.openclaw}"
BACKUP_DIR="$OPENCLAW_DIR/backups/ai-team-$(date +%Y%m%d-%H%M%S)"

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is not installed or not in PATH." >&2
  exit 1
fi

if ! command -v openclaw >/dev/null 2>&1; then
  echo "Warning: openclaw command not found. Install OpenClaw first, then run this installer."
  echo "Continuing anyway because some installs may use a different PATH."
fi

if [[ ! -d "$ROOT_DIR/agents" ]]; then
  echo "Error: agents directory not found next to install.sh" >&2
  exit 1
fi

echo "Installing AI Team into: $OPENCLAW_DIR"
mkdir -p "$OPENCLAW_DIR"

copy_file() {
  local src="$1"
  local dst="$2"

  if [[ -f "$dst" && "$OVERWRITE" -ne 1 ]]; then
    echo "  keep existing $(basename "$dst")"
    return 0
  fi

  if [[ -f "$dst" && "$OVERWRITE" -eq 1 ]]; then
    local rel="${dst#$OPENCLAW_DIR/}"
    mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
    cp "$dst" "$BACKUP_DIR/$rel"
    echo "  backup + replace $(basename "$dst")"
  else
    echo "  add $(basename "$dst")"
  fi

  cp "$src" "$dst"
}

install_agent() {
  local agent="$1"
  local source_dir="$ROOT_DIR/agents/$agent"
  local target="$OPENCLAW_DIR/workspace-$agent"

  echo "→ Installing $agent"
  mkdir -p "$target"

  for src in "$source_dir"/*.md; do
    [[ -f "$src" ]] || continue
    copy_file "$src" "$target/$(basename "$src")"
  done
}

for dir in "$ROOT_DIR"/agents/*; do
  [[ -d "$dir" ]] || continue
  install_agent "$(basename "$dir")"
done

echo ""
echo "Done."
if [[ "$OVERWRITE" -eq 1 && -d "$BACKUP_DIR" ]]; then
  echo "Backup saved to: $BACKUP_DIR"
fi

echo ""
echo "Next step: restart OpenClaw Gateway if it is already running:"
echo "  openclaw gateway restart"
