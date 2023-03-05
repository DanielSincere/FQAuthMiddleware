import Vapor

enum EnvVars: String, CaseIterable {

  // generate with `swish generate-jwt-key`
  case authPrivateKey = "AUTH_PRIVATE_KEY"

  func loadOrFatal() -> String {
    guard let string = Environment.get(self.rawValue) else {
      fatalError("\(self.rawValue) not set in environment")
    }

    return string
  }

  func load() throws -> String {
    guard let string = Environment.get(self.rawValue) else {
      throw EnvVarMissingError(name: self.rawValue)
    }

    return string
  }

  struct EnvVarMissingError: LocalizedError {
    let name: String
    var errorDescription: String? {
      "Expected a value for `\(name)` in the environment but it was missing"
    }
  }
}
