//
//  Agent.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

import Combine

struct Agent {
    // 1 Response<T> carries both parsed value and a URLResponse instance. The latter can be used for status code validation and logging.
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    // 2 The run<T>() method is the single entry point for requests execution.
    // It accepts a URLRequest instance that fully describes the request configuration.
    // The decoder is optional in case custom JSON parsing is needed.
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request) // 3 Create data task as a Combine publisher.
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data) // 4 Parse JSON data. We have constrained T to be Decodable in the run<T>() method declaration.
                return Response(value: value, response: result.response) // 5 Create the Response<T> object and pass it downstream. It contains the parsed value and the URL response.
            }
            .receive(on: DispatchQueue.main) // 6 Deliver values on the main thread.
            .eraseToAnyPublisher() // 7 Erase publisher’s type and return an instance of AnyPublisher.
    }
}


