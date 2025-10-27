//
//  Copyright © Kalisten 2024
//

import CoreFoundation

public enum ButtonSize: CGFloat {
    case small
    case medium
    case large

    public var fontSize: CGFloat {
        switch self {
        case .small: return 14
        case .medium: return 16
        case .large: return 18
        }
    }
}
