import Vapor
import JWT
import Foundation

public struct SincereAuthSessionToken: Content, Authenticatable, JWTPayload {

  public let sub: SubjectClaim // user id
  public let exp: ExpirationClaim
  public let iat: IssuedAtClaim
  public let iss: IssuerClaim
  public let deviceName: String
  public let roles: [String]
   
  public func verify(using signer: JWTKit.JWTSigner) throws {
    try exp.verifyNotExpired()

    guard let _ = UUID(uuidString: sub.value) else {
      throw Errors.uuidNotParsableFromSubject
    }
  }

  public var userID: UUID? {
    UUID(uuidString: sub.value)
  }

  public init(userID: UUID,
              deviceName: String,
              roles: [String],
              expiration: ExpirationClaim,
              iat: IssuedAtClaim = IssuedAtClaim(value: Date()),
              iss: IssuerClaim) {
    self.sub = SubjectClaim(value: userID.uuidString)
    self.exp = expiration
    self.iat = iat
    self.iss = iss
    self.deviceName = deviceName
    self.roles = roles
  }

  public enum Errors: LocalizedError {
    case uuidNotParsableFromSubject
    
    public var errorDescription: String? {
      "Could not parse UUID from JWT subject"
    }
  }
}
