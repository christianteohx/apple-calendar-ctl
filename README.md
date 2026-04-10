# apple-calendar-ctl

Native macOS CLI for Apple Calendar via EventKit. Inspired by [steipete/remindctl](https://github.com/steipete/remindctl).

## Build

```bash
git clone <repo-url> apple-calendar-ctl
cd apple-calendar-ctl
swift build
```

**Binary:** `.build/arm64-apple-macosx/debug/calendarctl`

To install globally:
```bash
cp .build/arm64-apple-macosx/debug/calendarctl /usr/local/bin/calendarctl
chmod +x /usr/local/bin/calendarctl
```

> Requires macOS 14+ (Sonoma) and Swift 6.0+

## Permission Setup

Apple Calendar access requires explicit user authorization.

1. On first run the tool prompts you automatically.
2. Accept the system dialog.
3. If access is denied, open: **System Settings → Privacy & Security → Calendars → Terminal → Allow**

If running over SSH, run `calendarctl status` on the physical Mac once to trigger the prompt.

## Command Cheatsheet

| Command | Description |
|---------|-------------|
| `calendarctl status` | Check calendar access status |
| `calendarctl authorize` | Trigger the permission prompt |
| `calendarctl list` | List all calendars |
| `calendarctl today` | Show today events |
| `calendarctl tomorrow` | Show tomorrow events |
| `calendarctl week` | Show this week events |
| `calendarctl date YYYY-MM-DD` | Show events for a date |
| `calendarctl add --title "..." --start "..." --end "..."` | Create an event |
| `calendarctl edit --id <id> ...` | Edit an event |
| `calendarctl delete --id <id>` | Delete an event |

## Quick Examples

```bash
# List calendars
calendarctl list

# Check auth status
calendarctl status

# Today events
calendarctl today

# Specific date
calendarctl date 2026-05-01 --calendar "Work"

# Create an event
calendarctl add \
  --title "Team Standup" \
  --start "2026-04-11 09:00" \
  --end "2026-04-11 09:30"

# Delete (prompts for confirmation)
calendarctl delete --id <event-id>

# Delete without prompting
calendarctl delete --id <event-id> --force
```

## Smoke Test

```bash
./scripts/smoke.sh
```

Builds, runs `--help`, `status`, `list`, and `today`. Non-destructive. Exit 0 = pass.

## Tech Stack

- Swift 6.0+ / macOS 14+
- EventKit (native, no AppleScript)
- Swift Package Manager

---

See [SPEC.md](./SPEC.md) for full CLI grammar and [BACKLOG.md](./BACKLOG.md) for feature status.
