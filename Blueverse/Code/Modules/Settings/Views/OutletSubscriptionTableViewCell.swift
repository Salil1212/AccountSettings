//
//  Outlet & Subscription TableViewCell.swift
//  NewsApp
//
//  Created by Nickelfox on 13/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import UIKit



class OutletSubscriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wrapperButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
