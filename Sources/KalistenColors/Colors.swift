//
//  Copyright © Kalisten 2024-2026
//

import SwiftUI

public enum Colors {
    public enum Primary {
        public static let light = Color(Asset.lightTangarine.color)
        public static let dark = Color(Asset.darkTangarine.color)
        public static let darker = Color(Asset.darkerTangarine.color)

        public enum Mid {
            private static let color = Color(Asset.midTangarine.color)

            public static let opaque = color.opacity(1.0)
            public static let semiOpaque = color.opacity(0.64)
            public static let semiTranslucent = color.opacity(0.48)
            public static let translucent = color.opacity(0.1)
        }
    }
    public enum Secondary {
        public static let light = Color(Asset.lightGrey.color)
        public static let dark = Color(Asset.darkGrey.color)
        public static let darker = Color(Asset.darkerGrey.color)

        public enum Lighter {
            private static let color = Color(Asset.lighterGrey.color)

            public static let opaque = color.opacity(1.0)
            public static let translucent = color.opacity(0.1)
        }
        public enum Mid {
            private static let color = Color(Asset.midGrey.color)

            public static let opaque = color.opacity(1.0)
            public static let semiOpaque = color.opacity(0.48)
            public static let semiTranslucent = color.opacity(0.24)
            public static let translucent = color.opacity(0.08)
        }
    }
    public enum Neutral {
        public static let lighter = Color(Asset.lighterPebble.color)
        public static let light = Color(Asset.lightPebble.color)
        public static let mid = Color(Asset.midPebble.color)
        public static let dark = Color(Asset.darkPebble.color)
        public static let darker = Color(Asset.darkerPebble.color)

        public enum Light {
            private static let color = Color(Asset.lightPebble.color)
            public static let opaque = color.opacity(1.0)
            public static let semiOpaque = color.opacity(0.75)
            public static let semiTranslucent = color.opacity(0.5)
        }
        public enum Mid {
            private static let color = Color(Asset.midPebble.color)
            public static let opaque = color.opacity(1.0)
            public static let semiOpaque = color.opacity(0.75)
            public static let semiTranslucent = color.opacity(0.5)
            public static let translucent = color.opacity(0.25)
        }
        public enum Dark {
            private static let color = Color(Asset.darkPebble.color)
            public static let opaque = color.opacity(1.0)
            public static let semiTranslucent = color.opacity(0.5)
            public static let translucent = color.opacity(0.25)
        }
        public enum Darker {
            private static let color = Color(Asset.darkerPebble.color)
            public static let opaque = color.opacity(1.0)
            public static let semiTranslucent = color.opacity(0.5)
            public static let translucent = color.opacity(0.2)
        }
    }
    public enum System {
        public static let success = Color(Asset.lime.color)
        public static let warning = Color(Asset.mustard.color)

        public enum Error {
            private static let color = Color(Asset.tomato.color)

            public static let opaque = color.opacity(1.0)
            public static let semiOpaque = color.opacity(0.64)
            public static let semiTranslucent = color.opacity(0.24)
            public static let translucent = color.opacity(0.1)
        }
    }
}
