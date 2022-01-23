//
//  GlobalGroupListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 21.01.2022.
//

import UIKit

class GlobalGroupListTableViewController: UITableViewController {
    
    var globalGroupList: [GroupListCellModel] = [.init(groupName: "BMW CLub", groupImage: "bmw"), .init(groupName: "ФК Зенит", groupImage: "zenit"), .init(groupName: "Сбербанк", groupImage: "sber"), .init(groupName: "News", groupImage: "news")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return globalGroupList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = globalGroupList[indexPath.row].groupName
        let image = globalGroupList[indexPath.row].groupImage
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
            cell.backgroundColor = .darkGray
            cell.imageViewName.image = UIImage(named: image)
            cell.friendsNameLabel?.text = name
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
            cell.backgroundColor = .gray
            cell.friendsNameLabel?.text = name
            cell.imageViewName.image = UIImage(named: image)
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
}

private extension GlobalGroupListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}

