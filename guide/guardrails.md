# Guardrails

Each rule is in memory as a `feedback_*.md` note with a **Why** line, so the AI knows the reason, not just the rule.

| Rule | Why it exists |
|---|---|
| **Ask before any change.** Investigate freely, change nothing without a per-item yes | I need to understand and own every change on systems I'm responsible for |
| **No secrets in memory or repos.** Record type + location only | Notes are sent to the AI provider every session and pushed to git |
| **Pre-commit secret guard** on every repo | Rules get forgotten; a hook doesn't. Catches prose like "password is ..." that scanners miss |
| **A leaked secret gets rotated, not just deleted** | Git history keeps the old value |
| **Verify live, not by reading config** | A config can look right and still not be applied |
| **Live state beats the docs** | Docs are dated snapshots; the AI says "verified live" or "per docs dated X" |
| **No user data into hosted models** | Tickets, student/staff details stay out. Work KB = generic how-tos only |
| **One AI session per system** | Two agents changing the same box undo each other |
| **Explain simply, numbered lists** | So I can answer "yes to 1 and 3" |
| **Some actions are blocked outright** by Claude Code's permission mode (DNS, cert, credential reads, irreversible deletes) | Even with my yes; I then do it myself |
