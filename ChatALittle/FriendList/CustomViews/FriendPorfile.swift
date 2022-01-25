//
//  FriendPorfile.swift
//  ChatALittle
//
//  Created by Денис Соснин on 24.01.2022.
//

import UIKit

@IBDesignable class FriendPorfile: UIView {
    
    
    var photo = UIImage(named: "")

    @IBInspectable var photoShadowColor: CGColor = UIColor.black.cgColor {
            didSet {
                setNeedsDisplay()
            }
        }
    
    @IBInspectable var opacityPhotoShadow: Float = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var radiusPhotoShadow: CGFloat = 100 {
        didSet {
            setNeedsDisplay()
        }
    }

    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createProfilePhoto()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createProfilePhoto()
    }
    
    func createProfilePhoto() {
        let profilePhoto = UIImageView(frame: CGRect(x: 10, y: 10, width: 250, height: 250))
        addSubview(profilePhoto)
        backgroundColor = .clear
        profilePhoto.image = photo
        profilePhoto.backgroundColor = .white
        profilePhoto.layer.backgroundColor = UIColor.white.cgColor
        profilePhoto.layer.borderWidth = 1
        profilePhoto.layer.cornerRadius = 125
        profilePhoto.clipsToBounds = true
        profilePhoto.layer.shadowOffset = CGSize (width: 30, height: 30)

        
        //MARK: - Settings of shadows
        profilePhoto.layer.shadowRadius = radiusPhotoShadow
        profilePhoto.layer.shadowOpacity = opacityPhotoShadow
        profilePhoto.layer.shadowColor = photoShadowColor


        
    }
    
    
    
    
    
    
    
    
    
    //    override func draw(_ rect: CGRect) {
    //        super.draw(rect)
    //        guard let context = UIGraphicsGetCurrentContext() else { return }
    //        context.setFillColor(UIColor.green.cgColor)
    //        context.fill(CGRect(x: 0, y: 0, width: 50, height: 50))
    //
    //
    //}
    
    
}
