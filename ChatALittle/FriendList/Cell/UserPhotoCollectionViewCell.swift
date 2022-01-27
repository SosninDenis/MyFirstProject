//
//  UserPhotoCollectionViewCell.swift
//  ChatALittle
//
//  Created by Денис Соснин on 22.01.2022.
//

import UIKit

class UserPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userPhotoImage: UIImageView!
    
    @IBOutlet weak var photoShadow: UIView!
 
    @IBOutlet weak var userNameLabel: UILabel!
   
    @IBOutlet weak var numberOfLike: UILabel!

    
    static func nib() -> UINib {
        return UINib(nibName: "UserPhotoCollectionViewCell", bundle: nil)
    }
    //var userPhotoImage: String = "1"
   // @IBOutlet weak var profileView: FriendPorfile!

    //  @IBOutlet weak var userPhotoImage: UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUIphoto()
    }

    func setupUIphoto() {
        userPhotoImage.layer.cornerRadius = 125
        userPhotoImage.layer.borderWidth = 1
        userPhotoImage.layer.borderColor = UIColor.black.cgColor
        userPhotoImage.clipsToBounds = true
        userPhotoImage.backgroundColor = .gray
        photoShadow.layer.shadowOffset = CGSize (width: 10, height: 10)
        photoShadow.layer.shadowColor = UIColor.green.cgColor
        photoShadow.layer.shadowRadius = 30
        photoShadow.layer.shadowOpacity = 0.5
        photoShadow.backgroundColor = .none
        photoShadow.clipsToBounds = false
        
        let customView1 = LikeButton(frame: CGRect(x: 300, y: 310 , width: 40, height: 35))
        customView1.layer.backgroundColor = UIColor.red.cgColor
        customView1.backgroundColor = .clear
        self.addSubview(customView1)
    }

    
    
    
    
    
    @IBAction func tapLikeButton(_ sender: LikeButton) {
//        numberOfLike.text = "11"
//        print (numberOfLike)
    }
}
