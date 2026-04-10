// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CodingIntro",
    platforms: [.iOS(.v18)],
    products: [],
    targets: [
        .executableTarget(
            name: "CodingIntro",
            path: "Sources",
            swiftSettings: [.swiftLanguageMode(.v6)]
        )
    ]
)
