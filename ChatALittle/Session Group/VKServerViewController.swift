//
//  VKServerViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 23.02.2022.
//

import UIKit
import WebKit

class VKServerViewController: UIViewController {

    @IBOutlet weak var VKWebWiev: WKWebView!
    @IBOutlet weak var SearchTextField: UITextField!
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var VKComponents = URLComponents()
        VKComponents.scheme = "https"
        VKComponents.host = "oauth.vk.com"
        VKComponents.path = "/authorize"
        VKComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8087219"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]

                let request = URLRequest(url: VKComponents.url!)
                
        VKWebWiev.load(request)
    }

    @IBAction func tapButtonSendRequest(_ sender: Any) {
    }
}
