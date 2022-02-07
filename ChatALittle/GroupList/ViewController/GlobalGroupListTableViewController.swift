//
//  GlobalGroupListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 21.01.2022.
//

import UIKit

class GlobalGroupListTableViewController: UITableViewController {
    
    var globalGroupList: [GroupListCellModel] = [.init(groupName: "BMW CLub", groupImage: "bmw"),
                                                 .init(groupName: "ФК Зенит", groupImage: "zenit"),
                                                 .init(groupName: "Сбербанк", groupImage: "sber"),
                                                 .init(groupName: "News", groupImage: "news")]
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var globalGroupListTableView: UITableView!
    private var filteredGroupArray = [GroupListCellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        setGradientBackground()
        self.searchBar.delegate = self
        searchBar.placeholder = "Поиск группы"
        self.tableView.reloadData()
        self.filteredGroupArray = self.globalGroupList
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
        return filteredGroupArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let globalGroup = filteredGroupArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
        cell.backgroundColor = .clear
        cell.imageViewName.image = UIImage(named: globalGroup.groupImage)
        cell.friendsNameLabel?.text = globalGroup.groupName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGroup" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let groupSend = filteredGroupArray[indexPath.row]
                let newVC = segue.destination as! GroupListTableViewController
                newVC.groupList.append(groupSend)
            }
        }
    }
}

private extension GlobalGroupListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}

extension GlobalGroupListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.filteredGroupArray = self.globalGroupList
            self.tableView.reloadData()
            return
        }
        self.filteredGroupArray = self.globalGroupList.filter { return $0.groupName.contains(searchText) }
        self.tableView.reloadData()
    }
}
