//
//  Copyright © Kalisten 2024
//

import KalistenLayout

import CoreFoundation
import Foundation

public enum Fonts: Equatable {
    case largeTitle
    case title
    case subtitle
    case button(_ size: ButtonSize)
    case body
    case label
    case footnote

    public var size: CGFloat {
        switch self {
        case .largeTitle:
            return 40
        case .title:
            return 32
        case .subtitle:
            return 24
        case .button(let size):
            return size.fontSize
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
