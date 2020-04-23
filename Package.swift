// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InstallSwiftScript",
    products: [
    .library(name: "InstallSwiftScriptCore", targets: ["InstallSwiftScriptCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/DIY-Team/RunsShellCommand", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "InstallSwiftScript",
            dependencies: ["InstallSwiftScriptCore"]),
        .target(
            name: "InstallSwiftScriptCore",
            dependencies: ["RunsShellCommand"])
    ]
)
