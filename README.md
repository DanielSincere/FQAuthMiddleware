# SincereAuthMiddleware

Vapor package to consume the tokens created by an [SincereAuth](https://github.com/FullQueueDeveloper/SincereAuth) server instance.

## Installation

In the `dependencies` section of your `Package.swift`, add

    .package(url: "https://github.com/FullQueueDeveloper/SincereAuth", from: "0.1.1"),

And in your server's target's `dependencies` section, add

    .product(name: "SincereAuthMiddleware", package: "SincereAuthMiddleware")

## Environment setup

Provide your auth private key as a Base64-encoded string in the environment variable `AUTH_PRIVATE_KEY`. This needs to be the same key used by your main instance of [SincereAuth](https://github.com/FullQueueDeveloper/SincereAuth).

## Usage

In your routes declaration, `import SincereAuthMiddleware`

    routes
      .group(SincereAuthMiddleware()) { protected in
        protected.get("protected") { req in
          return "Logged in"
        }
      }

To require a certain role for a route, add it to the initializer of the middleware:

    routes
      .group(SincereAuthMiddleware(requiredRole: "admin")) { admin in
        admin.get("admin") { req in
          return "Logged in as an admin"
        }
      }

## Example

For an example, see https://github.com/DanielSincere/SincereAuth-Sample-Microservice

## Sponsor me

If you learned something or found this useful, you can show your appreciation by sponsoring me here on GitHub https://github.com/sponsors/DanielSincere
