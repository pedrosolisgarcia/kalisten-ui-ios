//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenColors
import KalistenLayout
import KalistenCore

import SwiftUI

public struct PinField: View {
    @Binding var text: String
    @Binding var error: ErrorValidation

    let errorMessage: LocalizedStringKey
    let submitAction: () -> Void
    let pinCount: Int

    private var array: [Int] = []

    @FocusState private var isFocused: Bool

    public init(
        text: Binding<String> = .constant(.empty),
        error: Binding<ErrorValidation> = .constant(.none),
        errorMessage: LocalizedStringKey = .empty,
        pintCount: Int,
        submitAction: @escaping () -> Void = {}
    ) {
        self._text = text
        self._error = error
        self.errorMessage = errorMessage
        self.pinCount = pintCount
        self.submitAction = submitAction
        self.array = populateArray(count: pintCount)
    }

    private func populateArray(count: Int) -> [Int] {
        var array: [Int] = []
        for index in 1...count {
            array.append(index)
        }

        return array
    }

    public var body: some View {
        VStack(spacing: .base) {
            ZStack {
                HStack(spacing: .base) {
                    ForEach(array, id: \.self) { index in
                        RoundedRectangle(cornerRadius: .base)
                            .foregroundColor(backgroundColor)
                            .frame(width: KalistenLayout.Screen.width/9, height: KalistenLayout.Screen.width/7)
                            .overlay(
                                RoundedRectangle(cornerRadius: .base)
                                    .stroke(
                                        strokeColor,
                                        lineWidth: 1
                                    )
                            )
                            .overlay(
                                VStack {
                                    if text.count >= index {
                                        Text(text[index - 1])
                                            .fontStyle(.largeTitle)
                                            .foregroundColor(Colors.Secondary.Lighter.opaque)
                                    }
                                }
                            )
                    }
                }
                TextField(.empty, text: $text.max(pinCount))
                    .styledTextField()
                    .focused($isFocused)
                    .onChange(of: isFocused) { focusState in
                        withAnimation {
                            validateField(ignore: focusState)
                        }
                    }
                    .onChange(of: text) { newCode in
                        withAnimation {
                            validateField()

                            if newCode.count >= pinCount {
                                submitAction()
                            }
                        }
                    }
            }
            if error != .none {
                Text(errorMessage)
                    .fontStyle(.label)
                    .foregroundColor(Colors.System.Error.opaque)
            }
        }
    }

    private func validateField(ignore: Bool = false) {
        if !ignore {
            error = text.isEmpty ? .empty : .none
        }
    }

    private var strokeColor: Color {
        if isFocused {
            return Colors.Primary.Mid.semiOpaque
        } else if error != .none {
            return Colors.System.Error.semiOpaque
        } else {
            return text.isNotEmpty ? Colors.Secondary.Mid.semiOpaque : Colors.Secondary.Mid.semiTranslucent
        }
    }

    private var backgroundColor: Color {
        if isFocused {
            return Colors.Primary.Mid.translucent
        } else {
            return error != .none ?
            Colors.System.Error.translucent :
            Colors.Secondary.Mid.translucent
        }
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var text = ""
    @Previewable @State var error: ErrorValidation = .empty

    ZStack {
        Colors.Neutral.lighter
        PinField(
            text: $text,
            error: $error,
            errorMessage: "Error message",
            pintCount: 4
        )
        .padding()
    }
}

// MARK: - Styles

private extension View {
    func styledTextField() -> some View {
        self.fontStyle(.largeTitle)
            .foregroundColor(.clear)
            .monospaced()
            .keyboardType(.numberPad)
            .textContentType(.shipmentTrackingNumber)
            .accentColor(Colors.Primary.dark)
            .padding(.horizontal, .base)
            .padding(.vertical, .base)
            .kerning(KalistenLayout.Screen.width/11.2)
            .padding(.leading, .small)
            .submitLabel(.send)
            .frame(width: KalistenLayout.Screen.width - 48)
            .fixedSize()
    }
}

private extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}

private extension StringProtocol {
    subscript(offset: Int) -> String {
        String(self[index(startIndex, offsetBy: offset)])
    }
}
