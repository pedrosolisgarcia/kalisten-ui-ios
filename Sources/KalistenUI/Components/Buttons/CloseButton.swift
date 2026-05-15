//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenColors

import SwiftUI

public struct CloseButton: View {
    private let onClose: (() -> Void)?

    public init(onClose: (() -> Void)?) {
        self.onClose = onClose
    }

    public var body: some View {
        Button {
            withAnimation {
                onClose?()
            }
        } label: {
            Image(systemName: SFSymbols.close)
                .fontStyle(.button(.large))
                .foregroundColor(Colors.Secondary.Mid.opaque)
                .frame(width: .xlarge, height: .xlarge)
        }
        .glassEffect(.clear.interactive())
    }
}

#Preview {
    ZStack {
        Colors.Neutral.light
        CloseButton {}
    }
}
