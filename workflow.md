---
tags: [project, workflow]
created: 2026-04-10
modified: 2026-04-10
status: #seed
---

# Apple Calendar CLI — Workflow

## Before Working
1. Read `summary.md`, `architecture.md`, `decisions.md`, `failures.md`, `BACKLOG.md`
2. Check remindctl source at `/tmp/remindctl/` for reference patterns

## Build Steps (MVP Order)

### Phase 1 — Foundation
1. [ ] Create `Package.swift` with CalendarCore + CalendarCLI targets
2. [ ] Create `CalendarCore/Errors.swift` — CalendarError enum
3. [ ] Create `CalendarCore/Models.swift` — CalendarEvent, EventDraft, EventUpdate, CalendarList
4. [ ] Create `CalendarCore/CalendarCore.swift` — CalendarEventsStore actor
5. [ ] Verify: `swift build` succeeds, no linker errors

### Phase 2 — CLI Layer
6. [ ] Create `CalendarCLI/main.swift` — entry point + Commander setup
7. [ ] Create `CalendarCLI/OutputFormatting.swift` — JSON/Plain/Quiet formatters
8. [ ] Create `CalendarCLI/PermissionsHelp.swift` — permission error UX
9. [ ] Create `CalendarCLI/Commands/ListCommand.swift`
10. [ ] Create `CalendarCLI/Commands/QueryCommand.swift` (today/tomorrow/week/date)
11. [ ] Create `CalendarCLI/Commands/AddCommand.swift`
12. [ ] Create `CalendarCLI/Commands/EditCommand.swift`
13. [ ] Create `CalendarCLI/Commands/DeleteCommand.swift`

### Phase 3 — Testing & Polish
14. [ ] Test manually: list calendars, query events, add event
15. [ ] Test with `--json` output
16. [ ] Test permission denied flow
17. [ ] Run `swift test`
18. [ ] Build release binary
19. [ ] Create `README.md`

## Conventions
- Swift 6, strict concurrency (Sendable, actor isolation)
- CalendarCore: ZERO external dependencies
- CalendarCLI: only Commander for arg parsing
- CalendarCore is actor-isolated; no `@unchecked Sendable`
- Follow remindctl code style exactly

## If Stuck
Reference remindctl at `/tmp/remindctl/`:
- `Sources/RemindCore/EventKitStore.swift` — event store pattern
- `Sources/remindctl/CommandSpec.swift` — command spec pattern
- `Sources/remindctl/OutputFormatting.swift` — output format pattern

---

*Last updated: 2026-04-10*
