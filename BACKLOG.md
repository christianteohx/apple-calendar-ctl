# Apple Calendar CLI — Backlog

## 🔴 High Priority (MVP)

### calctl list
**Why:** First command users expect — see which calendars exist.

**Items:**
- [ ] `--json` / `--plain` / `--quiet` output formats
- [ ] Filter by calendar name

**GitHub Issue:** TBD
**Status:** in-progress

### calctl today / tomorrow / week / \<date\>
**Why:** Core query interface — mirror remindctl's query style exactly.

**Items:**
- [ ] `today` — all events today
- [ ] `tomorrow` — all events tomorrow
- [ ] `week` — this week
- [ ] `YYYY-MM-DD` — specific date
- [ ] `--calendar <name>` filter
- [ ] `--json` / `--plain` / `--quiet`

**GitHub Issue:** TBD
**Status:** in-progress

### calctl add
**Why:** Create events — the main write operation.

**Items:**
- [ ] `--title` (required)
- [ ] `--calendar <name>` (default: default calendar)
- [ ] `--start "YYYY-MM-DD HH:mm"` (required)
- [ ] `--end "YYYY-MM-DD HH:mm"` (required)
- [ ] `--all-day`
- [ ] `--notes <text>`
- [ ] `--location <text>`
- [ ] `--json` / `--plain` output on success

**GitHub Issue:** TBD
**Status:** in-progress

### calctl edit
**Why:** Update existing events.

**Items:**
- [ ] `--id <event-id>` (required)
- [ ] `--title`, `--start`, `--end`, `--notes`, `--location`
- [ ] `--json` output on success

**GitHub Issue:** TBD
**Status:** in-progress

### calctl delete
**Why:** Remove events.

**Items:**
- [ ] `--id <event-id>` (required)
- [ ] `--force` (skip confirmation)
- [ ] Confirmation prompt without `--force`

**GitHub Issue:** TBD
**Status:** in-progress

### Permission handling
**Why:** Without proper auth, nothing works.

**Items:**
- [ ] Detect current auth status via `EKEventStore.authorizationStatus(for: .event)`
- [ ] Show clear instructions when `accessDenied`
- [ ] `--status` command to check auth state

**GitHub Issue:** TBD
**Status:** in-progress

---

## 🟡 Medium (Post-MVP)

### Recurring events (RRULE)
**Why:** Users need weekly recurring classes and work shifts.

**Items:**
- [ ] `--repeat weekly` / `--repeat daily`
- [ ] `--until YYYY-MM-DD` for end date
- [ ] Test with CS 498 GenAI class schedule

**GitHub Issue:** TBD
**Status:** backlog

### calctl move
**Why:** Move event to different calendar or reschedule.

**Items:**
- [ ] `--id <event-id> --calendar <name>`
- [ ] `--id <event-id> --start <new-time>`

**GitHub Issue:** TBD
**Status:** backlog

### calctl find / search
**Why:** Search across all calendars for keyword.

**Items:**
- [ ] `calctl find "meeting"`
- [ ] `--calendar <name>` scope filter

**GitHub Issue:** TBD
**Status:** backlog

### Homebrew tap
**Why:** Distribution — one-command install like remindctl.

**Items:**
- [ ] Create `Formula/calctl.rb` for steipete/homebrew-tap
- [ ] Add to README install instructions

**GitHub Issue:** TBD
**Status:** backlog

---

## 🟢 Backlog (Nice to Have)

### Bash/zsh completion
**Why:** Discoverability of subcommands.

### Timezone handling
**Why:** Events might need specific TZ.

**Items:**
- [ ] `--timezone America/Chicago`
- [ ] Store TZ in EKEvent.timeZone

### Export to ICS
**Why:** Portability of calendar data.

### Swift 6 strict concurrency
**Why:** Modern Swift hygiene.

---

## ✅ Completed

- [x] Project structure created in ClawSecondBrain/1_Projects/apple-calendar-ctl/
- [x] Architecture designed (CalendarCore + CalendarCLI split)
- [x] remindctl cloned to /tmp/remindctl/ for reference

---

*Last updated: 2026-04-10*
