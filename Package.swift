// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "strings-file-merge-driver",
    products: [
        .executable(name: "strings-file-merge-driver", targets: ["strings-file-merge-driver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hectr/strings-file-lib", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "strings-file-merge-driver",
            dependencies: ["StringsFileLib"]),
    ]
)
