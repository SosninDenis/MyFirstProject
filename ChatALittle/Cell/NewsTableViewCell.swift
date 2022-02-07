//
//  NewsTableViewCell.swift
//  ChatALittle
//
//  Created by Денис Соснин on 03.02.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsPhotoImage: UIImageView!
    @IBOutlet weak var newsTextLable: UILabel!
    @IBOutlet weak var likeView: LikeButton!
    @IBOutlet weak var commensTextFild: UITextField!
    @IBOutlet weak var addCommentButton: UIButton!
    @IBOutlet weak var numbersOfViews: UILabel!
    @IBOutlet weak var numberOfLike: UILabel!
    private var changeNumberOfLikes:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeView.isUserInteractionEnabled = true
        setupInterface()
        setupUILikes()
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NewsTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func setupInterface () {
        newsPhotoImage.backgroundColor = .clear
        newsPhotoImage.contentMode = .scaleAspectFill
        
        newsTextLable.numberOfLines = 0
        newsTextLable.lineBreakMode = NSLineBreakMode.byWordWrapping
        newsTextLable.setNeedsDisplay()
        newsTextLable.backgroundColor = .clear
        newsTextLable.textColor = .black
        
        commensTextFild.placeholder = "текст коммента"
        commensTextFild.backgroundColor = .gray
        commensTextFild.textColor = .black
        
        numbersOfViews.textColor = .gray
    }
    
    func setupUILikes() {
        likeView.isUserInteractionEnabled = true
        likeView.backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        likeView.addGestureRecognizer(recognizer)
        numberOfLike.backgroundColor = .clear
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
    
    func setupUIImage(imageName: String){
        newsPhotoImage.image = UIImage(named: imageName)
    }
    
    func setupNewsTextLabel(newsText: String) {
        newsTextLable.text = newsText
    }
    
    func setupCommensTextFild() {
    }
    
    func setupNumbersOfViews(number:String) {
        numbersOfViews.text = number
    }

}

