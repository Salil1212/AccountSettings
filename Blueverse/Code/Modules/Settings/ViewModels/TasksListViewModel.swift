//
//  TasksListViewModel.swift
//  Blueverse
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation

protocol TasksListViewModelProtocol: AnyObject {
    func reload()
}

class TasksListViewModel {
    weak var view: TasksListViewModelProtocol?
    
    var sectionModels: [SectionModel] = []
    
    init(_ view: TasksListViewModelProtocol) {
        self.view = view
    }
    
    func prepareCellModels() {
        var sectionHeader = TasksHeaderCellModel(title: "5-12")
        
        var cellModels = [
            TaskCellModel(title: "A"),
            TaskCellModel(title: "B"),
            TaskCellModel(title: "C")
        ]
        
        self.sectionModels = [
            SectionModel(header: sectionHeader, cellModels: cellModels),
            SectionModel(header: sectionHeader, cellModels: cellModels)
        ]
        
        self.view?.reload()
    }

    
}

extension TasksListViewModel: TasksListViewControllerProtocol {
    var numberOfSections: Int {
        return self.sectionModels.count
    }
    
    func numberOfRows(at section: Int) -> Int {
        return self.sectionModels[section].cellModels.count
    }
    
    func item(at indexPath: IndexPath) -> Any? {
        return self.sectionModels[indexPath.section].cellModels[indexPath.row]
    }
    
    func fetchTasks() {
        self.prepareCellModels()
    }
    
    
}
