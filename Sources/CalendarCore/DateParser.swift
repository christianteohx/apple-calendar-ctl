import Foundation

/// Date parsing utilities for CLI input formats
public enum DateParser {
    private static let dateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.calendar = Calendar.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    private static let dateOnlyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    /// Parse a datetime string in "YYYY-MM-DD HH:mm" format
    /// - Parameter input: The datetime string (e.g., "2024-04-15 14:30")
    /// - Returns: A Date object
    /// - Throws: CalendarError.invalidDate if parsing fails
    public static func parseDateTime(_ input: String) throws -> Date {
        let trimmed = input.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {
            throw CalendarError.invalidDate("empty string")
        }

        guard let date = dateTimeFormatter.date(from: trimmed) else {
            throw CalendarError.invalidDate(trimmed)
        }
        return date
    }

    /// Parse a date-only string in "YYYY-MM-DD" format
    /// - Parameter input: The date string (e.g., "2024-04-15")
    /// - Returns: A Date object at midnight in the current timezone
    /// - Throws: CalendarError.invalidDate if parsing fails
    public static func parseDate(_ input: String) throws -> Date {
        let trimmed = input.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {
            throw CalendarError.invalidDate("empty string")
        }

        guard let date = dateOnlyFormatter.date(from: trimmed) else {
            throw CalendarError.invalidDate(trimmed)
        }
        return date
    }

    /// Format a Date for display in "YYYY-MM-DD HH:mm" format
    public static func formatDateTime(_ date: Date) -> String {
        dateTimeFormatter.string(from: date)
    }

    /// Format a Date for display in "YYYY-MM-DD" format
    public static func formatDate(_ date: Date) -> String {
        dateOnlyFormatter.string(from: date)
    }
}
