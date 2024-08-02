// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "search-bar-swiftui",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "search-bar-swiftui",
            targets: ["search-bar-swiftui"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "search-bar-swiftui"),
        .testTarget(
            name: "search-bar-swiftuiTests",
            dependencies: ["search-bar-swiftui"]
        ),
    ]
)