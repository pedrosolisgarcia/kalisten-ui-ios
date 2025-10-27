//
//  Copyright © Kalisten 2024
//

import SwiftUI

public enum InputType {
    case email
    case number
    case phone
    case text

    var capitalization: TextInputAutocapitalization {
        switch self {
        case .email, .number, .phone: .never
        case .text: .sentences
        }
    }

    var contentType: UITextContentType? {
        switch self {
        case .email: .username
        case .phone: .telephoneNumber
        case .number, .text: nil
        }
    }

    var keyboardType: UIKeyboardType {
        switch self {
        case .email: .emailAddress
        case .number: .decimalPad
        case .phone: .phonePad
        case .text: .default
        }
    }
    
    var shouldDisableAutocorrection: Bool {
        switch self {
        case .email, .number, .phone: true
        case .text: false
        }
    }
}
