# AI Team for OpenClaw

Готовая команда ИИ-агентов для OpenClaw: координатор, технарь, маркетолог, продюсер, копирайтер, дизайнер.

## Установка

```bash
git clone <YOUR_GITHUB_REPO_URL> ai-team
cd ai-team
./install.sh
```

После установки перезапустите OpenClaw Gateway, если агенты не появились автоматически.

## Что устанавливается

Файлы агентов копируются в `~/.openclaw/workspace-*`:

- `workspace-coordinator`
- `workspace-tech`
- `workspace-marketer`
- `workspace-producer`
- `workspace-copywriter`
- `workspace-designer`

## Безопасность

В пакет не входят личная память, история переписок, токены, PDF/ZIP/PNG и рабочие файлы владельца.
Перед публикацией всё равно проверьте содержимое репозитория.
