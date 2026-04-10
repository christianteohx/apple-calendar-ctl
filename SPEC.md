# SPEC.md — apple-calendar-ctl CLI Grammar

**Version:** 1.0 (MVP)
**Last updated:** 2026-04-10

---

## Global Flags

| Flag | Description |
|------|-------------|
| `--json` | JSON output |
| `--plain` | Plain text output (default) |
| `--quiet` | Count-only output |
| `--calendar <name>` | Filter by calendar |

---

## Command: `status`

Check calendar authorization status. No calendar access required.

```
calendarctl status
```

**Output:** One of:
- `authorized` — Full access granted
- `denied` — Access denied
- `writeOnly` — Write-only access
- `notDetermined` — No prompt shown yet

**Exit codes:** 0 = authorized, 1 = not authorized.

---

## Command: `authorize`

Trigger the macOS calendar access prompt.

```
calendarctl authorize
```

**Exit codes:** 0 = granted, 1 = denied or error.

---

## Command: `list`

List all calendars.

```
calendarctl list [--json]
```

---

## Command: `today`

Show all events for today.

```
calendarctl today [--calendar <name>] [--json] [--plain] [--quiet]
```

---

## Command: `tomorrow`

Show all events for tomorrow.

```
calendarctl tomorrow [--calendar <name>] [--json] [--plain] [--quiet]
```

---

## Command: `week`

Show all events for the current week (Monday–Sunday).

```
calendarctl week [--calendar <name>] [--json] [--plain] [--quiet]
```

---

## Command: `date`

Show events for a specific date.

```
calendarctl date <YYYY-MM-DD> [--calendar <name>] [--json]
```

**Example:**
```bash
calendarctl date 2026-04-15 --calendar "Work"
```

---

## Command: `add`

Create a new calendar event.

```
calendarctl add --title <text> --start <"YYYY-MM-DD HH:mm"> --end <"YYYY-MM-DD HH:mm">
                   [--calendar <name>] [--all-day] [--notes <text>] [--location <text>]
```

**Required:**
| Argument | Description |
|----------|-------------|
| `--title` | Event title |
| `--start` | `"YYYY-MM-DD HH:mm"` |
| `--end` | `"YYYY-MM-DD HH:mm"` |

**Optional:**
| Argument | Description |
|----------|-------------|
| `--calendar <name>` | Target calendar (default: system default) |
| `--all-day` | All-day event |
| `--notes <text>` | Event notes |
| `--location <text>` | Event location |

**Examples:**
```bash
# Timed event
calendarctl add --title "Standup" --start "2026-04-11 09:00" --end "2026-04-11 09:30"

# All-day event
calendarctl add --title "Conference Day" --start "2026-05-15" --end "2026-05-15" --all-day
```

**Output:** `Created: <title> (<event-id>)`

---

## Command: `edit`

Update an existing event.

```
calendarctl edit --id <event-id> [--title <text>] [--start <"YYYY-MM-DD HH:mm">]
                 [--end <"YYYY-MM-DD HH:mm">] [--calendar <name>]
                 [--notes <text>] [--location <text>]
```

**Required:** `--id <event-id>`

**At least one field must be provided.**

**Example:**
```bash
calendarctl edit --id ABC123XYZ --title "Updated Title" --start "2026-04-11 10:00"
```

**Output:** `Updated: <title> (<event-id>)`

---

## Command: `delete`

Delete an event.

```
calendarctl delete --id <event-id> [--force]
```

| Flag | Description |
|------|-------------|
| `--id` | Event identifier (required) |
| `--force` | Skip confirmation prompt |

Without `--force`, prompts: `Delete event <id>? [y/N]`

**Example:**
```bash
calendarctl delete --id ABC123XYZ --force
```

---

## Date/Time Conventions

- **Input:** `"YYYY-MM-DD"` (all-day) or `"YYYY-MM-DD HH:mm"` (timed), 24-hour clock
- **Timezone:** System timezone
- **Week:** Monday–Sunday

---

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Error (access denied, not found, invalid args) |

---

*Aligned to BACKLOG.md MVP scope — 2026-04-10*
