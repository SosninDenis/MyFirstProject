//
//  FriendsTableViewCell.swift
//  ChatALittle
//
//  Created by Денис Соснин on 19.01.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    static func nib() -> UINib {
        return UINib(nibName: "FriendsTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var friendsNameLabel: UILabel?
    @IBOutlet weak var imageViewName: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupAnimationPhoto()
    }
    
    func setupUI() {
        
        imageViewName.layer.cornerRadius = 29
        imageViewName.layer.borderWidth = 1
        imageViewName.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func setupAnimationPhoto() {
        imageViewName.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        imageViewName.addGestureRecognizer(recognizer)
    }
    
    @objc func tapFunction () {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseOut],
                       animations: { [weak self] in
            guard let self = self else {return}
            self.imageViewName.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        },
                       completion: {done in
            if done {
                UIView.animate(withDuration: 1.0,
                               delay: 0.0,
                               usingSpringWithDamping: 0.3,
                               initialSpringVelocity: 0.3,
                               options: [.curveEaseOut],
                               animations: {[weak self] in
                    guard let self = self else {return}
                    self.imageViewName.transform = CGAffineTransform(scaleX: 1, y: 1)
                },
                               completion: nil)
            }
        })
        
        imageViewName.setNeedsDisplay()
    }
    
}
