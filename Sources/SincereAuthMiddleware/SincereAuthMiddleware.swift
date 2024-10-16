import Foundation
import Vapor

public struct SincereAuthMiddleware: Middleware {

  public let requiredRole: String?
  public init(requiredRole: String? = nil) {
    self.requiredRole = requiredRole
  }

  public func respond(to request: Vapor.Request,
                      chainingTo next: Vapor.Responder) -> NIOCore.EventLoopFuture<Vapor.Response> {

    SincereAuthAuthenticator()
      .authenticate(request: request)
      .flatMap { () in

        guard let token = request.auth.get(SincereAuthSessionToken.self) else {
          return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
        }

        guard let requiredRole = requiredRole else {
          return next.respond(to: request)
        }

        guard token.roles.contains(requiredRole) else {
          return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
        }

        return next.respond(to: request)
      }
  }
}
