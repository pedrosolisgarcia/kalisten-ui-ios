//
//  Copyright © Kalisten 2023-2024
//

import KalistenTypography
import KalistenColors

import SwiftUI

public struct ClearFieldButton: View {
    @Binding private var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public var body: some View {
        Button {
            withAnimation {
                text.removeAll()
            }
        } label: {
            Image(systemName: SFSymbols.close)
                .fontStyle(.label)
                .foregroundColor(Colors.Secondary.Mid.semiOpaque)
        }
    }
}

#Preview {
    @Previewable @State var text: String = ""

    ClearFieldButton(text: $text)
}
