// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Compound", targets: ["Compound"])
    ],
    dependencies: [
        .package(url: "https://github.com/element-hq/compound-design-tokens", exact: "1.5.0"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect", from: "1.2.0"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", from: "5.3.0"),
        .package(url: "https://github.com/BarredEwe/Prefire", from: "2.8.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.16.2")
    ],
    targets: [
        .target(
            name: "Compound",
            dependencies: [
                .product(name: "CompoundDesignTokens", package: "compound-design-tokens"),
                .product(name: "SwiftUIIntrospect", package: "SwiftUI-Introspect"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                .product(name: "Prefire", package: "Prefire")
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
            plugins: [
                .plugin(name: "PrefireTestsPlugin", package: "Prefire")
            ]
        )
    ]
)
