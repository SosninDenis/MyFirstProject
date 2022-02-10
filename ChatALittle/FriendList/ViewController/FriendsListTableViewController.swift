//
//  FriendsListTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 19.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    @IBOutlet var friendListTableView: UITableView!
    
    var contactList: [FriendsListCellModel] = [.init(name: "Джейсон", surnName: "Стетхем", imageName: ["stet1", "stet2", "stet3"], userID: 4),
                                               .init(name: "Барак", surnName: "Абама", imageName: ["barak", "barak1", "barak2", "barak3"], userID: 1),
                                               .init(name: "Мерлин", surnName: "Мансоне", imageName: ["merlin"], userID: 2),
                                               .init(name: "Джесика", surnName: "Альба", imageName: ["alba1", "alba2", "alba3"], userID: 3),
                                               .init(name: "Железный", surnName: "Арни", imageName: ["arni1", "arni2", "arni3", "arni4"], userID: 4),
                                               .init(name: "Гадя Петрович", surnName: "Хренова", imageName: ["gadya", "gadya1", "gadya2", "gadya3" ], userID: 5)]
    var finalArray = [Character]()
    var dic = [Character: [FriendsListCellModel]]()
    var currentWordUserList = [FriendsListCellModel]()
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    
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
            let image = currentWordUserList[indexPath.row].imageName[0]
            cell.backgroundColor = .clear
            cell.friendsNameLabel?.text = name
            cell.imageViewName.image = UIImage(named: image)
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = CustomTittleView(frame: .init(x: 0, y: 0, width: screenWidth, height: 20))
        customView.backgroundColor = .clear
        let CharOfSection = String(finalArray[section])
        customView.setText(CharOfSection)
        return customView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
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


















