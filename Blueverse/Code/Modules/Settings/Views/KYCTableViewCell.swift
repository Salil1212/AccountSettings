//
//  KYCTableViewCell.swift
//  NewsApp
//
//  Created by Nickelfox on 10/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import UIKit

class KYCTableViewCell: UITableViewCell {
    @IBOutlet weak var kYCLabel: UILabel!
    @IBOutlet weak var kycTick: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
