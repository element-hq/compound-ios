// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Compound", targets: ["Compound"])
    ],
    dependencies: [
        .package(url: "https://github.com/vector-im/compound-design-tokens.git", revision: "d9d1a792d8a124708c7e15becd359893ee9e9ea6"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.2.3")
    ],
    targets: [
        .target(name: "Compound",
                dependencies: [
                    .product(name: "CompoundDesignTokens", package: "compound-design-tokens"),
                    .product(name: "Introspect", package: "SwiftUI-Introspect")
                ]),
        .testTarget(name: "CompoundTests", dependencies: ["Compound"])
    ]
)
