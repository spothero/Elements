// swift-tools-version:5.1
// Copyright © 2020 SpotHero, Inc. All rights reserved.

import PackageDescription

let package = Package(
    name: "Elements",
    platforms: [
        .iOS(.v8),          // minimum supported version via SPM
        .macOS(.v10_10),    // minimum supported version via SPM
        .tvOS(.v9),         // minimum supported version via SPM
        .watchOS(.v2),      // minimum supported version via SPM
    ],
    products: [
        .executable(name: "zinc", targets: ["zinc"]),
        .library(name: "ZincFramework", targets: ["ZincFramework"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "2.0.0"),
        // Source stability for ArgumentParser is only guaranteed up to the next minor version
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.0.5")),
    ],
    targets: [
        // Executable Product Targets
        .target(
            name: "zinc",
            dependencies: [
                .target(name: "ZincFramework"),
            ]
        ),
        // Library Product Targets
        .target(
            name: "ZincFramework",
            dependencies: [
                .target(name: "FileHero"),
                .target(name: "Lumberjack"),
                "ArgumentParser",
                "Yams",
            ]
        ),
        // Internal Targets
        .target(
            name: "FileHero",
            dependencies: [
                .target(name: "Lumberjack"),
                .target(name: "ShellRunner"),
            ]
        ),
        .target(
            name: "ShellRunner",
            dependencies: [
                .target(name: "Lumberjack"),
            ]
        ),
        .target(
            name: "Lumberjack",
            dependencies: []
        ),
        // Test Targets
        .testTarget(
            name: "ZincTests",
            dependencies: [
                .target(name: "ZincFramework"),
            ]
        ),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
