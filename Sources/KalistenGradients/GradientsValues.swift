//
//  Copyright © Kalisten 2024
//

import KalistenColors

import SwiftUI

internal extension LinearGradient {
    static let primaryVertical = LinearGradient(
        gradient: Gradient(
            colors: [
                Colors.Primary.mid,
                Colors.Primary.dark
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
}
