// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InstallSwiftScript",
//    products: [
//    .executable(name: "InstallSwiftScript", targets: ["InstallSwiftScript"])
//    ],
    dependencies: [
        .package(url: "https://github.com/DIY-Team/RunsShellCommand", from: "0.0.2"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
    ],
    targets: [
        .target(
            name: "InstallSwiftScript",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "RunsShellCommand", package: "RunsShellCommand"),
            ]),
    ]
)
