//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenColors

import SwiftUI

public struct CloseButton: View {
    private let font: Fonts
    private let onClose: (() -> Void)?

    public init(font: Fonts = .subtitle, onClose: (() -> Void)?) {
        self.font = font
        self.onClose = onClose
    }

    public var body: some View {
        Button {
            withAnimation {
                onClose?()
            }
        } label: {
            Image(systemName: SFSymbols.closeFill)
                .font(.system(size: font.size))
                .foregroundColor(Colors.Secondary.Mid.semiOpaque)
        }
    }
}

#Preview {
    CloseButton(onClose: nil)
        .background(Colors.Neutral.light)
}
