//
//  Copyright © Kalisten 2024
//

import CoreFoundation

public enum SoftGrid: CGFloat {
    // MARK: Stroke + Default values
    case zero = 0
    case unit = 1

    // MARK: Component
    case base = 8
    case small = 16

    // MARK: Component + Layout
    case medium = 24

    // MARK: Layout
    case large = 32
    case xlarge = 40
    case xxlarge = 48
    case xxxlarge = 56
    case gigantic = 64
}
