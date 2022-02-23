//
//  VKServerViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 23.02.2022.
//

import UIKit
import WebKit

class VKServerViewController: UIViewController {

    @IBOutlet weak var VKWebWiev: WKWebView! {
        didSet {
            VKWebWiev.navigationDelegate = self
        }
    }
    @IBOutlet weak var SearchTextField: UITextField!
    var searchGroup: String = ""
    let userData = Session.shared

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
// Запрос данных о пользователе (Имя, Фамилия, дата рождения)
    func sendRequestForUserName () {
        let requestFriendList = URLSessionConfiguration.default
        let session1 = URLSession(configuration: requestFriendList)
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = "api.vk.com"
        urlContructor.path = "/method/users.get"
        urlContructor.queryItems = [
            .init(name: "user_ids", value: userData.userId),
            .init(name: "fields", value: "bdate"),
            .init(name: "access_token", value: userData.token),
            .init(name: "v", value: "5.131")
        ]
        let task1 = session1.dataTask(with: urlContructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json, "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
        }
        task1.resume()
     //https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V
    }
    
    // Запрос списка групп пользователя
    func sendRequestForFriendList () {
        let requestFriendList = URLSessionConfiguration.default
        let session1 = URLSession(configuration: requestFriendList)
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = "api.vk.com"
        urlContructor.path = "/method/groups.get"
        urlContructor.queryItems = [
            .init(name: "extended", value: "1"),
            .init(name: "fields", value: "name,photo_50"),
            .init(name: "access_token", value: userData.token),
            .init(name: "v", value: "5.131")
        ]
        let task1 = session1.dataTask(with: urlContructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json, "🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈")
        }
        task1.resume()
     //https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func tapButtonSendRequest(_ sender: Any) {
        if SearchTextField.text != nil {
        searchGroup = SearchTextField.text!
        }
        sendRequestForUserName()
        sendRequestForFriendList()

        
        
        
        
    }

}

extension VKServerViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                print(dict, "💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥")
                return dict
        }

        let token = params["access_token"]
        let userID = params["user_id"]
        

        if token != nil, userID != nil {
            userData.token = token!
            userData.userId = userID!
            print (userData.token, "⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️")
        }

        decisionHandler(.cancel)
    }
}
