//
//  ScreenAfterLoginViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 09.01.2022.
//

import UIKit

class ScreenAfterLoginViewController: UIViewController {

    
    var login: String?
    
    @IBOutlet weak var labelUserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return } //убираем опциональность передаваемых данных
        labelUserName.text = "Hello, \(login)"
    }

    @IBAction func buttonGoBack(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
}
