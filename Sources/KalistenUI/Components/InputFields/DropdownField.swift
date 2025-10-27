//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenLayout
import KalistenColors
import KalistenCore

import SwiftUI

public struct DropdownField: View {
    @Binding private var text: String
    @Binding var error: ErrorValidation
    var errorMessage: LocalizedStringKey

    private let label: LocalizedStringKey
    private let placeholder: LocalizedStringKey
    private let onTap: () -> Void

    @FocusState private var isFocused: Bool

    public init(
        text: Binding<String>,
        error: Binding<ErrorValidation> = .constant(.none),
        errorMessage: LocalizedStringKey = .empty,
        label: LocalizedStringKey,
        placeholder: LocalizedStringKey = .empty,
        onTap: @escaping () -> Void
    ) {
        self._text = text
        self._error = error
        self.errorMessage = errorMessage

        self.label = label
        self.placeholder = placeholder
        self.onTap = onTap
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
            HStack {
                Text(text)
                Spacer()
            }
            .overlay(
                HStack {
                    Spacer()
                    if isFocused, text.isNotEmpty {
                        ClearFieldButton(text: $text)
                    }
                    Image(systemName: SFSymbols.down)
                        .font(.system(size: Fonts.body.size))
                        .foregroundColor(iconColor)
                }
            )
            .onTapGesture {
                withAnimation {
                    focus()
                    onTap()
                }
            }
        }
    }

    private func focus() {
        isFocused = true
    }

    private func validateField(ignore: Bool = false) {
        if !ignore {
            error = text.isEmpty ? .empty : .none
        }
    }
}

// MARK: - Colors

private extension DropdownField {
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
    @Previewable @State var text: String = ""
    @Previewable @State var error: ErrorValidation = .none
    var errorMessage: LocalizedStringKey = "Error message"

    let label: LocalizedStringKey = "Label"
    let placeholder: LocalizedStringKey = "Placeholder"

    ZStack {
        Colors.Neutral.lighter
        DropdownField(
            text: $text,
            error: $error,
            errorMessage: errorMessage,
            label: label,
            placeholder: placeholder,
            onTap: {}
        )
        .padding(.medium)
    }
    .ignoresSafeArea()
}
