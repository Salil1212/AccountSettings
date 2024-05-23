import Foundation
import FoxAPIKit

public enum UserUpdateRouter: BaseRouter {
    
    case login(email: String, password: String, app: String)
    
    
    public var method: HTTPMethod {
        switch self {
        case .login:
            return .put
        }
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/user/profile/update"
        }
    }
    
    
    public var params: [String: Any] {
        switch self {
        case .login(let email, let password, let app):
            return ["email": email,
                    "password": password,
                    "app": app]
        }
    }
    
    public var keypathToMap: String? {
        switch self {
        case .login:
            return "data"
        }
    }
}
