
# Kalisten UI Library for iOS

## Overview

Kalisten UI is a comprehensive SwiftUI library designed to expedite the development of iOS applications within the Kalisten ecosystem. It offers a collection of reusable UI components, layouts, and design system utilities, ensuring consistency and efficiency across multiple projects.

## Features

- **Modular Design**: Organized into separate modules for UI, Colors, Typography, and more for easy integration.
- **SwiftUI Components**: A set of pre-designed, customizable SwiftUI components such as `PrimaryButton`.
- **Design System**: Incorporates a cohesive design system with assets, colors, and typography defined in `Assets.xcassets`.

## Requirements

- iOS `16.0+`
- Xcode `14.0+`
- Swift `5.9+`

## Installation

To integrate Kalisten UI into your Xcode project using *Swift Package Manager*, add it to your `Package.swift` as a dependency:

```swift
dependencies: [
    .package(url: "https://github.com/pedrosolisgarcia/kalisten-ui-ios.git", from: "1.0.0-alpha")
]
```

## Usage

Import the Kalisten UI modules in your SwiftUI views to get started:

```swift
import KalistenUI
```

Then, use the components as you would typically use any SwiftUI view:

```swift
var body: some View {
    PrimaryButton()
}
```

## Modules

### Colors

Includes a palette of colors defined for the design system.

### Gradients

Includes a collection of gradient styles for visually rich interfaces.

### Typography

Defines font styles, sizes, and facilitates typography consistency.

### Layout

Contains layout helpers and grid definitions for complex UI structures.

### UI

This module houses pre-built SwiftUI components like `PrimaryButton`.

## License

Kalisten UI is released under the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html). See `LICENSE` for details.

## Contact

For major concerns or support, please open an issue in the GitHub repository issue tracker. For other queries, please reach out <hello@kalisten.app>

---

Kalisten UI is maintained by the *Kalisten development team*. All rights reserved
