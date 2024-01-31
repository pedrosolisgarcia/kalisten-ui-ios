// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KalistenUI",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UI",
            targets: [
                "UI",
                "Colors",
                "Layout",
                "Gradients",
                "Typography"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Colors",
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "Gradients",
            dependencies: [
                "Colors"
            ]
        ),
        .target(
            name: "Layout"
        ),
        .target(
            name: "Typography",
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "UI",
            dependencies: [
                "Colors",
                "Layout",
                "Typography",
                "Gradients"
            ]
        ),
        .testTarget(
            name: "UITests",
            dependencies: [
                "UI"
            ]
        )
    ]
)
