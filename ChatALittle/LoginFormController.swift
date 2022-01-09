//
//  LoginFormController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 07.01.2022.
//

import UIKit

class LoginFormController: UIViewController {


    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapButtonLogin(_ sender: Any) { //кнопка залогиниться
        if true {
            performSegue(withIdentifier: "goToStartView", sender: nil)
        } else { return }   // пока просто тестирую приложение
    }
    
    @IBAction func unwindSegurToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ScreenAfterLoginViewController else { return }
        dvc.login = loginTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    

}
