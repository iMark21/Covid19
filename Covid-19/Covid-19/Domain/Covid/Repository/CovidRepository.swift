//
//  CovidRepository.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation
import Combine

protocol CovidRepositoryProtocol {
    func countries() -> AnyPublisher<[Country], Error>
    func summary() -> AnyPublisher<SummaryResponse, Error>
}

class CovidRepository: CovidRepositoryProtocol {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func countries() -> AnyPublisher<[Country], Error> {
        let request = CountriesRequest.init()
        return apiClient.execute(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func summary() -> AnyPublisher<SummaryResponse, Error> {
        let request = SummaryRequest.init()
        return apiClient.execute(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
