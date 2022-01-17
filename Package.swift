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
    dependencies: [],
    targets: [
        .target(name: "SingleChat",
               path: ".",
               exclude: ["README.md"])
    ]
)
