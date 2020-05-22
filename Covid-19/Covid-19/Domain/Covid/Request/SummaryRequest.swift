//
//  SummaryRequest.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

class SummaryRequest: APIRequest {
    
    var body: Data?
    var contentType: String
    var method: RequestType
    var path: String
    var parameters: [String: String]?

    init() {
        self.contentType = API.ContentType.json.rawValue
        self.method = .GET
        self.path = "\(API.EndPoint.summary)"
    }
}
