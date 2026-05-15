# AI Team for OpenClaw

Готовая команда ИИ-агентов для OpenClaw: координатор, технарь, маркетолог, продюсер, копирайтер и дизайнер.

## Для кого

Для нового клиента, который хочет быстро поставить себе готовую структуру ИИ-команды на свой компьютер.

## Требования

- macOS или Linux
- установленный OpenClaw
- `git` в терминале

Проверка:

```bash
openclaw --version
git --version
```

## Установка по ссылке GitHub

```bash
git clone <GITHUB_REPO_URL> ai-team-openclaw
cd ai-team-openclaw
./install.sh
```

Если нужно перезаписать уже существующие файлы агентов:

```bash
./install.sh --overwrite
```

## Что установится

Скрипт создаст/обновит папки:

- `~/.openclaw/workspace-coordinator`
- `~/.openclaw/workspace-tech`
- `~/.openclaw/workspace-marketer`
- `~/.openclaw/workspace-producer`
- `~/.openclaw/workspace-copywriter`
- `~/.openclaw/workspace-designer`

В каждую папку будут добавлены:

- `AGENTS.md` — роль и рабочие правила агента
- `IDENTITY.md` — короткое описание агента
- `SOUL.md` — стиль общения
- `USER.md` — шаблон пользовательского контекста
- `MEMORY.md` — пустая рабочая память
- `TOOLS.md` — пустые локальные заметки
- `HEARTBEAT.md` — пустые периодические задачи

## После установки

Если OpenClaw уже запущен, перезапустите Gateway:

```bash
openclaw gateway restart
```

Потом откройте OpenClaw и проверьте, что агенты появились.

## Безопасность

В репозитории нет личной памяти владельца, переписок, токенов, ключей, PDF/ZIP/PNG и рабочих файлов.

## Deutsche Version

Für Kunden, die direkt eine deutsche KI-Team-Struktur installieren wollen:

```bash
git clone https://github.com/savvaal/ai-team-openclaw-installer.git
cd ai-team-openclaw-installer
./install-de.sh
openclaw gateway restart
```

Mehr dazu: [`de/README.md`](de/README.md).
