//
//  User+API.swift
//  Model
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit
import JSONParsing
import AnyErrorKit
import ReactiveSwift


extension User {
    
    public static func login(_ email: String, _ password: String, _ app: String) -> SignalProducer<Bool, ModelError> {
        return SignalProducer { (signal, _) in
            let router = UserRouter.login(email: email, password: password, app: app)
            BlueverseAPIClient.shared.request(router) { (result: APIResult<User>) in
                switch result {
                case .success(let response):
                    DataModel.shared.authToken = response.token
                    signal.send(value: true)
                    signal.sendCompleted()
                case .failure(let error):
                    signal.send(error: .customError(error: error))
                    
                }
            }
        }
    }
}
