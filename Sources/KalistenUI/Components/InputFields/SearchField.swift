//
//  Copyright © Kalisten 2022-2024
//

import KalistenTypography
import KalistenLayout
import KalistenColors

import SwiftUI

public struct SearchField: View {
    @Binding private var text: String

    private let label: LocalizedStringKey
    private let onSearch: (String) async -> Void

    @FocusState private var focusedField: Bool

    public init(text: Binding<String>, label: LocalizedStringKey, onSearch: @escaping (String) async -> Void) {
        self.label = label
        self._text = text
        self.onSearch = onSearch
    }

    public var body: some View {
        TextField(.empty, text: $text)
            .focused($focusedField)
            .keyboardType(.default)
            .placeholder(when: shouldDisplayPlaceholder()) {
                HStack {
                    Text(label)
                        .fontStyle(.body)
                        .foregroundColor(placeholderColor)
                        .lineLimit(1)
                    Spacer()
                }
            }
            .font(.system(size: Fonts.body.size))
            .foregroundColor(Colors.Secondary.Lighter.opaque)
            .accentColor(Colors.Primary.Mid.opaque)
            .padding(.vertical, .base)
            .padding(.leading, .large)
            .background(backgroundColor)
            .cornerRadius(.base, antialiased: true)
            .submitLabel(.return)
            .overlay(
                ZStack {
                    RoundedRectangle(cornerRadius: .base)
                        .stroke(strokeColor, lineWidth: 1)
                    HStack {
                        Image(systemName: SFSymbols.search)
                            .font(.system(size: Fonts.body.size))
                            .foregroundColor(iconColor)
                        Spacer()
                        if focusedField, text.isNotEmpty {
                            ClearFieldButton(text: $text)
                        }
                    }
                    .padding(.horizontal, .base)
                }
            )
            .onChange(of: text) {
                Task {
                    await onSearch(text)
                }
            }
    }

    private func shouldDisplayPlaceholder() -> Bool {
        text.isEmpty
    }
}

// MARK: - Colors

private extension SearchField {
    var placeholderColor: Color {
        focusedField ? Colors.Primary.Mid.semiOpaque : Colors.Secondary.Mid.semiOpaque
    }

    var backgroundColor: Color {
        focusedField ? Colors.Primary.Mid.translucent : Colors.Secondary.Mid.translucent
    }

    var strokeColor: Color {
        if focusedField {
            return Colors.Primary.Mid.semiOpaque
        } else {
            return text.isNotEmpty ? Colors.Secondary.Mid.semiOpaque : Colors.Secondary.Mid.semiTranslucent
        }
    }

    var iconColor: Color {
        if focusedField {
            return Colors.Primary.Mid.opaque
        } else {
            return text.isNotEmpty ? Colors.Secondary.Lighter.opaque : Colors.Secondary.Mid.semiOpaque
        }
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var text: String = .empty
    let label: LocalizedStringKey = "Search something..."

    ZStack {
        Colors.Neutral.lighter
        SearchField(
            text: $text,
            label: label,
            onSearch: {_ in })
            .padding(.medium)
    }
    .ignoresSafeArea()
}
