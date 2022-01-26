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
   
    @IBInspectable var opacityPhotoShadow: Float = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var radiusPhotoShadow: CGFloat = 15 {
        didSet {
            setNeedsDisplay()
        }
    }

    
    
    

    static func nib() -> UINib {
        return UINib(nibName: "UserPhotoCollectionViewCell", bundle: nil)
    }
    //var userPhotoImage: String = "1"
   // @IBOutlet weak var profileView: FriendPorfile!

    //  @IBOutlet weak var userPhotoImage: UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    
    
    func setupUI() {

        userPhotoImage.layer.cornerRadius = 125
        userPhotoImage.layer.borderWidth = 1
        userPhotoImage.layer.borderColor = UIColor.black.cgColor
        userPhotoImage.clipsToBounds = true
        userPhotoImage.backgroundColor = .gray
        photoShadow.layer.shadowOffset = CGSize (width: 10, height: 10)
        photoShadow.layer.shadowColor = UIColor.black.cgColor
        photoShadow.layer.shadowRadius = radiusPhotoShadow
        photoShadow.layer.shadowOpacity = opacityPhotoShadow
        photoShadow.backgroundColor = .none
        photoShadow.clipsToBounds = false
            
        
        
        
        
    }

}
