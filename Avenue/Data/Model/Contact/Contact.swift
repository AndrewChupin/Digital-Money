//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation

final class Contact {
    let name: String
    let phone: String
    let image: String

    init(name: String, phone: String, image: String) {
        self.name = name
        self.phone = phone
        self.image = image
    }
}

extension Contact: Decodable {
    private enum ContactField: String, CodingKey { // declaring our keys
        case name = "name"
        case phone = "phone"
        case image = "image"
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContactField.self)
        let name: String = try container.decode(String.self, forKey: .name)
        let phone: String = try container.decode(String.self, forKey: .phone)
        let image: String = try container.decode(String.self, forKey: .image)
        
        self.init(name: name, phone: phone, image: image)
    }
}
