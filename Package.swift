// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "strings-file-merge-driver",
    dependencies: [
        .Package(url: "https://github.com/hectr/strings-file-lib", majorVersion: 1)
    ]
)
