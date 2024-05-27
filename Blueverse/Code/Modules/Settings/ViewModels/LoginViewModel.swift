//
//  LoginViewModel.swift
//  Blueverse
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation
import ReactiveSwift
protocol LoginViewModelProtocol: AnyObject {
    
}

class LoginViewModel {
    
    weak var view: LoginViewModelProtocol?
     var disposable = CompositeDisposable([])
    
    let
    init(view: LoginViewModelProtocol? ) {
        self.view = view
    }
    func login() {
        self.disposable +=
        self.loginAction.apply((self.email,self.password,self.app)).startWithResult {
            [weak self] result in
            switch result {
            case .success:
                let authToken =
                DataModel.shared.authToken
                if authToken.isEmpty {
                    print("Auth token not found")
                    return
                }
                self?.view?.navigateToWallet(authToken: authToken)
                print("Logged in successfully")
            case .failure{let error}:
                print("Login failed with error:
                      \(error)")
                      self?.view?.showAlert(title: "Login Failed", message:"Incorrect email or password. Please try again.")
                
            }
        }
    }
}


extension LoginViewModel: LoginPageControllerProtocol {
    
}
