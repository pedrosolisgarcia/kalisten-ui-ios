//
//  Copyright © Kalisten 2024
//

public enum ActionStatus: Codable {
    case idle
    case loading
    case success
    case error

    public mutating func load() {
        self = .loading
    }

    public func isLoading() -> Bool {
        self == .loading
    }

    public func isNotLoading() -> Bool {
        self != .loading
    }

    public mutating func success() {
        self = .success
    }

    public func isSusccessful() -> Bool {
        self == .success
    }

    public mutating func error() {
        self = .error
    }

    public func hasError() -> Bool {
        self == .error
    }

    public mutating func reset() {
        self = .idle
    }

    public func hasNotChanged() -> Bool {
        self == .idle
    }
}
