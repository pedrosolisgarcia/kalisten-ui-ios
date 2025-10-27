//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenLayout
import KalistenColors
import KalistenCore

import SwiftUI

struct BaseField<Content: View>: View {
    let label: LocalizedStringKey
    let placeholder: LocalizedStringKey
    let error: Binding<ErrorValidation>
    let errorMessage: LocalizedStringKey
    let isFocused: FocusState<Bool>.Binding
    let text: Binding<String>
    let validateField: (Bool) -> Void
    let content: Content

    init(
        label: LocalizedStringKey,
        placeholder: LocalizedStringKey = .empty,
        error: Binding<ErrorValidation>,
        errorMessage: LocalizedStringKey = .empty,
        isFocused: FocusState<Bool>.Binding,
        text: Binding<String>,
        validateField: @escaping (Bool) -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.label = label
        self.placeholder = placeholder
        self.error = error
        self.errorMessage = errorMessage
        self.isFocused = isFocused
        self.text = text
        self.validateField = validateField
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: .base) {
            Text(label)
                .fontStyle(.label)
                .foregroundColor(labelColor)
            content
                .placeholder(when: shouldDisplayPlaceholder()) {
                    HStack {
                        Text(placeholder)
                            .fontStyle(.body)
                            .foregroundColor(placeholderColor)
                            .lineLimit(1)
                        Spacer()
                    }
                }
                .font(.system(size: Fonts.body.size))
                .foregroundColor(Colors.Secondary.Lighter.opaque)
                .accentColor(Colors.Primary.Mid.opaque)
                .padding(.base)
                .frame(height: .xlarge)
                .background(backgroundColor)
                .cornerRadius(.base, antialiased: true)
                .onChange(of: isFocused.wrappedValue) { focusState in
                    withAnimation {
                        validateField(focusState)
                    }
                }
                .onChange(of: text.wrappedValue) { _ in
                    withAnimation {
                        validateField(isFocused.wrappedValue)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: .base)
                        .stroke(strokeColor, lineWidth: 1)
                )
            if errorMessage != .empty, error.wrappedValue != .none {
                Text(errorMessage)
                    .fontStyle(.label)
                    .foregroundColor(labelColor)
            }
        }
    }

    private func shouldDisplayPlaceholder() -> Bool {
        text.wrappedValue.isEmpty
    }

    private var labelColor: Color {
        if isFocused.wrappedValue {
            return Colors.Primary.Mid.opaque
        } else if error.wrappedValue != .none {
            return Colors.System.Error.opaque
        } else {
            return text.wrappedValue.isNotEmpty ? Colors.Secondary.Lighter.opaque : Colors.Secondary.Mid.opaque
        }
    }

    private var placeholderColor: Color {
        if isFocused.wrappedValue {
            return Colors.Primary.Mid.semiOpaque
        } else {
            return error.wrappedValue != .none ? Colors.System.Error.semiOpaque : Colors.Secondary.Mid.semiOpaque
        }
    }

    private var backgroundColor: Color {
        if isFocused.wrappedValue {
            return Colors.Primary.Mid.translucent
        } else {
            return error.wrappedValue != .none ? Colors.System.Error.translucent : Colors.Secondary.Mid.translucent
        }
    }

    private var strokeColor: Color {
        if isFocused.wrappedValue {
            return Colors.Primary.Mid.semiOpaque
        } else if error.wrappedValue != .none {
            return Colors.System.Error.semiOpaque
        } else {
            return text.wrappedValue.isNotEmpty ? Colors.Secondary.Mid.semiOpaque : Colors.Secondary.Mid.semiTranslucent
        }
    }
}
