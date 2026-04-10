---
tags: [project, template, workflow]
created: 2026-04-10
modified: 2026-04-10
status: #active
---

# Apple Calendar CLI — Summary

**Date:** 2026-04-10
**Context:** Building a native macOS Swift CLI for Apple Calendar — similar to `remindctl` but for calendar events via EventKit

## What This Is
A Swift CLI tool (`calendarctl`) that provides a command-line interface to Apple Calendar using native EventKit APIs — no AppleScript, no osascript. Inspired directly by [steipete/remindctl](https://github.com/steipete/remindctl).

## Why
User wants to migrate schedule tracking from Obsidian tasks.md → Apple Calendar + Reminders. `remindctl` handles Reminders; no equivalent exists for Calendar events.

## Project Status
🟡 #active — Project structure + architecture in place, implementation ready to begin

## Key Files / File Tree
```
apple-calendar-ctl/
├── summary.md          ← this file
├── architecture.md     ← file tree + technical design
├── decisions.md        ← decision log
├── failures.md         ← lessons learned
├── workflow.md         ← project-specific workflow
├── BACKLOG.md          ← feature backlog
├── Sources/
│   └── calendarctl/
│       ├── CalendarCore/      ← EventKit store (CalendarEventsStore)
│       │   ├── CalendarEventsStore.swift
│       │   ├── Models.swift
│       │   └── Errors.swift
│       └── calendarctl/       ← CLI entry point + commands
│           ├── main.swift
│           ├── Commands/
│           ├── OutputFormatting.swift
│           └── PermissionsHelp.swift
├── Package.swift
└── README.md
```

## Tech Stack
- **Language:** Swift 6.0+
- **Platform:** macOS 14+ (Sonoma)
- **API:** EventKit (EKEventStore, EKEvent, EKCalendar)
- **CLI args:** Commander (same as remindctl)
- **Package manager:** Swift Package Manager

## References
- remindctl source: `/tmp/remindctl/` (cloned for reference)
- EventKit docs: Apple's EKEventStore, EKEvent, EKCalendar frameworks
- steipete/Todo swift package as reference for modern Swift + EventKit

## Next Steps
1. Read remindctl architecture as reference
2. Write SPEC.md with command surface
3. Create Package.swift
4. Implement CalendarCore/Models.swift (EKEvent → CalendarEvent)
5. Implement CalendarEventsStore.swift (EventKit CRUD)
6. Build CLI commands (list, add, edit, delete, query)
7. Build, test, iterate

---

*Last updated: 2026-04-10*
