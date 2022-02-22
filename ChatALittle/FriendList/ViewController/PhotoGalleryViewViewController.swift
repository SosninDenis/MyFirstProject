//
//  PhotoGalleryViewViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 12.02.2022.
//

import UIKit

class PhotoGalleryViewViewController: UIViewController {
    @IBOutlet weak var galleryView: GalleryView!
    var currentUserProfile: [FriendsListCellModel] = []
   
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI () {
        let images = currentUserProfile[0].imageName
        galleryView.setImages(images: images)
    }
}
