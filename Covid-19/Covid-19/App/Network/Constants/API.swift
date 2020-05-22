//
//  API.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

struct API {
    static let base = URL(string: "https://api.covid19api.com")!
    
    enum HTTPHeaderField: String {
        case acceptType = "Accept"
        case contentType = "content-type"
    }

    enum ContentType: String {
        case json = "application/json"
        case formData = "multipart/form-data"
    }
    
}
