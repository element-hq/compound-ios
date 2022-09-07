// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "Compound",
                 targets: ["Compound"])
    ],
    targets: [
        .target(name: "Compound",
                dependencies: ["CompoundTokens"]),
        .target(name: "CompoundTokens"),
        .testTarget(name: "CompoundTests",
                    dependencies: ["Compound"])
    ]
)
