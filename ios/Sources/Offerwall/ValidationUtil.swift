import Foundation

enum ValidationResult {
    case valid
    case invalid(String)
}

struct ValidationUtil {
    private static let safePattern = "^[A-Za-z0-9\\-_]*$"

    static func validate(_ config: OfferwallConfig) -> ValidationResult {
        guard !config.partnerId.isEmpty else {
            return .invalid("partnerId is required and cannot be empty")
        }
        guard isSafe(config.partnerId) else {
            return .invalid("partnerId contains invalid characters")
        }
        guard !config.userId.isEmpty else {
            return .invalid("userId is required and cannot be empty")
        }
        guard isSafe(config.userId) else {
            return .invalid("userId contains invalid characters")
        }
        if let subId = config.subId, !subId.isEmpty, !isSafe(subId) {
            return .invalid("subId contains invalid characters")
        }
        if let deviceId = config.deviceId, !deviceId.isEmpty, !isSafe(deviceId) {
            return .invalid("deviceId contains invalid characters")
        }
        if let idfa = config.idfa, !idfa.isEmpty, !isSafe(idfa) {
            return .invalid("idfa contains invalid characters")
        }
        if let gdfa = config.gdfa, !gdfa.isEmpty, !isSafe(gdfa) {
            return .invalid("gdfa contains invalid characters")
        }
        return .valid
    }

    private static func isSafe(_ value: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: safePattern)
        let range = NSRange(value.startIndex..., in: value)
        return regex?.firstMatch(in: value, range: range) != nil
    }
}
