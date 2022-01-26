//
//  FriendsListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 19.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    var contactList: [FriendsListCellModel] = [.init(name: "Барак", surnName: "Абама", imageName: "barak", userID: 1), .init(name: "Мерлин", surnName: "Мансоне", imageName: "merlin", userID: 2), .init(name: "Светлана", surnName: "Васильева", imageName: "women2", userID: 3), .init(name: "Игорь Петрович", surnName: "Ю", imageName: "oldMan", userID: 4), .init(name: "Гадя Петрович", surnName: "Хренова", imageName: "gadya", userID: 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueToPhoto = contactList[indexPath.row]
        performSegue(withIdentifier: "UserPhoto", sender: segueToPhoto)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserPhoto"{
            guard let friedsPhotoCollectionViewController = segue.destination as? FriedsPhotoCollectionViewController,
            let sendUserData = sender as? FriendsListCellModel else { return }
            friedsPhotoCollectionViewController.currentUserProfile.append(sendUserData)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = contactList[indexPath.row].name + " " + contactList[indexPath.row].surnName
        let image = contactList[indexPath.row].imageName
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
            cell.backgroundColor = .darkGray
            cell.friendsNameLabel?.text = name
            cell.imageViewName.image = UIImage(named: image)
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

private extension FriendsListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}




