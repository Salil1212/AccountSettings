import Foundation
import ReactiveSwift
import FoxAPIKit

extension User {
    
    public static func updateProfile(email: String,
                                     password: String,
                                     app: String) -> SignalProducer<Bool, ModelError> {
        return SignalProducer { (signal, disposable) in
            let router = UserUpdateRouter.login(email: email,
                                                 password: password,
                                                 app: app)
            BlueverseAPIClient.shared.request(router) { (result: APIResult<User>) in
                switch result {
                case .success(let user):
                    // Handle success response here if needed
                    signal.send(value: true) // Sending true to indicate success
                    signal.sendCompleted()
                case .failure(let error):
                    // Handle failure case here
                    signal.send(error: .customError(error: error))
                }
            }
        }
    }
}
