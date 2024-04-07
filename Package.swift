// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZowieChatSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ZowieChatSDK",
            targets: ["ZowieSDKTargets"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            .upToNextMajor(from: "7.8.0")
        ),
        .package(
            url: "https://github.com/apollographql/apollo-ios",
            from: "0.49.1"
        ),
        .package(
            url: "https://github.com/airbnb/lottie-ios",
            exact: "4.2.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "ZowieSDK",
            path: "ZowieSDK.xcframework"
        ),
        .target(
            name: "ZowieSDKTargets",
            dependencies: [
                .target(name: "ZowieSDK"),
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "Apollo", package: "apollo-ios"),
                .product(name: "ApolloWebSocket", package: "apollo-ios"),
            ],
            path: "Sources"
        )
    ]
)
