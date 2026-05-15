# Deutsches AI-Team für OpenClaw

Diese Variante installiert dieselbe Agenten-Struktur wie das Hauptpaket, aber mit deutschen Rollen, Beschreibungen und Onboarding-Fragen.

## Installation

```bash
git clone https://github.com/savvaal/ai-team-openclaw-installer.git
cd ai-team-openclaw-installer
./install-de.sh
openclaw gateway restart
```

Wenn vorhandene Agenten-Dateien ersetzt werden sollen:

```bash
./install-de.sh --overwrite
```

## Enthaltene Agenten

- Koordinator
- Techniker
- Marketer
- Produzent
- Texter
- Designer

## Eigenes KI-Team erstellen

1. Kopiere einen bestehenden Ordner aus `de/agents/<rolle>`.
2. Benenne den Ordner nach der neuen Rolle, z. B. `sales` oder `support`.
3. Passe `IDENTITY.md` an: Name, Rolle, Emoji, Grenzen.
4. Passe `AGENTS.md` an: Aufgaben, Antwortstil, Übergaben an andere Agenten.
5. Lass `USER.md`, `MEMORY.md`, `TOOLS.md` und `HEARTBEAT.md` als leere Templates für den Kunden.
6. Starte `./install-de.sh --overwrite`, wenn die neue Struktur installiert werden soll.
