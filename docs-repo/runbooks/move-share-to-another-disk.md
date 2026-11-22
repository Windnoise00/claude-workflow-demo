# Move a share to another disk

**Last verified**: 2026-11-22

1. Tell users the share will be read-only for ~20 minutes.
2. Set the share read-only in `smb.conf`, `systemctl reload smbd`.
3. `rsync -aHAX --info=progress2 /srv/disk2/scans/ /srv/disk3/scans/`
4. Second rsync pass to catch late changes; compare with `rsync -n --delete` (should list nothing).
5. Point the share at the new path, make it writable, reload.
6. Verify from a client: open, write, time a 2 GB read.
7. Keep the old copy one week, then delete (ask first).
