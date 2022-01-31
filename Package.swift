// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BannerWall",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BannerWall",
            targets: ["BannerWall"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BannerWall",
            dependencies: []
        )
    ]
)
