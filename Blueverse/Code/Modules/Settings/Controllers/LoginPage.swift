//
//  LoginPage.swift
//  Blueverse
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPageControllerProtocol: AnyObject {
    
}

class LoginPageController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    var viewModel: LoginPageController!
    override func viewDidLoad() {
        
    }
}
