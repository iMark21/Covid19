//
//  APIClient.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation
import Combine

protocol APIClientProtocol {
    func execute<T: Decodable>(
        _ apiRequest: APIRequest
    ) -> AnyPublisher<Agent.Response<T>, Error>
}

class APIClient: APIClientProtocol {
    
    struct Input {
        let baseURL: URL
        let agent: Agent
    }
    
    private let input: Input
    
    init(baseURL: URL = API.base,
         agent: Agent = Agent()) {
        
        self.input = Input.init(
            baseURL: baseURL,
            agent: agent
        )
    }
    
    func execute<T>(_ apiRequest: APIRequest)
        -> AnyPublisher<Agent.Response<T>, Error> where T : Decodable {
        let request = apiRequest.request(
            with: self.input.baseURL
        )
        return input.agent.run(request)
    }
}
