#!/bin/bash
# memory-sync.sh start|end — shared Claude Code memory via git (2026-09-28).
# Repo: a private git repo, cloned at ~/.claude/memory-repo;
# settings.json "autoMemoryDirectory" points every project at that clone.
#   start (SessionStart): pull the latest (and push anything a failed "end" left behind)
#   end   (SessionEnd):   commit local changes, pull --rebase, push
# Conflicts: newest wins (-X theirs during rebase = this machine's just-written side);
# MEMORY.md merges with merge=union (.gitattributes). Never blocks or fails a session:
# problems go to ~/.claude/memory-sync.log.
R="${CLAUDE_MEMORY_REPO:-$HOME/.claude/memory-repo}"
LOG="$HOME/.claude/memory-sync.log"
cat >/dev/null 2>&1          # drain the hook's JSON on stdin
[ -d "$R/.git" ] || exit 0
cd "$R" || exit 0
log(){ echo "$(date '+%F %T') [$1] $2" >> "$LOG"; }
unstick(){ if [ -d .git/rebase-merge ] || [ -d .git/rebase-apply ]; then git rebase --abort >/dev/null 2>&1; log "$1" "rebase aborted (conflict), local commit kept for next sync"; fi; }
sync_up(){
  timeout 30 git pull -q --rebase -X theirs --autostash >>"$LOG" 2>&1 || { unstick "$1"; log "$1" "pull failed"; return 1; }
  if [ -n "$(git log '@{u}..HEAD' --oneline 2>/dev/null)" ]; then
    timeout 30 git push -q >>"$LOG" 2>&1 || { log "$1" "push failed"; return 1; }
  fi
}
case "$1" in
  start) sync_up start ;;
  end)
    git add -A >/dev/null 2>&1
    git diff --cached --quiet || git commit -q -m "memory: $(hostname -s 2>/dev/null || cat /etc/hostname) $(date '+%F %T')" >>"$LOG" 2>&1
    for i in 1 2 3; do sync_up end && break; sleep 2; done ;;
esac
exit 0
