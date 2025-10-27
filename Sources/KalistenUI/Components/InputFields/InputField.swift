//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenLayout
import KalistenColors
import KalistenCore

import SwiftUI

public struct InputField: View {
    @Binding private var text: String
    @Binding var error: ErrorValidation
    var errorMessage: LocalizedStringKey

    private let label: LocalizedStringKey
    private let placeholder: LocalizedStringKey
    private let inputType: InputType

    @FocusState private var isFocused: Bool

    public init(
        text: Binding<String>,
        error: Binding<ErrorValidation> = .constant(.none),
        errorMessage: LocalizedStringKey = .empty,
        label: LocalizedStringKey,
        placeholder: LocalizedStringKey = .empty,
        inputType: InputType = .text
    ) {
        self._text = text
        self._error = error
        self.errorMessage = errorMessage

        self.label = label
        self.placeholder = placeholder
        self.inputType = inputType
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
            TextField(.empty, text: $text)
                .textInputAutocapitalization(inputType.capitalization)
                .textContentType(inputType.contentType)
                .keyboardType(inputType.keyboardType)
                .autocorrectionDisabled(inputType.shouldDisableAutocorrection)
                .focused($isFocused)
                .overlay(
                    HStack {
                        Spacer()
                        if isFocused, text.isNotEmpty {
                            ClearFieldButton(text: $text)
                        }
                    }
                    .padding(.horizontal, .base)
                )
        }
    }

    private func validateField(ignore: Bool = false) {
        if !ignore {
            error = text.isEmpty ? .empty : .none
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
        InputField(
            text: $text,
            error: $error,
            errorMessage: errorMessage,
            label: label,
            placeholder: placeholder)
            .padding(.medium)
    }
    .ignoresSafeArea()
}
