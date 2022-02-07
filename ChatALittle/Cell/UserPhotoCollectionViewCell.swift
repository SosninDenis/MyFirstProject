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
    @IBOutlet var numberOfLike: UILabel!
    @IBOutlet weak var likeView: LikeButton!
    private var changeNumberOfLikes:Int = 0
    
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    //Задание прозрачности в interface builder
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    //Задание радиуса тени в interface builder
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "UserPhotoCollectionViewCell", bundle: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUIphoto()
        likeView.isUserInteractionEnabled = true
        
    }
    
    func setupUIphoto() {
        userPhotoImage.layer.cornerRadius = 125
        userPhotoImage.layer.borderWidth = 1
        userPhotoImage.layer.borderColor = UIColor.black.cgColor
        userPhotoImage.clipsToBounds = true
        userPhotoImage.backgroundColor = .gray
        photoShadow.layer.cornerRadius = 125
        photoShadow.layer.shadowOffset = CGSize (width: 10, height: 10)
        photoShadow.layer.shadowColor = shadowColor?.cgColor
        photoShadow.layer.shadowRadius = shadowRadius
        photoShadow.layer.shadowOpacity = shadowOpacity
        photoShadow.backgroundColor = .none
        photoShadow.clipsToBounds = false
        likeView.isUserInteractionEnabled = true
        likeView.backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        likeView.addGestureRecognizer(recognizer)
    }
    
    @objc func tapFunction () {
        likeView.checked.toggle()
        if likeView.checked {
            changeNumberOfLikes = -1
        } else {
            changeNumberOfLikes = 1
        }
        guard let numberLikesText  = numberOfLike.text else {return}
        guard var numberLikes = Int (numberLikesText) else {return}
        numberLikes = numberLikes + changeNumberOfLikes
        numberOfLike.text = String(numberLikes)
        likeView.setNeedsDisplay()
        
    }
    
}