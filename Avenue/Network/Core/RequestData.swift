//
//  Request.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias Headers = [String: String]

typealias JsonObject = [String: AnyObject]
typealias JsonArray = [[String: AnyObject]]

protocol RequestData {
    func getArguments() -> Parameters
    func getHeaders() -> Headers
    func getBody() -> Parameters
}
