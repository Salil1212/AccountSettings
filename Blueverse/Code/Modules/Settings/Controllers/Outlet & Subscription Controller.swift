//
//  Outlet & Subscription Controller.swift
//  Blueverse
//
//  Created by Nickelfox on 14/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

class OutletSubscriptionController: UIViewController {
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var outletSubsBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.registerTable()
    }
    //    func registerTable(){
    //        self.tableView1.delegate=self
    //        self.tableView1.dataSource=self
    //        tableView1.register(Outlet___Subscription_TableViewCell.self,forCellReuseIdentifier: Outlet___Subscription_TableViewCell.reuseIdentifier)
    //
    //    }
    //
    // }
    //
    //extension OutletSubscriptionController: UITableViewDelegate, UITableViewDataSource {
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        1
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: Outlet___Subscription_TableViewCell) as? TableViewCell{
    //            cell.item = self.viewModel.item(at:indexPath)
    //            return cell
    //        }
    //        return UITableViewCell()
    //    }
    //
    //
    //}
    //
    //extension OutletSubscriptionController{
    //    func reload(){
    //        self.tableView1.reloadData()
    //    }
}
