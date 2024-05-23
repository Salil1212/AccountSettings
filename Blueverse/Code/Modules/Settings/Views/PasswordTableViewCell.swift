//
//  PasswordTableViewCell.swift
//  NewsApp
//
//  Created by Nickelfox on 10/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import UIKit

protocol PasswordTableViewCellDelegate:
    AnyObject {
    func didTapChangePasswordButton(in cell: PasswordTableViewCell)
}
class PasswordTableViewCell: UITableViewCell {
    
    @IBOutlet weak var changePasswordBtn: UIButton!
    
    weak var delegate: PasswordTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        changePasswordBtn.addTarget(self, action: #selector(changePasswordTappd), for: .touchUpInside)
        // Initialization code
    }
    func config (with profileData: ProfileData){
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc private func
    changePasswordTappd(){
        delegate?.didTapChangePasswordButton(in: self)
    }
    
    
}
