//
//  Copyright © Kalisten 2026
//

import SwiftUI

/// A Menu wrapper that keeps the label visible on iOS 26 when the menu is presented.
///
/// iOS 26 changed Menu behavior so the label disappears with a glass-like animation when
/// the menu opens. FixedMenu uses a ZStack to keep the label always visible while an
/// overlay handles taps to open the menu.
///
/// Use the same API as SwiftUI's `Menu` — simply replace `Menu` with `FixedMenu`.
public struct FixedMenu<Label: View, Content: View>: View {
    @ViewBuilder private let content: () -> Content
    @ViewBuilder private let label: () -> Label
    private let primaryAction: (() -> Void)?

    public init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder label: @escaping () -> Label,
        primaryAction: (() -> Void)? = nil
    ) {
        self.content = content
        self.label = label
        self.primaryAction = primaryAction
    }

    public var body: some View {
        if #available(iOS 26, *) {
            fixedBody
        } else {
            standardBody
        }
    }

    @ViewBuilder
    private var fixedBody: some View {
        ZStack {
            label()
            if let primaryAction {
                Menu(content: content, label: { Color.clear }, primaryAction: primaryAction)
            } else {
                Menu(content: content, label: { Color.clear })
            }
        }
    }

    @ViewBuilder
    private var standardBody: some View {
        if let primaryAction {
            Menu(content: content, label: label, primaryAction: primaryAction)
        } else {
            Menu(content: content, label: label)
        }
    }
}
