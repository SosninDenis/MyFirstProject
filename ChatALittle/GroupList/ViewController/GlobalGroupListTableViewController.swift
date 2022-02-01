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
    private var filteredGroupArray = [GroupListCellModel]()
    @IBOutlet var globalGroupListTableView: UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        setGradientBackground()
        //setup the search Controller
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
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
        if isFiltering {
            return filteredGroupArray.count
        }
        
        return globalGroupList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var globalGroup: GroupListCellModel
        if isFiltering {
            globalGroup = filteredGroupArray[indexPath.row]
        } else {
            globalGroup = globalGroupList[indexPath.row] }
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
                let groupSend: GroupListCellModel
                if isFiltering {
                    groupSend = filteredGroupArray[indexPath.row]
                } else {
                    groupSend = globalGroupList[indexPath.row]
                }
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

extension GlobalGroupListTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredGroupArray = globalGroupList.filter({ (globalGroup: GroupListCellModel) -> Bool in
            return globalGroup.groupName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
