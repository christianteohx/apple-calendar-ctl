---
name: calctl
description: Generate a native macOS Apple Calendar CLI with EventKit. Use when user wants to create, list, or manage Apple Calendar events from the terminal. Trigger phrases: "calendar CLI", "apple calendar from terminal", "calctl", "event CLI for macOS".
homepage: https://github.com/christianteohx/calctl
user-invocable: true
metadata:
  {
    "openclaw":
      {
        "emoji": "🗓️",
        "requires": { "bins": ["swift"] }
      }
  }
---

# calctl Skill

Generate a native macOS Apple Calendar CLI tool using EventKit.

## When to invoke

Trigger when user says or asks for:
- "calendar CLI"
- "apple calendar from terminal"
- "calctl"
- "event CLI for macOS"
- "list calendar events from command line"
- "create calendar event from terminal"

## Instructions

When triggered, generate a complete Swift CLI project that:

### Core requirements
- Uses **EventKit** directly (no AppleScript, no `osascript`)
- macOS 14+ (Sonoma) required
- Swift 6.0+
- Swift Package Manager (no CocoaPods/Carthage)
- No external dependencies beyond EventKit

### Commands to implement

| Command | Description |
|---------|-------------|
| `calctl status` | Check calendar access status |
| `calctl authorize` | Trigger permission prompt |
| `calctl list` | List all calendars (with id, title, source) |
| `calctl today` | Show today's events |
| `calctl tomorrow` | Show tomorrow's events |
| `calctl week` | Show this week's events |
| `calctl date YYYY-MM-DD` | Show events for a specific date |
| `calctl add --title "..." --start "..." --end "..."` | Create an event |
| `calctl edit --id <id> ...` | Edit an event |
| `calctl delete --id <id>` | Delete an event |
| `--calendar <name>` | Filter by calendar name |

### Implementation notes

- Use `EKEventStore` for all calendar operations
- Request access with `eventStore.requestAccess(to: .event)`
- Parse dates with `DateFormatter` using `yyyy-MM-dd HH:mm` and `yyyy-MM-dd` formats
- Return structured output (human-readable by default)
- Include proper error handling with descriptive messages

### Project structure

```
Sources/<ToolName>/
  main.swift         # CLI entry point, argument parsing
Sources/<ToolName>Core/
  CalendarCore.swift # EventKit wrappers
  Models.swift       # Event/calendar data models
  Errors.swift       # Error types
Package.swift        # SPM configuration
```

## Output

After generating, tell the user:
1. How to build: `swift build`
2. How to run: `.build/debug/calctl <command>`
3. How to install: `swift build -c release && cp .build/release/calctl /usr/local/bin/calctl`
4. First-run note: macOS will prompt for Calendar permission
