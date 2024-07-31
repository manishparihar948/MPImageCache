//
//  Package.swift
//  MPImageCache
//
//  Created by Manish Parihar on 31.07.24.
//

// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MPImageCache",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "MPImageCache",
            targets: ["MPImageCache"]),
    ],
    targets: [
        .target(
            name: "MPImageCache",
            path: "MPImageCache",
            exclude: ["Tests"]
        ),
        .testTarget(
            name: "MPImageCacheTests",
            dependencies: ["MPImageCache"],
            path: "MPImageCacheTests"
        ),
    ]
)
