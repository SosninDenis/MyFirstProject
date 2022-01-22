//
//  UserPhotoCollectionViewCell.swift
//  ChatALittle
//
//  Created by Денис Соснин on 22.01.2022.
//

import UIKit

class UserPhotoCollectionViewCell: UICollectionViewCell {
    static func nib() -> UINib {
        return UINib(nibName: "UserPhotoCollectionViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var userPhotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
