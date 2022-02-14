//
//  FriedsPhotoCollectionViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 22.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

@IBDesignable class FriedsPhotoCollectionViewController: UICollectionViewController, MyCellDelegate {
    

    
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
        cell.userPhotoImage.image = image
        cell.userNameLabel.text = userName
        cell.likeView.isUserInteractionEnabled = true
        cell.delegate = self
        return cell
    }
    
    func tapButtonToPhoto() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "PhotoGalleryViewViewController") as? PhotoGalleryViewViewController else { return }
        secondViewController.currentUserProfile.append(currentUserProfile[0])
        
        show(secondViewController, sender: nil)
 
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToGalleryPhoto"{
        guard let photoGalleryViewViewController = segue.destination as? PhotoGalleryViewViewController,
              let sendUserData = sender as? FriendsListCellModel else { return }
        photoGalleryViewViewController.currentUserProfile.append(sendUserData)
    }
}

    
}

private extension FriedsPhotoCollectionViewController {
    func registerTableViewCells() {
        collectionView.register(UserPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: "UserPhotoCollectionViewCellId")
    }
}


