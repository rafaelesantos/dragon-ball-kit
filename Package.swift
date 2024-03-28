// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DragonBallKit",
    defaultLocalization: "pt",
    platforms: [
        .iOS(.v17),
        .macCatalyst(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1),
        .driverKit(.v23)
    ],
    products: [
        .library(
            name: "DragonBallKit",
            targets: ["DragonBallKit", "DragonBallUIKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rafaelesantos/refds-shared.git", branch: "main"),
        .package(url: "https://github.com/rafaelesantos/refds-design-system.git", branch: "main"),
        .package(url: "https://github.com/rafaelesantos/refds-network.git", branch: "main"),
        .package(url: "https://github.com/rafaelesantos/refds-injection.git", branch: "main")
    ],
    targets: [
        .target(
            name: "DragonBallKit",
            dependencies: [
                .product(name: "RefdsShared", package: "refds-shared"),
                .product(name: "RefdsNetwork", package: "refds-network"),
                .product(name: "RefdsInjection", package: "refds-injection")
            ]),
        .target(
            name: "DragonBallUIKit",
            dependencies: [
                "DragonBallKit",
                .product(name: "RefdsUI", package: "refds-design-system"),
            ])
    ]
)
