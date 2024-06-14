//
//  Copyright © Kalisten 2024
//

import SwiftUI

public enum Colors {
    public enum Primary {
        public static let light = Color(Asset.lightTangarine.color)
        public static let mid = Color(Asset.midTangarine.color)
        public static let dark = Color(Asset.darkTangarine.color)
        public static let darker = Color(Asset.darkerTangarine.color)
    }
    public enum Secondary {
        public static let lighter = Color(Asset.lighterGrey.color)
        public static let light = Color(Asset.lightGrey.color)
        public static let mid = Color(Asset.midGrey.color)
        public static let dark = Color(Asset.darkGrey.color)
        public static let darker = Color(Asset.darkerGrey.color)
    }
    public enum Neutral {
        public static let lighter = Color(Asset.lighterPebble.color)
        public static let light = Color(Asset.lightPebble.color)
        public static let mid = Color(Asset.midPebble.color)
        public static let dark = Color(Asset.darkPebble.color)
        public static let darker = Color(Asset.darkerPebble.color)
    }
    public enum System {
        public static let success = Color(Asset.lime.color)
        public static let warning = Color(Asset.mustard.color)
        public static let error = Color(Asset.tomato.color)
    }
}
