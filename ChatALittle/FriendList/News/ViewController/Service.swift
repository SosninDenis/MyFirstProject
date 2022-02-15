//
//  Service.swift
//  ChatALittle
//
//  Created by Денис Соснин on 15.02.2022.
//

import Foundation
import UIKit

class Service {
    
    func reguest(complition: (([ServerNewsModel]) -> ())?) {
        let httpURL = URL(string: "https://jsonplaceholder.typicode.com/photos/")!
        let httpSession = URLSession.shared.dataTask(with: httpURL) { (data, response, error) in
            guard let validData = data, error == nil else {
                DispatchQueue.main.async {
                    print(error, "Error")
                }
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let codableData = try JSONDecoder().decode(ServerNewsModel.self, from: validData)
                    complition?([codableData])
                } catch let error {
                    print("Catch error", error.localizedDescription)
                }
            }
        }
        httpSession.resume()
    }
    
}

