//
//  GropuListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 20.01.2022.
//

import UIKit

class GroupListTableViewController: UITableViewController {
    
    var groupList: [GroupListCellModel] = [.init(groupName: "BMW CLub", groupImage: "bmw"),
                                           .init(groupName: "ФК Зенит", groupImage: "zenit"),
                                           .init(groupName: "Сбербанк", groupImage: "sber"),
                                           .init(groupName: "News", groupImage: "news")]
    @IBOutlet var groupListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        setGradientBackground()
        
    }
    
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        let backgroundView = UIView(frame: groupListTableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: .zero)
        groupListTableView.backgroundView = backgroundView
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentUserGroupList = groupList[indexPath.row]
        //        let name = groupList[indexPath.row].groupName
        //        let image = groupList[indexPath.row].groupImage
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
        cell.backgroundColor = .clear
        cell.imageViewName.image = UIImage(named: currentUserGroupList.groupImage)
        cell.friendsNameLabel?.text = currentUserGroupList.groupName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем группу из массива
            groupList.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

private extension GroupListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}

