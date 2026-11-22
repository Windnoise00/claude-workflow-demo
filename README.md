# Claude Code workflow demo

A **fake, cut-down copy** of how I run Claude Code as an IT assistant. All hosts, IPs, names and services
here are invented (IPs come from the 192.0.2.0/24 documentation range). The structure and the rules are real.

## The idea in one paragraph

Claude Code starts every session with no memory. I give it two things to read:

1. **A memory folder** (`memory/`): short notes about how I like to work, the rules it must follow, and
   one-line pointers to ongoing projects. It's a git repo, synced to every machine I use.
2. **A docs repo** (`docs-repo/`): the proper documentation for the systems: overviews, inventories, runbooks.

Every change follows the same loop: **look → propose → I approve → change → verify live → document**.

```mermaid
flowchart TD
  A[Session start: hook pulls memory] --> B[Load MEMORY.md index + docs CLAUDE.md]
  B --> C[I ask in plain words]
  C --> D[Look: read-only checks]
  D --> E[Propose: numbered list, risk, undo]
  E --> F{I approve? per item}
  F -- no --> E
  F -- yes --> G[Change: only what was approved]
  G --> H[Verify live: real test]
  H --> I{Works?}
  I -- no --> E
  I -- yes --> J[Document: docs repo + memory]
  J --> K[Session end: hook commits]
  K --> L{Looks like a secret?}
  L -- yes --> M[Blocked: reword]
  L -- no --> N[Push: other machines pull next start]
```

Open `diagrams/workflow.excalidraw` at <https://excalidraw.com> (File → Open) for the editable version.

## What's in here

| Path | What it shows |
|---|---|
| [guide/how-it-works.md](guide/how-it-works.md) | The session lifecycle and the change loop, step by step |
| [guide/guardrails.md](guide/guardrails.md) | The safety rules and why each one exists |
| [guide/example-session.md](guide/example-session.md) | A worked example: "the file share is slow" |
| [memory/](memory/) | Sample memory: index + one fact per file |
| [docs-repo/](docs-repo/) | Sample docs repo with its own `CLAUDE.md` rules for the AI |
| [tooling/](tooling/) | The sync hook, the secret-blocking pre-commit guard, the settings snippet |

## What this is *not*

- Not autonomous. Claude can investigate freely, but **every change waits for my yes**.
- Not a place for secrets. Memory and docs record *what kind* of secret and *where it lives*
  (e.g. "in the password manager"), never the value. A git hook blocks commits that look like one.
- Not a place for user data. Ticket contents, student or staff details never go into a hosted AI model.
