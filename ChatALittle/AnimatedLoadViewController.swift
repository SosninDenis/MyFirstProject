//
//  AnimatedLoadViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 06.02.2022.
//

import UIKit

class AnimatedLoadViewController: UIViewController {
    
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {self.loadFucn()})
    }
    
    func setupLoadViews() {
        loadView1.frame = CGRect(x: (mailScreenWidth/2 - loadViewSize/2), y: mailScreenHeight / 2, width: loadViewSize, height: loadViewSize)
        loadView2.frame = CGRect(x: ((mailScreenWidth/2 - loadViewSize/2) + 30), y: mailScreenHeight / 2, width: loadViewSize, height: loadViewSize)
        loadView3.frame = CGRect(x: ((mailScreenWidth/2 - loadViewSize/2) - 30), y: mailScreenHeight / 2, width: loadViewSize, height: loadViewSize)
        loadView1.backgroundColor = .orange
        loadView2.backgroundColor = .red
        loadView3.backgroundColor = .yellow
        loadView1.layer.cornerRadius = 5
        loadView2.layer.cornerRadius = 5
        loadView3.layer.cornerRadius = 5
        mainView.addSubview(loadView1)
        mainView.addSubview(loadView2)
        mainView.addSubview(loadView3)
        loadView1.alpha = 0
        loadView2.alpha = 0
        loadView3.alpha = 0
    }
    
    func loadFucn() {
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [],
                       animations: {[weak self] in
            guard let self = self else {return}
            self.loadView3.alpha = 1
        },
                       completion: {done1 in
            if done1 {
                UIView.animate(withDuration: 1,
                               delay: 1,
                               options: [],
                               animations: {[weak self] in
                    guard let self = self else {return}
                    self.loadView1.alpha = 1
                },
                               completion: {done2 in
                    if done2 {
                        UIView.animate(withDuration: 1,
                                       delay: 1,
                                       options: [],
                                       animations: {[weak self] in
                            guard let self = self else {return}
                            self.loadView2.alpha = 1
                        },
                                       completion: {done3 in
                            if done3 {
                                UIView.animate(withDuration: 1,
                                               delay: 2,
                                               options: [],
                                               animations: {[weak self] in
                                    guard let self = self else {return}
                                    self.loadView1.backgroundColor = .black
                                    self.loadView2.backgroundColor = .black
                                    self.loadView3.backgroundColor = .black
                                },
                                               completion: {finalDone in
                                    if finalDone {
                                        self.performSegue(withIdentifier: "loadFromAnimatedViewLaunchScreen", sender: nil)
                                        
                                    }
                                })
                            }
                        })
                    }
                })
            }
        })
    }
    
    
}
