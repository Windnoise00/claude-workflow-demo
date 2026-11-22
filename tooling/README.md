# Tooling

| File | Goes in | Does |
|---|---|---|
| `settings-snippet.json` | `~/.claude/settings.json` | Points Claude Code's memory at the git clone; runs the sync hook at session start/end |
| `hooks/memory-sync.sh` | `~/.claude/hooks/` | Start: `git pull`. End: commit, pull --rebase, push. Never blocks a session; errors go to a log |
| `githooks/pre-commit` | each repo's `.githooks/` + `git config core.hooksPath .githooks` | Blocks commits whose added lines look like a secret |
