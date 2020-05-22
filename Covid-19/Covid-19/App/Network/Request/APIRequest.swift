//
//  APIRequest.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case GET, POST, PUT
}

protocol APIRequest {
    var contentType: String { get set }
    var body: Data? { get }
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String: String]? { get }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        
        guard var components = URLComponents(
            url: baseURL.appendingPathComponent(path),
            resolvingAgainstBaseURL: false) else {
                fatalError("Unable to create URL components")
        }
        
        if let parameters = parameters {
            components.queryItems = parameters.map {
                URLQueryItem(name: String($0), value: String($1))
            }
        }
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest.init(
            url: URL.init(string: url.fixPlusSymbolUrlEncoding()) ?? url
        )
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue(
            contentType,
            forHTTPHeaderField: API.HTTPHeaderField.contentType.rawValue
        )
        return request
    }
}
