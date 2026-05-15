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
    case primary, secondary, add
    

    var fontColor: Color {
        switch self {
        case .primary:   Colors.Secondary.Lighter.opaque
        case .secondary: Colors.Primary.Mid.opaque
        case .add:       Colors.Secondary.Mid.opaque
        }
    }

    var backgroundGradient: some View {
        switch self {
        case .primary:   Gradients.Primary.vertical
        case .secondary: Gradients.Secondary.vertical
        case .add:       Gradients.clear
        }
    }
}

extension ButtonSize {
    var heigth: CGFloat {
        switch self {
        case .large:  52
        case .medium: 44
        case .small:  36
        }
    }

    var horizontalPadding: SoftGrid {
        switch self {
        case .large:  .large
        case .medium: .medium
        case .small:  .small
        }
    }
}

struct MainButton: View {
    @Binding private var status: ActionStatus
    private let button: ButtonType
    private let size: ButtonSize
    private let buttonIcon: ButtonIcon?
    private let buttonLabel: LocalizedStringKey
    private let glassEffect: Glass
    private let buttonAction: () -> Void
    private let shouldExpand: Bool

    init(
        status: Binding<ActionStatus>,
        type: ButtonType,
        size: ButtonSize,
        icon: ButtonIcon?,
        label: LocalizedStringKey,
        glassEffect: Glass = .regular,
        action: @escaping () -> Void,
        expand: Bool
    ) {
        self._status = status
        self.button = type
        self.size = size
        self.buttonIcon = icon
        self.buttonLabel = label
        self.glassEffect = glassEffect
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
                if status == .loading {
                    SpinnerView(
                        status: $status,
                        spinnerColor: button.fontColor,
                        font: .button(size)
                    )
                } else {
                    Group {
                        if let buttonIcon,
                           buttonIcon.shouldRender(at: .leading) {
                            MainButtonIconView(buttonIcon: buttonIcon, buttonSize: size)
                        }
                        Text(buttonLabel)
                            .frame(maxWidth: shouldExpand ? .infinity : nil)
                            .minimumScaleFactor(0.6)
                        if let buttonIcon,
                           buttonIcon.shouldRender(at: .trailing) {
                            MainButtonIconView(buttonIcon: buttonIcon, buttonSize: size)
                        }
                    }
                    .fontStyle(.button(size))
                    .foregroundColor(button.fontColor)
                    .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                    .lineLimit(1)
                }
            }
            .frame(height: size.heigth)
            .frame(maxWidth: shouldExpand ? .infinity : nil)
            .padding(edges, size.horizontalPadding)
            .background(button.backgroundGradient)
            .cornerRadius(.small)
            .glassEffect(glassEffect.interactive(), in: .rect(cornerRadius: SoftGrid.small.rawValue))
        }
        .buttonStyle(.plain)
        
    }
}

private extension MainButton {
    var edges: Edge.Set {
        guard let buttonIcon,
              buttonIcon.hasValidIcon,
              status != .loading else {
            return .horizontal
        }

        if buttonIcon.side == .trailing {
            return .leading
        } else {
            return .trailing
        }
    }

    struct MainButtonIconView: View {
        let buttonIcon: ButtonIcon
        let buttonSize: ButtonSize

        var body: some View {
            ZStack {
                Rectangle()
                    .fill(.clear)
                    .frame(width: buttonSize.heigth, height: buttonSize.heigth)

                switch buttonIcon.type {
                case .image:
                    Image(buttonIcon.icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: buttonSize.heigth / 2)
                case .sfSymbol:
                    Image(systemName: buttonIcon.icon)
                        .fontWeight(.heavy)
                }
            }
        }
    }
}

#Preview {
    MainButton(
        status: .constant(.idle),
        type: .primary,
        size: .large,
        icon: .init(icon: SFSymbols.chevronRight, side: .trailing),
        label: "Button",
        action: {},
        expand: false)
}

#Preview {
    MainButton(
        status: .constant(.idle),
        type: .secondary,
        size: .large,
        icon: .init(icon: SFSymbols.chevronLeft, side: .leading),
        label: "Button",
        action: {},
        expand: true)
}

#Preview {
    MainButton(
        status: .constant(.idle),
        type: .primary,
        size: .large,
        icon: nil,
        label: "Button",
        action: {},
        expand: false)
}
