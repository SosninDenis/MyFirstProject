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
        let session = URLSession(configuration: requestFriendList)
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
        let task = session.dataTask(with: urlContructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json, "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
        }
        task.resume()
     //https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V
    }
    
    // Запрос списка групп пользователя
    func sendRequestForGroupList () {
        let requestFriendList = URLSessionConfiguration.default
        let session = URLSession(configuration: requestFriendList)
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
        let task = session.dataTask(with: urlContructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json, "💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫💫")
        }
        task.resume()
     //https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V
    }
    
    // Запрос списка фотографий пользователя
    func sendRequestForUsersPhoto () {
        let requestFriendList = URLSessionConfiguration.default
        let session = URLSession(configuration: requestFriendList)
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = "api.vk.com"
        urlContructor.path = "/method/photos.getAll"
        urlContructor.queryItems = [
            .init(name: "owner_id", value: userData.userId),
            .init(name: "photo_sizes", value: "1"),
            .init(name: "extended", value: "1"),
            .init(name: "count", value: "100"),
            .init(name: "access_token", value: userData.token),
            .init(name: "v", value: "5.131")
        ]
        let task = session.dataTask(with: urlContructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json, "🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈")
        }
        task.resume()

    }
    
    // Запрос списка друзей пользователя
    func sendRequestForUsersFriens () {
        let requestFriendList = URLSessionConfiguration.default
        let session = URLSession(configuration: requestFriendList)
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = "api.vk.com"
        urlContructor.path = "/method/friends.get"
        urlContructor.queryItems = [
            .init(name: "user_id", value: userData.userId),
            .init(name: "order", value: "name"),
            .init(name: "fields", value: "bdate,nickname,online,photo_50"),
            .init(name: "access_token", value: userData.token),
            .init(name: "v", value: "5.131")
        ]
        let task = session.dataTask(with: urlContructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json, "❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️")
        }
        task.resume()

    }
    
    // запрос на поиск группы
    func sendRequestForSearchGroup (searchGroup:String) {
        let searchGroup = searchGroup
        let requestFriendList = URLSessionConfiguration.default
        let session = URLSession(configuration: requestFriendList)
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = "api.vk.com"
        urlContructor.path = "/method/groups.search"
        urlContructor.queryItems = [
            .init(name: "q", value: searchGroup),
            .init(name: "type", value: "group"),
            .init(name: "sort", value: "6"),
            .init(name: "access_token", value: userData.token),
            .init(name: "v", value: "5.131")
        ]
        let task = session.dataTask(with: urlContructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json, "☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️☂️")
        }
        task.resume()

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func tapButtonSendRequest(_ sender: Any) {
        if SearchTextField.text != nil {
        searchGroup = SearchTextField.text!
        }
        sendRequestForSearchGroup(searchGroup: searchGroup)

    }

    @IBAction func tapButtonSendRequestPhoto(_ sender: Any) {
        sendRequestForUserName()
        sendRequestForUsersPhoto()
        sendRequestForUsersFriens()
    }
    @IBAction func tapButtonToSendRequestAllUsersGroup(_ sender: Any) {
        sendRequestForGroupList()
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
                return dict
        }

        let token = params["access_token"]
        let userID = params["user_id"]
        

        if token != nil, userID != nil {
            userData.token = token!
            userData.userId = userID!
        }
        decisionHandler(.cancel)
    }
}
