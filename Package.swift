// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "learn-kitura",
    products: [
        .executable(name: "learn-kitura", targets: ["Main"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.8.1"),
    ],
    targets: [
        .target(name: "Main", dependencies: [
            "Kitura"
        ]),
        .testTarget(name: "learn-kituraTests", dependencies: ["Main"]),
    ]
)
