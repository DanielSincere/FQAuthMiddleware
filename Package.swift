// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "FQAuthMiddleware",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .library(name: "FQAuthMiddleware", targets: ["FQAuthMiddleware"]),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.65.1"),
    .package(url: "https://github.com/vapor/jwt.git", from: "4.2.1"),
  ],
  targets: [

    .target(name: "FQAuthMiddleware", dependencies: [
      .product(name: "Vapor", package: "vapor"),
      .product(name: "JWT", package: "jwt"),
    ]),
    .testTarget(name: "FQAuthMiddlewareTests", dependencies: [
      .product(name: "XCTVapor", package: "vapor"),
      "FQAuthMiddleware",
    ]),
  ]
)
