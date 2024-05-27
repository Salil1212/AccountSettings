//
//  TasksListViewController.swift
//  Blueverse
//
//  Created by Nickelfox on 27/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import UIKit

protocol TasksListViewControllerProtocol: AnyObject {
    var numberOfSections: Int { get }
    func numberOfRows(at section: Int) -> Int
    func item(at indexPath: IndexPath) -> Any?
    func fetchTasks()
    
}

class TasksListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: TasksListViewControllerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupViewModel()
        self.viewModel.fetchTasks()
        // Do any additional setup after loading the view.
    }
    
    private func setupViewModel() {
        self.viewModel = TasksListViewModel(self)
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell(TaskCell.self)
    }
    
}

// MARK: UITableViewDelegate
extension TasksListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let identifier = self.identifier(at: indexPath),
           let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableViewCell {
            cell.item = self.viewModel.item(at: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected", indexPath)
    }
    
    func identifier(at indexPath: IndexPath) -> String? {
        if let item = self.viewModel.item(at: indexPath) {
            switch item {
            case _ as TaskCellModel: return TaskCell.reuseIdentifier
            default: return nil
            }
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        <#code#>
    }
    
    
}

// MARK: TasksListViewModelProtocol
extension TasksListViewController: TasksListViewModelProtocol {
    func reload() {
        self.tableView.reloadData()
    }
}
