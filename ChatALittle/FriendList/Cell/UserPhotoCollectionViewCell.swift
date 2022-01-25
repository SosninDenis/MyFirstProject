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
    //var userPhotoImage: String = "1"
    @IBOutlet weak var profileView: FriendPorfile!

    //  @IBOutlet weak var userPhotoImage: UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
