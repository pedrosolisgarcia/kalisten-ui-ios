//
//  Copyright © Kalisten 2023-2024
//

import KalistenTypography

import SwiftUI

public struct ClearFieldButton: View {
    @Binding private var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public var body: some View {
        CloseButton(font: .button(.small)) {
            text.removeAll()
        }
    }
}

#Preview {
    @Previewable @State var text: String = ""

    ClearFieldButton(text: $text)
}
