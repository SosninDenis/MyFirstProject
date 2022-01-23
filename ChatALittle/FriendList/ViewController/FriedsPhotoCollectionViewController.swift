//
//  FriedsPhotoCollectionViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 22.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriedsPhotoCollectionViewController: UICollectionViewController {
    
    var userPhotoArray: [UsersPhotoModel] = [.init(userID: 1, userPhoto: ["1", "2", "3", "2", "6", "3", "2", "1", "5", "2"]), .init(userID: 2, userPhoto: ["4", "5", "6"]), .init(userID: 3, userPhoto: ["3", "5", "5"]), .init(userID: 4, userPhoto: ["4", "6", "6"]), .init(userID: 5, userPhoto: ["2", "1", "6"])]
    var currentUser:Int = 1
    var currentUserData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUserData = userPhotoArray[currentUser].userPhoto
        registerTableViewCells()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  currentUserData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.reloadData()
        let image = currentUserData[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPhotoCollectionViewCellId", for: indexPath) as! UserPhotoCollectionViewCell
        cell.backgroundColor = .white
        cell.userPhotoImage.image = UIImage(named:image)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */    
}

private extension FriedsPhotoCollectionViewController {
    func registerTableViewCells() {
        collectionView.register(UserPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: "UserPhotoCollectionViewCellId")
    }
}


