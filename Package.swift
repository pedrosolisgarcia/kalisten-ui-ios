// swift-tools-version: 5.9
//
//  Copyright © Kalisten 2024
//

import PackageDescription

let package = Package(
    name: "KalistenUI",
    platforms: [.iOS(.v16)],
    products: [
        /// Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KalistenUI",
            targets: [
                "KalistenUI",
                "KalistenColors",
                "KalistenLayout",
                "KalistenGradients",
                "KalistenTypography"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.2")
    ],
    targets: [
        /// Targets are the basic building blocks of a package, defining a module or a test suite.
        /// Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "KalistenColors",
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "KalistenGradients",
            dependencies: [
                "KalistenColors"
            ]
        ),
        .target(
            name: "KalistenLayout"
        ),
        .target(
            name: "KalistenTypography",
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "KalistenUI",
            dependencies: [
                "KalistenColors",
                "KalistenLayout",
                "KalistenTypography",
                "KalistenGradients"
            ]
        ),
        .testTarget(
            name: "UITests",
            dependencies: [
                "KalistenUI"
            ]
        )
    ]
)
