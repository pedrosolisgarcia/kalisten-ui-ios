//
//  Copyright © Kalisten 2024
//

import SwiftUI

public enum IconType {
    case sfSymbol(String)
    case imageAsset(String)
}

public struct NavigationButton: View {
    let imageType: IconType
    let label: LocalizedStringKey

    public var body: some View {
        Text("Hello, World!")
    }
}
