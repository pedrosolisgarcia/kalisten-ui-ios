//
//  Copyright © Kalisten 2026
//

import KalistenTypography
import KalistenGradients
import KalistenColors
import KalistenLayout
import KalistenCore

import SwiftUI

public struct AddButton: View {
    @Binding private var status: ActionStatus
    private let size: ButtonSize
    private let buttonLabel: LocalizedStringKey
    private let buttonAction: () -> Void

    public init(
        size: ButtonSize,
        status: Binding<ActionStatus> = .constant(.idle),
        label: LocalizedStringKey,
        action: @escaping () -> Void
    ) {
        self._status = status
        self.size = size
        self.buttonLabel = label
        self.buttonAction = action
    }

    public var body: some View {
        MainButton(
            status: $status,
            type: .add,
            size: size,
            icon: ButtonIcon(
                icon: SFSymbols.plus,
                side: .leading),
            label: buttonLabel,
            glassEffect: .clear,
            action: buttonAction,
            expand: true)
    }
}

#Preview {
    ZStack {
        Colors.Neutral.light
        VStack(spacing: .small) {
            AddButton(
                size: .small,
                label: "Add Set",
                action: {})
            AddButton(
                size: .medium,
                label: "Add Exercise",
                action: {})
            AddButton(
                size: .large,
                label: "Add Block",
                action: {})
        }
        .padding()
    }.ignoresSafeArea()
}
