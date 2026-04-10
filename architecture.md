# Apple Calendar CLI — Architecture

**Date:** 2026-04-10

## File Tree

```
apple-calendar-ctl/
├── Package.swift                    ← Swift package manifest
├── README.md                        ← User-facing docs
├── SPEC.md                          ← Command interface spec
├── Sources/
│   ├── CalendarCore/               ← Shared EventKit logic (no external deps)
│   │   ├── CalendarCore.swift      ← Actor-based EventKit store
│   │   ├── Models.swift            ← CalendarEvent, CalendarList, structs
│   │   └── Errors.swift            ← CalendarError enum
│   ├── CalendarCLI/                ← CLI layer (depends on CalendarCore)
│   │   ├── main.swift              ← CLI entry point
│   │   ├── CommandSpec.swift       ← Command descriptors
│   │   ├── CommandRouter.swift     ← Command routing
│   │   ├── OutputFormatting.swift ← --json / --plain / --quiet formatters
│   │   └── PermissionsHelp.swift  ← Permission error messages
│   └── CalendarCLI/Commands/       ← Per-command files
│       ├── ListCommand.swift
│       ├── QueryCommand.swift      ← default "today/tomorrow/week" etc
│       ├── AddCommand.swift
│       ├── EditCommand.swift
│       └── DeleteCommand.swift
└── Tests/
    └── CalendarCoreTests/          ← Unit tests
```

## Technical Design

### CalendarCore (Actor, no external dependencies)
- `CalendarEventsStore` — Swift actor wrapping `EKEventStore`
  - `requestAccess()` — async EventKit authorization
  - `calendars()` — list available calendars
  - `events(in:startDate:endDate)` — fetch events
  - `createEvent(_ draft: EventDraft)` — create via EKEvent
  - `updateEvent(id: String, update: EventUpdate)` — update
  - `deleteEvent(id: String)` — delete
  - Uses `.event` calendar type (not `.reminder`)
- Models: `CalendarEvent`, `CalendarList`, `EventDraft`, `EventUpdate`
- Errors: `CalendarError.accessDenied`, `.eventNotFound`, `.calendarNotFound`, etc.

### CalendarCLI (Depends on CalendarCore)
- Uses `Commander` for CLI argument parsing (same as remindctl)
- No business logic here — just argument parsing + delegation
- Output formatters: `--json` → Codable JSON, `--plain` → TSV, `--quiet` → counts

### Key Differences from Remindctl
| Aspect | Remindctl | This Project |
|--------|-----------|-------------|
| Calendar type | `.reminder` | `.event` |
| Recurring events | N/A (Reminders don't have RRULE) | EKEvent.recurrenceRule |
| All-day events | N/A | EKEvent.isAllDay |
| Calendar selection | list filter | `--calendar` flag |
| Time zone | per-event | stored in EKEvent |

### Dependencies
```swift
// Package.swift
dependencies: [
  .package(url: "https://github.com/steipete/Commander.git", from: "0.2.0"),
]
```
CalendarCore has ZERO dependencies — just EventKit + Foundation.

### Build Target
```swift
targets: [
  .target(name: "CalendarCore", linkerSettings: [.linkedFramework("EventKit")]),
  .executableTarget(name: "calendarctl", dependencies: ["CalendarCore", .product(name: "Commander", ...)])
]
```

---

*Last updated: 2026-04-10*
