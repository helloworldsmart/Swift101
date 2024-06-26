// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Sorting",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "Sorting",
            targets: ["AppModule"],
            bundleIdentifier: "co.michaelchenfun.app.Sorting",
            teamIdentifier: "3TX5EDTP2R",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .rocket),
            accentColor: .presetColor(.yellow),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
