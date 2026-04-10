// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AtomKit",
    platforms: [
        .iOS(.v18),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "AtomKit",
            targets: ["AtomKit"]
        ),
    ],
    targets: [
        .target(
            name: "AtomKit",
            path: "Sources/AtomKit",
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .testTarget(
            name: "AtomKitTests",
            dependencies: ["AtomKit"],
            path: "Tests/AtomKitTests",
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
    ]
)
