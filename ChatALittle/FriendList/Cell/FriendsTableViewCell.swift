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
    
}
