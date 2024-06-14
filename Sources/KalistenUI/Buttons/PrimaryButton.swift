//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenGradients
import KalistenColors
import KalistenLayout

import SwiftUI

public struct PrimaryButton: View {
    private let buttonLabel: LocalizedStringKey
    private let buttonAction: () -> Void
    private let shouldExpand: Bool

    public init(
        label: LocalizedStringKey,
        action: @escaping () -> Void,
        expand: Bool
    ) {
        self.buttonLabel = label
        self.buttonAction = action
        self.shouldExpand = expand
    }

    public var body: some View {
        Button(action: {
            buttonAction()
        }) {
            HStack(spacing: .zero) {
                if shouldExpand {
                    Spacer(minLength: .zero)
                }
                Text(buttonLabel)
                    .fontStyle(.button)
                    .foregroundColor(Colors.Secondary.lighter)
                    .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                    .lineLimit(1)
                    .frame(height: 15)
                if shouldExpand {
                    Spacer(minLength: .zero)
                }
            }
            .padding(.top, 12)
            .padding(.bottom, 13)
            .padding(.horizontal, .medium)
            .background(Gradients.Primary.vertical)
            .cornerRadius(.base)
        }
    }
}

struct YourView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(
            label: "Button",
            action: {},
            expand: false
        )
            .previewLayout(.sizeThatFits)
    }
}
