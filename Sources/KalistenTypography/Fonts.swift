//
//  Copyright © Kalisten 2024
//

import CoreFoundation
import Foundation

public enum Fonts {
    case largeTitle
    case title
    case subtitle
    case button
    case body
    case label
    case footnote

    var size: CGFloat {
        switch self {
            case .largeTitle:
                return 40
            case .title:
                return 32
            case .subtitle:
                return 24
            case .button:
                return 18
            case .body:
                return 17
            case .label, .footnote:
                return 11
        }
    }

    var isMainFont: Bool {
        switch self {
        case .largeTitle, .title, .subtitle, .button:
            return true
        default:
            return false
        }
    }
}
