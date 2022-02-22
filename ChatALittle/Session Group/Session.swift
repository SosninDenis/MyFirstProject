//
//  Session.swift
//  ChatALittle
//
//  Created by Денис Соснин on 17.02.2022.
//

import Foundation

class Session {
    
    static let shared = Session()
    private init () {}
    
    var token: String = ""
    var userId: Int = 0
}
