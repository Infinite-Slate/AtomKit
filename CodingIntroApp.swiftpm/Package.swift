// swift-tools-version: 6.0
import PackageDescription
import AppleProductTypes

let package = Package(
    name: "CodingIntro",
    platforms: [.iOS("18.0")],
    products: [
        .iOSApplication(
            name: "CodingIntro",
            targets: ["CodingIntro"],
            bundleIdentifier: "com.infiniteslate.CodingIntro",
            teamIdentifier: "",
            displayVersion: "1.0",
            bundleVersion: "1",
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [.pad, .phone, .mac],
            supportedInterfaceOrientations: [.portrait, .landscapeRight, .landscapeLeft],
            appCategory: .education
        )
    ],
    targets: [
        .executableTarget(
            name: "CodingIntro",
            path: "Sources",
            swiftSettings: [.swiftLanguageMode(.v6)]
        )
    ]
)
