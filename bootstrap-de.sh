#!/usr/bin/env bash
set -euo pipefail

OVERWRITE=0
if [[ "${1:-}" == "--overwrite" ]]; then
  OVERWRITE=1
elif [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  cat <<'HELP'
Premium KI-Team Bootstrap für OpenClaw (Deutsch)

Eine Kommando-Installation:
  1) prüft/installiert OpenClaw
  2) installiert das deutsche KI-Team
  3) zeigt die nächsten Schritte

Usage:
  ./bootstrap-de.sh              Sicher installieren, vorhandene Agenten-Dateien behalten
  ./bootstrap-de.sh --overwrite  Backups erstellen und Agenten-Dateien ersetzen
HELP
  exit 0
elif [[ -n "${1:-}" ]]; then
  echo "Unbekannte Option: $1" >&2
  echo "Nutze: ./bootstrap-de.sh --help" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Premium KI-Team für OpenClaw — Deutsch"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if ! command -v openclaw >/dev/null 2>&1; then
  echo "OpenClaw wurde nicht gefunden. Ich installiere OpenClaw jetzt über den offiziellen Installer."
  echo "Quelle: https://openclaw.ai/install.sh"
  echo ""
  if ! command -v curl >/dev/null 2>&1; then
    echo "Fehler: curl ist nicht installiert. Bitte curl installieren und erneut starten." >&2
    exit 1
  fi
  curl -fsSL https://openclaw.ai/install.sh | bash -s -- --no-onboard
else
  echo "✓ OpenClaw ist bereits installiert: $(command -v openclaw)"
fi

echo ""
echo "Installiere deutsches Premium KI-Team ..."
if [[ "$OVERWRITE" -eq 1 ]]; then
  ./install-de.sh --overwrite
else
  ./install-de.sh
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Installation abgeschlossen"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Nächste Schritte:"
echo "1) Starte/öffne OpenClaw und schließe das Onboarding ab, falls noch nicht passiert."
echo "2) Falls OpenClaw schon lief, starte den Gateway neu:"
echo "   openclaw gateway restart"
echo "3) Fülle pro Agent die USER.md aus, damit die Antworten kundenspezifisch werden."
echo ""
echo "Installierte Rollen: Koordinator, Techniker, Marketer, Produzent, Texter, Designer."
