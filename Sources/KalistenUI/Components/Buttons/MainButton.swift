//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenGradients
import KalistenColors
import KalistenLayout
import KalistenCore

import SwiftUI

enum ButtonType {
    case primary
    case secondary

    var fontColor: Color {
        switch self {
        case .primary:
            return Colors.Secondary.Lighter.opaque
        case .secondary:
            return Colors.Primary.Mid.opaque
        }
    }

    var backgroundGradient: some View {
        switch self {
        case .primary:
            return Gradients.Primary.vertical
        case .secondary:
            return Gradients.Secondary.vertical
        }
    }
}

extension ButtonSize {
    var heigth: CGFloat {
        switch self {
        case .large:
            return 52
        case .medium:
            return 44
        case .small:
            return 36
        }
    }

    var horizontalPadding: SoftGrid {
        switch self {
        case .large:
            return .large
        case .medium:
            return .medium
        case .small:
            return .small
        }
    }
}

struct MainButton: View {
    @Binding private var status: ActionStatus
    private let button: ButtonType
    private let size: ButtonSize
    private let buttonLabel: LocalizedStringKey
    private let buttonAction: () -> Void
    private let shouldExpand: Bool

    init(
        status: Binding<ActionStatus>,
        type: ButtonType,
        size: ButtonSize,
        label: LocalizedStringKey,
        action: @escaping () -> Void,
        expand: Bool
    ) {
        self._status = status
        self.button = type
        self.size = size
        self.buttonLabel = label
        self.buttonAction = action
        self.shouldExpand = expand
    }

    var body: some View {
        Button {
            withAnimation {
                buttonAction()
            }
        } label: {
            HStack(spacing: .zero) {
                if shouldExpand {
                    Spacer(minLength: .zero)
                }
                if status == .loading {
                    SpinnerView(
                        status: $status,
                        spinnerColor: button.fontColor,
                        font: .button(size)
                    )
                } else {
                    Text(buttonLabel)
                        .fontStyle(.button(size))
                        .foregroundColor(button.fontColor)
                        .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                        .lineLimit(1)
                }
                if shouldExpand {
                    Spacer(minLength: .zero)
                }
            }
            .frame(height: size.heigth)
            .padding(.horizontal, size.horizontalPadding)
            .background(button.backgroundGradient)
            .cornerRadius(.base)
        }
    }
}

#Preview {
    MainButton(
        status: .constant(.idle),
        type: .primary,
        size: .large,
        label: "Button",
        action: {},
        expand: false)
}
