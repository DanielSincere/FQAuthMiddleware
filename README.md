# FQAuthMiddleware

Vapor package to consume the tokens created by an [FQAuth](https://github.com/FullQueueDeveloper/FQAuth) server instance.

## Installation

In the `dependencies` section of your `Package.swift`, add

    .package(url: "https://github.com/FullQueueDeveloper/FQAuth", from: "0.1.0"),

And in your server's target's `dependencies` section, add `.product(name: "FQAuthMiddleware", package: "FQAuthMiddleware")`

## Example

For an example, see https://github.com/FullQueueDeveloper/FQAuth-Sample-Microservice
