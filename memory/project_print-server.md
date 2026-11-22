---
name: project-print-server
description: Print server driver trap - never auto-update the Ricoh driver
metadata:
  type: project
---

`ps01` (192.0.2.20) runs the Ricoh universal driver pinned at the version in the docs.

**Why:** a newer driver broke stapling on the staffroom copier (2026-09).
**How to apply:** leave driver updates off; test any update on one queue first.
