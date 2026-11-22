# fs01 — file server

**Last verified**: 2026-11-22 (live)

| | |
|---|---|
| Role | SMB file shares for the office |
| IP | 192.0.2.10 |
| OS | Debian 13 |
| Admin login | in the password manager, entry "fs01 admin" |

## Disks
| Disk | Size | Status | Shares |
|---|---|---|---|
| 1 | 4 TB | OK | home |
| 2 | 4 TB | **Failing** (14 reallocated sectors, 2026-11-22). Replacement ordered | none |
| 3 | 8 TB | OK | scans, shared |

## Monitoring
Weekly SMART check, Monday 07:00, posts to #alerts when reallocated sectors rise.
