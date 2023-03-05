# FQAuthMiddleware

Vapor package to consume the tokens created by an [FQAuth](https://github.com/FullQueueDeveloper/FQAuth) server instance.

## Installation

In the `dependencies` section of your `Package.swift`, add

    .package(url: "https://github.com/FullQueueDeveloper/FQAuth", from: "0.1.0"),

And in your server's target's `dependencies` section, add

    .product(name: "FQAuthMiddleware", package: "FQAuthMiddleware")

## Environment setup

Provide your auth private key as a Base64-encoded string in the environment variable `AUTH_PRIVATE_KEY`. This needs to be the same key used by your main instance of [FQAuth](https://github.com/FullQueueDeveloper/FQAuth).

## Usage

In your routes declaration, `import FQAuthMiddleware`

    routes
      .group(FQAuthMiddleware()) { protected in
        protected.get("protected") { req in
          return "Logged in"
        }
      }

To require a certain role for a route, add it to the initializer of the middleware:

    routes
      .group(FQAuthMiddleware(requiredRole: "admin")) { admin in
        admin.get("admin") { req in
          return "Logged in as an admin"
        }
      }

## Example

For an example, see https://github.com/FullQueueDeveloper/FQAuth-Sample-Microservice

## Sponsor me

If you learned something or found this useful, you can show your appreciation by sponsoring me here on GitHub https://github.com/sponsors/FullQueueDeveloper
