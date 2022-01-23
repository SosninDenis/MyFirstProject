//
//  FriendsListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 19.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    var contactList: [FriendsListCellModel] = [.init(name: "BaraKK", surnName: "Abama", imageName: "barak", userID: 1), .init(name: "Мерлин", surnName: "Мансоне", imageName: "merlin", userID: 2), .init(name: "Светлана", surnName: "Васильева", imageName: "women2", userID: 3), .init(name: "Игорь Петрович", surnName: "Ю", imageName: "oldMan", userID: 4), .init(name: "Гадя Петрович", surnName: "Хренова", imageName: "gadya", userID: 5)]
    var moveUserIdToPhoto: Int = 5
    
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
        let segueToPhoto = contactList[indexPath.row].userID
        performSegue(withIdentifier: "UserPhoto", sender: segueToPhoto)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserPhoto",
           let friedsPhotoCollectionViewController = segue.destination as? FriedsPhotoCollectionViewController,
           let userId = sender as? Int {
            friedsPhotoCollectionViewController.currentUser = userId - 1
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
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
  
}

private extension FriendsListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}




