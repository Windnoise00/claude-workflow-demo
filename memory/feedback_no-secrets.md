---
name: feedback-no-secrets
description: Never write a secret value into memory or a repo; record type + location; leak fix = rotate
metadata:
  type: feedback
---

Write "admin password: in the password manager", never the password.

**Why:** memory is sent to the AI provider every session and pushed to git.

**How to apply:**
- Human secrets live in the password manager; the user types them. Machine tokens live in a root-only file, referenced by path.
- `.githooks/pre-commit` blocks secret-shaped added lines. Fix by rewording, never `--no-verify`.
- A secret that reached git must be rotated: deleting it leaves it in history.
