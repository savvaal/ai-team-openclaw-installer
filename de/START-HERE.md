# Start hier — Premium KI-Team installieren

Dieses Paket ist für Kunden gedacht, die sich eine eigene deutschsprachige KI-Team-Struktur in OpenClaw installieren wollen.

## Option A — Eine Kommando-Installation

```bash
git clone https://github.com/savvaal/ai-team-openclaw-installer.git
cd ai-team-openclaw-installer
./bootstrap-de.sh
```

Der Bootstrap prüft, ob OpenClaw installiert ist. Falls nicht, nutzt er den offiziellen OpenClaw-Installer und installiert danach das deutsche KI-Team.

## Option B — OpenClaw zuerst, Team danach

```bash
curl -fsSL https://openclaw.ai/install.sh | bash
```

Danach:

```bash
git clone https://github.com/savvaal/ai-team-openclaw-installer.git
cd ai-team-openclaw-installer
./install-de.sh
openclaw gateway restart
```

## Welche Agenten du bekommst

- **Koordinator** — macht aus Chaos Prioritäten, Aufgaben und nächste Schritte.
- **Techniker** — Terminal, APIs, Automationen, Deployments, Fehlersuche.
- **Marketer** — Positionierung, Funnel, Content, Traffic, Conversion.
- **Produzent** — Produkt, Angebot, Preis, Launch, Kundenergebnis.
- **Texter** — Hooks, Posts, E-Mails, Landingpages, Skripte.
- **Designer** — Visuals, Layouts, Präsentationen, Landingpage-Klarheit.

## Nach der Installation

1. Öffne OpenClaw.
2. Prüfe die Agenten-Workspaces unter `~/.openclaw/workspace-*`.
3. Fülle in jedem relevanten Workspace die `USER.md` aus.
4. Starte mit dem Koordinator: „Was ist jetzt der wichtigste nächste Schritt?“
