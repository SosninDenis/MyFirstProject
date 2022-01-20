//
//  SingUpViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 15.01.2022.
//

import UIKit

class SingUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapbButtonGoBack(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }

}
