//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation

final class History {
    let id: Int
    let name: String
    let phone: String
    let image: String
    let cost: String

    init(id: Int, name: String, phone: String, image: String, cost: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.image = image
        self.cost = cost
    }
}

extension History: CustomStringConvertible {}

extension History: Decodable {
    private enum HistoryField: String, CodingKey { // declaring our keys
        case id = "id"
        case name = "name"
        case phone = "phone"
        case image = "image"
        case cost = "cost"
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HistoryField.self)
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let phone = try container.decode(String.self, forKey: .phone)
        let image = try container.decode(String.self, forKey: .image)
        let cost = try container.decode(String.self, forKey: .cost)
        
        self.init(id: id, name: name, phone: phone, image: image, cost: cost)
    }
}
