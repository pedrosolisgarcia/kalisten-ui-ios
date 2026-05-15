// swift-tools-version: 6.2
//
//  Copyright © Kalisten 2024-2026
//
/// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "KalistenUI",
    platforms: [.iOS(.v26)],
    products: [
        /// Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KalistenUI",
            targets: [
                "KalistenUI",
                "KalistenColors",
                "KalistenCore",
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
            swiftSettings: [.swiftLanguageMode(.v5)],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "KalistenCore",
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .target(
            name: "KalistenGradients",
            dependencies: [
                "KalistenColors"
            ],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .target(
            name: "KalistenLayout",
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .target(
            name: "KalistenTypography",
            dependencies: [
                "KalistenLayout"
            ],
            resources: [.process("Resources")],
            swiftSettings: [.swiftLanguageMode(.v5)],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "KalistenUI",
            dependencies: [
                "KalistenColors",
                "KalistenCore",
                "KalistenLayout",
                "KalistenTypography",
                "KalistenGradients"
            ],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .testTarget(
            name: "UITests",
            dependencies: [
                "KalistenUI"
            ],
            swiftSettings: [.swiftLanguageMode(.v5)]
        )
    ]
)
