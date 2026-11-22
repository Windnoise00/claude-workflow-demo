# How it works

## 1. Session start

- A Claude Code **SessionStart hook** runs `memory-sync.sh start`: `git pull` on the memory repo.
- Claude Code loads `memory/MEMORY.md` (the index, one line per note) into its context.
- In a docs repo, it also loads that repo's `CLAUDE.md` (rules for the AI: which doc to trust, where facts live).
- Only the index is loaded up front. Claude opens a full note when a line looks relevant: cheap on context.

## 2. The change loop

| Step | Who | What happens |
|---|---|---|
| 1. Ask | me | Plain request: "the file share feels slow" |
| 2. Look | Claude | Read-only checks only: logs, status, configs, dry runs. No approval needed |
| 3. Propose | Claude | Numbered list: what, why, what could go wrong, how to undo |
| 4. Approve | me | Yes / no **per item**. A yes to item 1 is not a yes to item 2 |
| 5. Change | Claude | Only what was approved, nothing wider |
| 6. Verify | Claude | Prove it on the live system (a real test, not "the config looks right") |
| 7. Document | Claude | Update the docs repo + memory, commit, push |

If the result is wrong at step 6, it goes back to step 3 with what was learned.

## 3. Session end

- A **SessionEnd hook** runs `memory-sync.sh end`: commit any memory changes, pull, push.
- A **pre-commit hook** scans the added lines for anything secret-shaped and blocks the commit if found.
- The next session on any machine pulls those notes first. Same memory everywhere.

## Memory vs docs

| | Memory | Docs repo |
|---|---|---|
| Audience | the AI | humans first, AI second |
| Size | one fact per file, a few lines | full write-ups, inventories, runbooks |
| Holds | preferences, rules, traps, pointers | how the systems are built and run |
| Loaded | index every session | on demand |

Rule of thumb: if it's "how to work with me" or "a trap to remember", it's memory.
If it's "how the system works", it's docs, and memory just points at it.
