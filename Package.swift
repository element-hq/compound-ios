// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Compound", targets: ["Compound"])
    ],
    dependencies: [
        .package(url: "https://github.com/element-hq/compound-design-tokens", exact: "4.0.1"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect", from: "1.3.0"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", from: "6.2.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", exact: "1.18.3")
    ],
    targets: [
        .target(
            name: "Compound",
            dependencies: [
                .product(name: "CompoundDesignTokens", package: "compound-design-tokens"),
                .product(name: "SwiftUIIntrospect", package: "SwiftUI-Introspect"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
            ]
        ),
        .testTarget(
            name: "CompoundTests",
            dependencies: [
                "Compound",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            exclude: [
                "__Snapshots__"
            ],
        )
    ]
)
