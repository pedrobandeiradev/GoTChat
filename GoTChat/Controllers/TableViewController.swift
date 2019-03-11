//
//  TableViewController.swift
//  GoTChat
//
//  Created by Superdigital on 11/03/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listOfUsers: [User]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfUsers?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatEntry") as! ChatEntryCell
        cell.textLabel?.text  = listOfUsers?[indexPath.item].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Toquei numa conversa")
    }
}

