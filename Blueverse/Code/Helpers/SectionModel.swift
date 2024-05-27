//
//  SectionModel.swift
//  Blueverse
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation

class SectionModel {
    var header: Any?
    var cellModels: [Any]
    var footer: Any?
    
    init(header: Any? = nil, cellModels: [Any], footer: Any? = nil) {
        self.header = header
        self.cellModels = cellModels
        self.footer = footer
    }
}
