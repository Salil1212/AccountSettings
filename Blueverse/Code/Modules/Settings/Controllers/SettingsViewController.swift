//
//  ViewController.swift
//  NewsApp
//
//  Created by Nickelfox on 10/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import Model

class SettingsViewController: UIViewController, ProfileTableViewCellDegate, PasswordTableViewCellDelegate, ChangePasswordTableViewCellDelegate, EditProfileTableViewCellDelegate {
    
    
    var disposable = CompositeDisposable([])
   
    
    
    var profileDataVal = [
        ProfileData(name: "John Doe", email: "john@example.com", phone: "9151779653")
    ]
    var isOutletSubscriptionMode = false
    var isEditingProfile = false
    var isChangePassword = false
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var outletSubsBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRegister()
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        outletSubsBtn.addTarget(self, action: #selector(outletSubsBtnTapped), for: .touchUpInside )
        
    }
    @objc func profileButtonTapped() {
        isOutletSubscriptionMode = false
        tableView.reloadData()
    }
    @objc func outletSubsBtnTapped() {
        isOutletSubscriptionMode = true
        tableView.reloadData()
    }
    
    func tableRegister() {
        let profileNib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(profileNib, forCellReuseIdentifier: "ProfileTableViewCell")
        let kycNib = UINib(nibName: "KYCTableViewCell", bundle: nil)
        tableView.register(kycNib, forCellReuseIdentifier: "KYCTableViewCell")
        let paswrdNib = UINib(nibName: "PasswordTableViewCell", bundle: nil)
        tableView.register(paswrdNib, forCellReuseIdentifier: "PasswordTableViewCell")
        let otletNib = UINib(nibName: "OutletSubscriptionTableViewCell", bundle: nil)
        tableView.register(otletNib, forCellReuseIdentifier: "OutletSubscriptionTableViewCell")
        let editProfileNib = UINib(nibName: "EditProfileTableViewCell", bundle: nil)
        tableView.register(editProfileNib, forCellReuseIdentifier: "EditProfileTableViewCell")
        
        let changePasswordNib = UINib(nibName: "ChangePasswordTableViewCell", bundle: nil)
        tableView.register(changePasswordNib, forCellReuseIdentifier: "ChangePasswordTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return isOutletSubscriptionMode ? 1 : 3
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if isOutletSubscriptionMode {
            return 1}
        else {
                switch section {
                case 0:
                    return 1
                case 1:
                    return isEditingProfile ? 1:profileDataVal.count
                case 2:
                    return isChangePassword ? 1 : 1
                default:
                    return 0
                }
            }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if isOutletSubscriptionMode {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OutletSubscriptionTableViewCell", for: indexPath)as? OutletSubscriptionTableViewCell else {
                return UITableViewCell()
            }
            // Configure KYC cell
            return cell
            
        }
        else{
            switch indexPath.section {
            case 0:
                if indexPath.row == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "KYCTableViewCell", for: indexPath) as? KYCTableViewCell else {
                        return UITableViewCell()
                    }
                    // Configure KYC cell
                    return cell
                }
                
                
            case 1:
                if isEditingProfile {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileTableViewCell", for: indexPath) as? EditProfileTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.delegate = self
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.delegate = self
                    return cell
                }
                
            case 2:
                if isChangePassword {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangePasswordTableViewCell", for: indexPath) as? ChangePasswordTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.delegate = self
                    return cell
                }
                else{
                    if indexPath.row == 0 {
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PasswordTableViewCell", for: indexPath) as? PasswordTableViewCell else {
                            return UITableViewCell()
                        }
                        cell.delegate = self
                        return cell
                    }
                }
                default:
                    return UITableViewCell()
                }
                return UITableViewCell()
            }
        }
    
    
    func didTapEditButton(in cell: ProfileTableViewCell) {
        isEditingProfile = true
        tableView.reloadData()
    }
    
    func didTapChangePasswordButton(in cell: PasswordTableViewCell) {
        isChangePassword = true
        tableView.reloadData()
    }
    
    func didTapCancelButton(in cell: ChangePasswordTableViewCell) {
        isChangePassword = false
        tableView.reloadData()
    }
    func didTapCancelButton(in cell: EditProfileTableViewCell) {
            isEditingProfile = false
            tableView.reloadData()
        }

}
//
//extension SettingsViewController {
//    
//    let fetchMachinesAction = Action {(email: String, password: String, app: String) -> SignalProducer<Bool, ModelError> in
//        return User.updateProfil`e(email: String, password: String, app: String)
//    }
//}
