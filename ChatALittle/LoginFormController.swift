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
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButtonLogin(_ sender: Any) {
    }
    
    // переход на страницу регистрации минуя проверку пароля
    @IBAction func didTapButtonSingUp(_ sender: UIButton) {
        performSegue(withIdentifier: "goToViewSingUp", sender: nil)
        
    }
    // переход на страницу восстановления пароля минуя проверку пароля
    @IBAction func didTapButtonForgotPass(_ sender: UIButton) {
        performSegue(withIdentifier: "goToViewForgotPass", sender: nil)
    }
    
    @IBAction func unwindSegurToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginTF.text,
              let password = passwordTF.text else { return false }
        
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
}
