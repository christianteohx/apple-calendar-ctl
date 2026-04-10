# Apple Calendar CLI — Decisions

**Date:** 2026-04-10
**Context:** Initial project setup

## Decision 1: Architecture — Split CalendarCore vs CalendarCLI
**Issue:** Should the EventKit wrapper be in the same target as the CLI?  
**Resolution:** Separate into `CalendarCore` (actor, zero deps, EventKit only) and `CalendarCLI` (Commander-based, depends on Core). Enables testing CalendarCore in isolation and keeps CLI layer thin.  
**Alternatives considered:** Single target — rejected because mixing CLI parsing with EventKit logic makes unit testing harder.  
**Lesson:** Follow remindctl's pattern: RemindCore is the pure EventKit layer, remindctl CLI depends on it.

---

## Decision 2: EventKit Authorization — Full Access Required
**Issue:** EventKit supports `.fullAccess` and `.writeOnly` authorization states.  
**Resolution:** Require `.fullAccess` — read access is needed to query and display events. Write-only is insufficient.  
**Lesson:** Always call `requestFullAccessToEvents()` not `requestWriteAccess` for calendar tools.

---

## Decision 3: Output Formats — Mirror remindctl Exactly
**Issue:** What output formats should be supported?  
**Resolution:** `--json` (Codable JSON), `--plain` (TSV), `--quiet` (counts only) — identical to remindctl for familiarity.  
**Lesson:** Consistency with remindctl reduces cognitive overhead for users.

---

## Decision 4: Package Manager — Swift Package Manager
**Issue:** Should use Swift Package Manager (SPM) not CocoaPods or XcodeGen.  
**Resolution:** SPM only — matches remindctl's approach, no extra tooling needed.  
**Lesson:** SPM is now standard for Swift projects; Homebrew taps can build from Package.swift directly.

---

*Last updated: 2026-04-10*
