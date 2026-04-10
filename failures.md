# Apple Calendar CLI — Failures

**Date:** 2026-04-10

## Known Risks / Early Lessons

### Risk 1: Recurring Events are Complex
**What:** EKEvent recurrence rules (`.recurrenceRule`) support RRULE syntax but the API surface is large.  
**Mitigation:** MVP version 1.0 will NOT support recurring event creation — only single events. Recurrence can be added in v1.1.  
**Lesson:** Don't try to mirror every Feature of Calendar app in v1. Simple CRUD is enough.

### Risk 2: Calendar Permissions Are Tied to macOS Privacy Settings
**What:** Even with full API access, users must grant "Calendar" permission in System Settings.  
**Mitigation:** Print clear instructions when `accessDenied` fires — include the exact path: System Settings → Privacy & Security → Calendars → Terminal.  
**Lesson:** remindctl's `PermissionsHelp.swift` pattern is good to copy verbatim.

### Risk 3: Multiple Calendar Accounts (iCloud, Exchange, Local)
**What:** EKEventStore may have multiple sources. Events may appear across different calendars.  
**Mitigation:** Default to user's "defaultCalendarForNewEvents()". `--calendar` flag allows filtering.  
**Lesson:** Always test with iCloud calendar active + a secondary local calendar to catch source issues.

---

*Last updated: 2026-04-10*
