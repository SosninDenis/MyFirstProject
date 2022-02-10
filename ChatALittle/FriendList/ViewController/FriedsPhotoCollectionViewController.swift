//
//  FriedsPhotoCollectionViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 22.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriedsPhotoCollectionViewController: UICollectionViewController {
    
    @IBOutlet var friendPhotoCillectionView: UICollectionView!
    
    var currentUserProfile: [FriendsListCellModel] = []
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
        let backgroundView = UIView(frame: friendPhotoCillectionView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: .zero)
        friendPhotoCillectionView.backgroundView = backgroundView
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = currentUserProfile[indexPath.row].imageName[0]
        let userName = currentUserProfile[indexPath.row].name + " " + currentUserProfile[indexPath.row].surnName
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPhotoCollectionViewCellId", for: indexPath) as! UserPhotoCollectionViewCell
        cell.userPhotoImage.image = UIImage(named: image)
        cell.userNameLabel.text = userName
        cell.likeView.isUserInteractionEnabled = true
        return cell
    }
    
}

private extension FriedsPhotoCollectionViewController {
    func registerTableViewCells() {
        collectionView.register(UserPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: "UserPhotoCollectionViewCellId")
    }
}


