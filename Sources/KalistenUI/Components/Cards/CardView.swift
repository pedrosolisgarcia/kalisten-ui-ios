//
//  Copyright © Kalisten 2024
//

import KalistenColors
import KalistenLayout

import SwiftUI

public struct CardView<Content: View>: View {
    private let content: () -> Content
    private let cornerRadius: SoftGrid
    private let selected: Bool

    public init(cornerRadius: SoftGrid = .small,
                selected: Bool = false,
                @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.cornerRadius = cornerRadius
        self.selected = selected
    }

    public var body: some View {
        VStack {
            self.content()
        }
        .foregroundColor(foregroundColor)
        .background(backGroundColor)
        .cornerRadius(cornerRadius)
    }

    private var foregroundColor: Color {
        selected ? Colors.Primary.Mid.opaque : Colors.Secondary.Lighter.opaque
    }

    private var backGroundColor: Color {
        selected ? Colors.Primary.Mid.semiTranslucent : Colors.Secondary.Lighter.translucent
    }
}
