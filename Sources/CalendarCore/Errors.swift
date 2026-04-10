import Foundation

public enum CalendarError: Error, CustomStringConvertible {
    case accessDenied
    case writeOnlyAccess
    case eventNotFound(String)
    case calendarNotFound(String)
    case operationFailed(String)
    case invalidDate(String)

    public var description: String {
        switch self {
        case .accessDenied:
            return [
                "Calendar access denied.",
                "Run `apple-calendar-ctl authorize` to trigger the prompt, then allow Terminal",
                "in System Settings > Privacy & Security > Calendars.",
                "If running over SSH, grant access on the Mac that runs the command.",
            ].joined(separator: " ")
        case .writeOnlyAccess:
            return [
                "Calendar access is write-only.",
                "Switch to Full Access in System Settings > Privacy & Security > Calendars.",
            ].joined(separator: " ")
        case .eventNotFound(let id):
            return "Event not found: \"\(id)\"."
        case .calendarNotFound(let name):
            return "Calendar not found: \"\(name)\"."
        case .operationFailed(let message):
            return message
        case .invalidDate(let input):
            return "Invalid date: \"\(input)\"."
        }
    }
}
