// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "strings-file-merge-driver",
    products: [
        .executable(name: "strings-file-merge-driver", targets: ["strings-file-merge-driver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hectr/strings-file-lib", from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "strings-file-merge-driver",
            dependencies: ["StringsFileLib"]),
    ]
)
