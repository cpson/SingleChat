// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SingleChat",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "SingleChat", targets: ["SingleChat"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nathantannar4/InputBarAccessoryView.git", .upToNextMajor(from: "5.2.0"))
    ],
    targets: [
        .target(name: "SingleChat",
                dependencies: ["InputBarAccessoryView"],
                path: ".",
                exclude: ["README.md"])
    ]
)
