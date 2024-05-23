import Foundation
import FoxAPIKit

public enum UserRouter: BaseRouter {
    
    case login(email: String, password: String, app: String)
    
    
    public var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/user/authenticate"
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
