// swift-tools-version:5.5

//
// This source file is part of the Horn as a Service open source project
//
// SPDX-FileCopyrightText: 2022 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "HornAsAService",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .executable(
            name: "WebService",
            targets: ["WebService"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.9.1"))
    ],
    targets: [
        .executableTarget(
            name: "WebService",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniREST", package: "Apodini"),
                .product(name: "ApodiniOpenAPI", package: "Apodini")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
