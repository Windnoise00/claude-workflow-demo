# CLAUDE.md — rules for AI assistants in this repo

Private documentation. Never paste its contents anywhere public.

## Which docs to trust
1. **Live state beats any doc.** Check the live system and say which you did: "verified live" or "per docs, dated X".
2. Each doc starts with `**Last verified**: <date>`. Older = less trust.
3. `archive/` is history only, never current state.

## Where each fact lives (one place only, others link to it)
| Fact | The one place |
|---|---|
| A host's hardware, OS, role | `hosts/<name>/00-overview.md` |
| What a service is and how to run it | `services/<name>.md` |
| Step-by-step fixes that worked | `runbooks/` |

## Writing rules
- Secrets: type + location only.
- Runbooks are written from what actually worked, not from what should work.
