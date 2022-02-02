//
//  FriendsListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 19.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    @IBOutlet var friendListTableView: UITableView!
    
    var contactList: [FriendsListCellModel] = [.init(name: "Игорь Петрович", surnName: "Ю", imageName: "oldMan", userID: 4),
                                               .init(name: "Барак", surnName: "Абама", imageName: "barak", userID: 1),
                                               .init(name: "Мерлин", surnName: "Мансоне", imageName: "merlin", userID: 2),
                                               .init(name: "Светлана", surnName: "Васильева", imageName: "women2", userID: 3),
                                               .init(name: "Игорь Петрович", surnName: "Ю", imageName: "oldMan", userID: 4),
                                               .init(name: "Гадя Петрович", surnName: "Хренова", imageName: "gadya", userID: 5),
                                               .init(name: "Барак", surnName: "Абамчик", imageName: "barak", userID: 6)]
    var finalArray = [Character]()
    var dic = [Character: [FriendsListCellModel]]()
    var currentWordUserList = [FriendsListCellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        setGradientBackground()
        createArraysForCell()
        createFinalDic()
    }
    
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        let backgroundView = UIView(frame: friendListTableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: .zero)
        friendListTableView.backgroundView = backgroundView
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return finalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let realNumberOfRowsIsSec = dic[finalArray[section]]?.count else {return 0}
        return realNumberOfRowsIsSec
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let segueToPhoto = dic[finalArray[indexPath.section]] else {return}
        let segueToUserPhoto = segueToPhoto[indexPath.row]
        performSegue(withIdentifier: "UserPhoto", sender: segueToUserPhoto)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserPhoto"{
            guard let friedsPhotoCollectionViewController = segue.destination as? FriedsPhotoCollectionViewController,
                  let sendUserData = sender as? FriendsListCellModel else { return }
            friedsPhotoCollectionViewController.currentUserProfile.append(sendUserData)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCellId", for: indexPath) as! FriendsTableViewCell
        
        if  (dic[finalArray[indexPath.section]] != nil) {
            currentWordUserList = dic[finalArray[indexPath.section]]!
        let name = currentWordUserList[indexPath.row].name + " " + currentWordUserList[indexPath.row].surnName
            let image = currentWordUserList[indexPath.row].imageName
            cell.backgroundColor = .clear
            cell.friendsNameLabel?.text = name
            cell.imageViewName.image = UIImage(named: image)
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let customView = UIView()
//        customView.backgroundColor = .clear
//        return customView
//    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let CharOfSection = String(finalArray[section])
        return CharOfSection
    }
    
    
}


private extension FriendsListTableViewController {
    func registerTableViewCells() {
        tableView.register(FriendsTableViewCell.nib(), forCellReuseIdentifier: "FriendsTableViewCellId")
    }
}


private extension FriendsListTableViewController {
    
    
    func createArraysForCell() {
        for index in 0...(contactList.count - 1) {
            let a = Array(contactList[index].surnName)[0]
            if !finalArray.contains(a) {
                finalArray.append(a)
                finalArray = finalArray.sorted{ $0 < $1 }
            }
        }
    }
    
    func createFinalDic() {
        //Заполнение искомого массива имеющимися буквами
        for i in finalArray {
            for index in 0...(contactList.count - 1) {
                let firstWordOfsurname = Array(contactList[index].surnName)[0]
                if firstWordOfsurname == i {
                    var updateValue = dic[i]
                    if updateValue == nil {
                        updateValue = [(contactList[index])]
                        dic.updateValue(updateValue!, forKey: i)
                    } else if updateValue != nil {
                        updateValue?.append(contactList[index])
                        dic.updateValue(updateValue!, forKey: firstWordOfsurname)
                    }
                }
            }
        }
    }
    
}


















