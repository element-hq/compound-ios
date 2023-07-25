// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Compound", targets: ["Compound"])
    ],
    dependencies: [
        .package(url: "https://github.com/vector-im/compound-design-tokens.git", revision: "aa55111d94486acbfd3344cf4d08b64723bd6703"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.9.0")
    ],
    targets: [
        .target(name: "Compound",
                dependencies: [
                    .product(name: "CompoundDesignTokens", package: "compound-design-tokens"),
                    .product(name: "SwiftUIIntrospect", package: "SwiftUI-Introspect")
                ]),
        .testTarget(name: "CompoundTests", dependencies: ["Compound"])
    ]
)
