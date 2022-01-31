//
//  GlobalGroupListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 21.01.2022.
//

import UIKit

class GlobalGroupListTableViewController: UITableViewController {
    
    var globalGroupList: [GroupListCellModel] = [.init(groupName: "BMW CLub", groupImage: "bmw"), .init(groupName: "ФК Зенит", groupImage: "zenit"), .init(groupName: "Сбербанк", groupImage: "sber"), .init(groupName: "News", groupImage: "news")]
    
    @IBOutlet var globalGroupListTableView: UITableView!
    
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
        let backgroundView = UIView(frame: globalGroupListTableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: .zero)
        globalGroupListTableView.backgroundView = backgroundView
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalGroupList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = globalGroupList[indexPath.row].groupName
        let image = globalGroupList[indexPath.row].groupImage
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
            cell.backgroundColor = .clear
            cell.imageViewName.image = UIImage(named: image)
            cell.friendsNameLabel?.text = name
            cell.accessoryType = .disclosureIndicator
            return cell
    }
    
}

private extension GlobalGroupListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}

