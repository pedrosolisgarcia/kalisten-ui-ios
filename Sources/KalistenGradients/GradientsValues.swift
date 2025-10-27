//
//  Copyright © Kalisten 2024
//

import KalistenColors

import SwiftUI

internal extension LinearGradient {
    static let primaryVertical = LinearGradient(
        gradient: Gradient(
            colors: [
                Colors.Primary.Mid.opaque,
                Colors.Primary.dark
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )

    static let secondaryVertical = LinearGradient(
        gradient: Gradient(
            colors: [
                Colors.Primary.Mid.opaque.opacity(0.2),
                Colors.Primary.dark.opacity(0.2)
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
}
