//
//  Copyright © Kalisten 2026
//

public enum ButtonIconType {
    case image
    case sfSymbol
}

public struct ButtonIcon {
    let icon: String
    let type: ButtonIconType
    let side: Side

    public enum Side {
        case leading
        case trailing
    }

    public init(icon: String,
                type: ButtonIconType = .sfSymbol,
                side: Side) {
        self.icon = icon
        self.type = type
        self.side = side
    }

    public func shouldRender(at side: Side) -> Bool {
        hasValidIcon && self.side == side
    }

    public var hasValidIcon: Bool {
        !icon.isEmpty
    }
}
