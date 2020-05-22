//
//  CountriesViewModel.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

protocol CountriesViewModelProtocol {
    func load()
}

class CountriesViewModel: CountriesViewModelProtocol, ObservableObject {
    
    struct Input {
        let repository: CovidRepositoryProtocol
    }
    
    @Published var state: CountriesViewState
    @Published var dataSource: [Country]
    
    private let input: Input
    private var disposables: Set<AnyCancellable>
    
    init(repository: CovidRepositoryProtocol = CovidRepository()) {
        self.input = Input.init(
            repository: repository
        )
        
        self.state = .loading
        self.dataSource = []
        self.disposables = Set<AnyCancellable>()
        
        load()
    }
    
    func load() {
        input.repository.summary()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    print("Failure")
                    self.state = .error
                case .finished:
                    print("Finished")
                    self.state = .success
                  break
                }
            }, receiveValue: { [weak self] summary in
                guard let self = self else { return }
                self.dataSource = summary.Countries
            }
        ).store(in: &disposables)
    }
    
}
