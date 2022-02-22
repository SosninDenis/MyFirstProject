//
//  AnimatedLoadViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 06.02.2022.
//

import UIKit

class AnimatedLoadViewController: UIViewController {
    
    let loadView = cloudView()
    let loadView1 = UIView()
    let loadView2 = UIView()
    let loadView3 = UIView()
    
    var mailScreenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    var mailScreenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    let loadViewSize: CGFloat = 10
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {self.loadFucn()})
    }
    
    func setupLoadViews() {
        loadView.frame = CGRect(x: (mailScreenWidth/2 - 100/2), y: mailScreenHeight / 2, width: 100, height: 100)
        mainView.addSubview(loadView)
    }
    
    func loadFucn() {
        goToMainScreen()
    }
    
    func goToMainScreen() {
        performSegue(withIdentifier: "loadFromAnimatedViewLaunchScreen", sender: nil)
    }
    
    
}
