//
//  ServerNewsModel.swift
//  ChatALittle
//
//  Created by Денис Соснин on 15.02.2022.
//

import Foundation

struct ServerNewsModel: Codable {
    var albumId: Double
    var id: Double
    var title: String
    var url: URL
    var thumbnailUrl: URL
}

