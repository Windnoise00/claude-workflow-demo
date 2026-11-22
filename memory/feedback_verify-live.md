---
name: feedback-verify-live
description: Prove network/security changes on the live system (real query, packet capture), not by config review
metadata:
  type: feedback
---

After a change, test the real behaviour: a real DNS query, a file copy timing, `tcpdump`, a login.

**Why:** a config can be correct on disk and not applied, or overridden somewhere else.

**How to apply:** report "verified live: <test + result>". If it can't be tested, say so plainly.
