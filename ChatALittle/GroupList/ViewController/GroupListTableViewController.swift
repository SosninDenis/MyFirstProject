//
//  GropuListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 20.01.2022.
//

import UIKit
import CoreData

class GroupListTableViewController: UITableViewController {
    
    var groupList: [GroupModelTest] = []
    @IBOutlet var groupListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        setGradientBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
        cell.backgroundColor = .clear
        cell.imageViewName.image = UIImage(named: currentUserGroupList.groupImage!)
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
        if editingStyle == .delete {
            let model = groupList[indexPath.row]
            deleteData(with: model)
            updateData()
        }
        
        tableView.reloadData()
    }
}

private extension GroupListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}

extension GroupListTableViewController {
    
    func saveName (newImageName: String, newGroupName: String) {
        // Get our database
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Get model(Person)
        let person = GroupModelTest(entity: GroupModelTest().entity, insertInto: context)
        let groupNameKey = "groupName"
        let groupImageKet = "groupImage"
        // Set data inton Person(for key "name")
        person.setValue(newGroupName, forKey: groupNameKey)
        person.setValue(newImageName, forKey: groupImageKet)
        do {
            try context.save()
            groupList.append(person)
        } catch let error {
            debugPrint("Could not save", error)
        }
        
        self.tableView.reloadData()
    }
    
    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let result = try context.fetch(GroupModelTest.fetchRequest())
            groupList = result as! [GroupModelTest]
        } catch let error {
            debugPrint("Could not save", error)
        }
    }
    
    func deleteData(with model: GroupModelTest) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(model)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func updateData() {
        fetchData()
    }
}

