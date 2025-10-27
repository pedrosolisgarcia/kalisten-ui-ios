//
//  Copyright © Kalisten 2024
//

import SwiftUI

public extension View {
    func fontStyle(_ font: Fonts) -> some View {
        let fontType = {
            if font.isMainFont {
                let fontFamily = font == .subtitle ? FontFamily.Oswald.medium : FontFamily.Oswald.bold
                return SwiftUI.Font.custom(fontFamily, size: font.size)
            } else {
                let fontWeight = font == .label ? SwiftUI.Font.Weight.semibold : SwiftUI.Font.Weight.regular
                return SwiftUI.Font.system(size: font.size, weight: fontWeight)
            }
        }()
        return self
            .font(fontType)
            .textCase(font.isMainFont ? .uppercase : .none)
    }
}
