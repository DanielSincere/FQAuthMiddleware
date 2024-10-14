// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "SincereAuthMiddleware",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .library(name: "SincereAuthMiddleware", targets: ["SincereAuthMiddleware"]),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.65.1"),
    .package(url: "https://github.com/vapor/jwt.git", from: "4.2.1"),
  ],
  targets: [

    .target(name: "SincereAuthMiddleware", dependencies: [
      .product(name: "Vapor", package: "vapor"),
      .product(name: "JWT", package: "jwt"),
    ]),
    .testTarget(name: "SincereAuthMiddlewareTests", dependencies: [
      .product(name: "XCTVapor", package: "vapor"),
      "SincereAuthMiddleware",
    ]),
  ]
)
