//
//  TaskCell.swift
//  Blueverse
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import UIKit

class TaskCell: TableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func configure(_ item: Any?) {
        if let item  = item as? TaskCellModel {
            print("Title: ", item.title)
            self.titleLabel.text = item.title
        }
    }
    
}
