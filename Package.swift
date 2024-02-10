// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LinkKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "LinkKit",
            targets: ["LinkKit"]),
    ],
    targets: [
        .target(
            name: "LinkKit"),
    ]
)
