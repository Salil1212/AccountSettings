//
//  EditProfileTableViewCell.swift
//  Blueverse
//
//  Created by Nickelfox on 21/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import UIKit
protocol EditProfileTableViewCellDelegate: AnyObject {
    func didTapCancelButton(in cell: EditProfileTableViewCell)
}

class EditProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var emailtxt: UITextField!
    
    @IBOutlet weak var phonetxt: UITextField!
    
        @IBOutlet weak var editProfile: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
        var enterName = ""
        var enterEmail = ""
        var enterPhoneNumber = ""
    weak var delegate: EditProfileTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with profileData: ProfileData){
        
    }
    @IBAction func updateProfile(_ sender: UIButton){
        enterName = nametxt.text ?? ""
        enterEmail = emailtxt.text ?? ""
        enterPhoneNumber = phonetxt.text ?? ""
    }
    @objc private func cancelButtonTapped() {
        delegate?.didTapCancelButton(in: self)
    }

    
}
