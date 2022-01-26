//
//  FriedsPhotoCollectionViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 22.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriedsPhotoCollectionViewController: UICollectionViewController {
    
    var currentUserProfile: [FriendsListCellModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
    }
    

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let image = currentUserProfile[indexPath.row].imageName
        let userName = currentUserProfile[indexPath.row].name + " " + currentUserProfile[indexPath.row].surnName
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPhotoCollectionViewCellId", for: indexPath) as! UserPhotoCollectionViewCell
        cell.backgroundColor = .clear
        cell.userPhotoImage.image = UIImage(named: image)
        cell.userNameLabel.text = userName
        collectionView.reloadData()
        
        return cell
    }
}

private extension FriedsPhotoCollectionViewController {
    func registerTableViewCells() {
        collectionView.register(UserPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: "UserPhotoCollectionViewCellId")
    }
}


