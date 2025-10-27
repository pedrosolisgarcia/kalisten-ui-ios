//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenLayout
import KalistenColors
import KalistenCore

import SwiftUI

enum FocusedField {
    case secure
    case unSecure
}

public struct PasswordField: View {
    @Binding private var text: String
    @Binding var error: ErrorValidation
    var errorMessage: LocalizedStringKey

    private let label: LocalizedStringKey
    private let placeholder: LocalizedStringKey
    private let isNewPassword: Bool

    @State private var showPassword: Bool = false
    @FocusState private var isFocused: Bool

    public init(
        text: Binding<String>,
        error: Binding<ErrorValidation> = .constant(.none),
        errorMessage: LocalizedStringKey = .empty,
        label: LocalizedStringKey,
        placeholder: LocalizedStringKey = .empty,
        isNewPassword: Bool = false
    ) {
        self._text = text
        self._error = error
        self.errorMessage = errorMessage

        self.label = label
        self.placeholder = placeholder
        self.isNewPassword = isNewPassword
    }

    public var body: some View {
        BaseField(
            label: label,
            placeholder: placeholder,
            error: $error,
            errorMessage: errorMessage,
            isFocused: $isFocused,
            text: $text,
            validateField: { isFocused in
                validateField(ignore: isFocused)
            }
        ) {
            VStack {
                if showPassword {
                    TextField(.empty, text: $text)
                        .focused($isFocused)
                        .keyboardType(.default)
                        .textContentType(isNewPassword ? .newPassword : .password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                } else {
                    SecureField(.empty, text: $text)
                        .focused($isFocused)
                        .keyboardType(.default)
                        .textContentType(isNewPassword ? .newPassword : .password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
            }
            .overlay(
                HStack {
                    Spacer()
                    if isFocused, text.isNotEmpty {
                        ClearFieldButton(text: $text)
                    }
                    Button {
                        showPassword.toggle()
                        DispatchQueue.main.async {
                            isFocused = true
                        }
                    } label: {
                        Image(systemName: self.showPassword ? SFSymbols.eye : SFSymbols.eyeCrossed)
                            .font(.system(size: Fonts.body.size))
                            .foregroundColor(iconColor)
                    }
                }
            )
        }
    }

    private func validateField(ignore: Bool = false) {
        if !ignore {
            error = text.isEmpty ? .empty : .none
        }
    }
}

// MARK: - Colors

private extension PasswordField {
    var iconColor: Color {
        if isFocused {
            return Colors.Primary.Mid.opaque
        } else if error != .none {
            return Colors.System.Error.semiOpaque
        } else {
            return text.isNotEmpty ? Colors.Secondary.Lighter.opaque : Colors.Secondary.Mid.semiOpaque
        }
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var text: String = .empty
    @Previewable @State var error: ErrorValidation = .none
    var errorMessage: LocalizedStringKey = "Error message"

    let label: LocalizedStringKey = "Label"
    let placeholder: LocalizedStringKey = "Placeholder"

    ZStack {
        Colors.Neutral.lighter
        PasswordField(
            text: $text,
            error: $error,
            errorMessage: errorMessage,
            label: label,
            placeholder: placeholder)
        .padding(.medium)
    }
    .ignoresSafeArea()
}
