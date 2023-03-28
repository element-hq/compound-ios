// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Compound", targets: ["Compound"])
    ],
    dependencies: [
        .package(url: "https://github.com/vector-im/compound-design-tokens.git", revision: "342145ff8044b58b967186b0efe34477e1f7c3ca"),
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
