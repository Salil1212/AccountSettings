//
//  ProfileTableViewCell.swift
//  NewsApp
//
//  Created by Nickelfox on 10/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import UIKit

protocol ProfileTableViewCellDegate: AnyObject {
    func didTapEditButton(in cell: ProfileTableViewCell)
}
class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nametxt: UILabel!
    @IBOutlet weak var emailtxt: UILabel!
    @IBOutlet weak var phonetxt: UILabel!
    @IBOutlet weak var editProfile: UIButton!
//    @IBOutlet weak var phoneNotxt: UILabel!
    
    
    weak var delegate: ProfileTableViewCellDegate?
    
    
override func awakeFromNib() {
        super.awakeFromNib()
    editProfile.addTarget(self, action: #selector(editProfileTapped), for: .touchUpInside)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config (with profileData: ProfileData) {
    }
    @objc private func editProfileTapped(){
        delegate?.didTapEditButton(in: self)
    }
    
}
