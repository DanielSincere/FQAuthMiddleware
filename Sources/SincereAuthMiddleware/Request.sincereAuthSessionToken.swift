import Vapor

extension Request {

  public var sincereAuthSessionToken: SincereAuthSessionToken? {
    self.auth.get(SincereAuthSessionToken.self)
  }
}
