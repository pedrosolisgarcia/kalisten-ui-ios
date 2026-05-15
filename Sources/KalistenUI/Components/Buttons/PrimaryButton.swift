//
//  Copyright © Kalisten 2024
//

import KalistenTypography
import KalistenGradients
import KalistenColors
import KalistenLayout
import KalistenCore

import SwiftUI

public struct PrimaryButton: View {
    @Binding private var status: ActionStatus
    private let size: ButtonSize
    private let buttonIcon: ButtonIcon?
    private let buttonLabel: LocalizedStringKey
    private let buttonAction: () -> Void
    private let shouldExpand: Bool

    public init(
        size: ButtonSize,
        status: Binding<ActionStatus> = .constant(.idle),
        icon: ButtonIcon? = nil,
        label: LocalizedStringKey,
        expand: Bool = true,
        action: @escaping () -> Void
    ) {
        self._status = status
        self.size = size
        self.buttonIcon = icon
        self.buttonLabel = label
        self.buttonAction = action
        self.shouldExpand = expand
    }

    public var body: some View {
        MainButton(
            status: $status,
            type: .primary,
            size: size,
            icon: buttonIcon,
            label: buttonLabel,
            action: buttonAction,
            expand: shouldExpand)
    }
}

#Preview {
    ZStack {
        Colors.Neutral.light
        VStack {
            PrimaryButton(
                size: .small,
                icon: .init(icon: SFSymbols.chevronLeft, side: .leading),
                label: "Button",
                expand: false,
                action: {})
            PrimaryButton(
                size: .medium,
                label: "Button",
                expand: false,
                action: {})
            PrimaryButton(
                size: .large,
                label: "Button",
                expand: false,
                action: {})
        }
    }.ignoresSafeArea()
}
