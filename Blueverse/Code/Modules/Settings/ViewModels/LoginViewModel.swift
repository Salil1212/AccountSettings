//
//  LoginViewModel.swift
//  Blueverse
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    
}

class LoginViewModel {
    
    weak var view: LoginViewModelProtocol?
    
    init(view: LoginViewModelProtocol? ) {
        self.view = view
    }
}
