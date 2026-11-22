---
name: project-fileserver
description: fs01 disk 2 failing (2026-11-22); scans share moved to disk 3; weekly SMART alert
metadata:
  type: project
---

`fs01` (192.0.2.10) disk 2 showed 14 reallocated sectors on 2026-11-22. `scans` share moved to disk 3 (approved, verified: 2 GB read 71 s → 19 s).
Replacement disk ordered by the user. Weekly SMART check posts to #alerts.

**Why:** remember the disk is on its way out until it's swapped.
**How to apply:** don't put new shares on disk 2. Full detail: docs-repo `hosts/fileserver/00-overview.md`. See [[feedback-verify-live]].
