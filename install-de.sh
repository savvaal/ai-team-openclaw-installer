#!/usr/bin/env bash
set -euo pipefail

OVERWRITE=0
if [[ "${1:-}" == "--overwrite" ]]; then
  OVERWRITE=1
elif [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  cat <<'HELP'
Deutscher AI-Team Installer für OpenClaw

Usage:
  ./install-de.sh              Installiert fehlende deutsche Agenten-Dateien
  ./install-de.sh --overwrite  Erstellt Backups und ersetzt bestehende Dateien

Optional:
  OPENCLAW_DIR=/custom/path/.openclaw ./install-de.sh
HELP
  exit 0
elif [[ -n "${1:-}" ]]; then
  echo "Unbekannte Option: $1" >&2
  echo "Nutze: ./install-de.sh --help" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$ROOT_DIR/de/agents"
OPENCLAW_DIR="${OPENCLAW_DIR:-$HOME/.openclaw}"
BACKUP_DIR="$OPENCLAW_DIR/backups/ai-team-de-$(date +%Y%m%d-%H%M%S)"

if ! command -v openclaw >/dev/null 2>&1; then
  echo "Warnung: 'openclaw' wurde im PATH nicht gefunden. Installiere OpenClaw zuerst oder prüfe deinen PATH."
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Fehler: $SOURCE_DIR nicht gefunden." >&2
  exit 1
fi

mkdir -p "$OPENCLAW_DIR"
echo "Installiere deutsches AI-Team nach: $OPENCLAW_DIR"

copy_file() {
  local src="$1"
  local dst="$2"

  if [[ -f "$dst" && "$OVERWRITE" -ne 1 ]]; then
    echo "  behalte vorhandene Datei: $(basename "$dst")"
    return 0
  fi

  if [[ -f "$dst" && "$OVERWRITE" -eq 1 ]]; then
    local rel="${dst#$OPENCLAW_DIR/}"
    mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
    cp "$dst" "$BACKUP_DIR/$rel"
    echo "  Backup + ersetze: $(basename "$dst")"
  else
    echo "  füge hinzu: $(basename "$dst")"
  fi

  cp "$src" "$dst"
}

install_agent() {
  local agent="$1"
  local src_dir="$SOURCE_DIR/$agent"
  local target="$OPENCLAW_DIR/workspace-$agent"

  echo "→ Installiere $agent"
  mkdir -p "$target"
  for src in "$src_dir"/*.md; do
    [[ -f "$src" ]] || continue
    copy_file "$src" "$target/$(basename "$src")"
  done
}

for dir in "$SOURCE_DIR"/*; do
  [[ -d "$dir" ]] || continue
  install_agent "$(basename "$dir")"
done

echo ""
echo "Fertig. Wenn OpenClaw bereits läuft, starte den Gateway neu:"
echo "  openclaw gateway restart"
if [[ "$OVERWRITE" -eq 1 && -d "$BACKUP_DIR" ]]; then
  echo "Backup gespeichert unter: $BACKUP_DIR"
fi
