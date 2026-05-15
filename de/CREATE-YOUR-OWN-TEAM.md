# Eigene KI-Team-Struktur erstellen

Dieses Paket ist ein sauberer deutscher Grundbaukasten. Du kannst daraus deine eigene KI-Agenten-Teamstruktur bauen.

## Prinzip

Jeder Agent ist ein Workspace mit sieben Kern-Dateien:

- `IDENTITY.md` — Name, Rolle, Grenzen
- `AGENTS.md` — Arbeitsregeln, Antwortstil, Onboarding
- `SOUL.md` — Ton, Haltung, Verhalten
- `USER.md` — Kontext des Kunden/Projekts
- `MEMORY.md` — dauerhafte Entscheidungen und Learnings
- `TOOLS.md` — lokale Tools, Links, Besonderheiten
- `HEARTBEAT.md` — regelmäßige Checks, falls nötig

## Neue Rolle erstellen

Beispiel: Sales-Agent.

```bash
cp -R de/agents/marketer de/agents/sales
```

Dann anpassen:

1. `de/agents/sales/IDENTITY.md` — Name: Sales Berater, Rolle, Emoji.
2. `de/agents/sales/AGENTS.md` — Aufgaben, Grenzen, Übergaben.
3. `de/agents/sales/SOUL.md` — Ton: direkt, beratend, nicht pushy.
4. `de/agents/sales/USER.md` — welche Kundendaten Sales braucht.
5. Danach installieren:

```bash
./install-de.sh --overwrite
```

## Qualitätscheck für Premium-Agenten

Ein guter Agent hat:

- eine klare Rolle
- klare Grenzen
- einen Onboarding-Flow
- konkrete Übergaben an andere Agenten
- kurze Standardantworten
- keine privaten Daten im Template
- keine Tokens oder Passwörter in Dateien

## Empfehlung

Starte mit 5-6 Rollen. Mehr Agenten sind nicht automatisch besser. Ein kleines, klares Team wirkt professioneller als 20 schwammige Rollen.
