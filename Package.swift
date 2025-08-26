// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "search-bar-swiftui",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "SearchBarSwiftUI",
            targets: ["SearchBarSwiftUI"]),
    ],
    targets: [
        .target(
            name: "SearchBarSwiftUI",
            path: "Sources/Search Bar"
        )
    ]
)
