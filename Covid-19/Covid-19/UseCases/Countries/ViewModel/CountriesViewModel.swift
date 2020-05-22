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
    func setup()
}

class CountriesViewModel: CountriesViewModelProtocol, ObservableObject {
    
    struct Input {
        let repository: CovidRepositoryProtocol
    }
    
    @Published var state: CountriesViewState
    @Published var dataSource: [Country]
    @Published var searchText: String
    
    private var allCountries: [Country]
    private let input: Input
    private var disposables: Set<AnyCancellable>
    
    init(repository: CovidRepositoryProtocol = CovidRepository()) {
        self.input = Input.init(
            repository: repository
        )
        
        self.state = .loading
        self.allCountries = []
        self.dataSource = []
        self.searchText = ""
        self.disposables = Set<AnyCancellable>()
        
        setup()
    }
    
    func setup() {
        
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
                    self.allCountries = summary.Countries
                    self.dataSource = summary.Countries
                }
        ).store(in: &disposables)
        
        $searchText
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { (str) in
                if !self.searchText.isEmpty {
                    self.dataSource = self.allCountries.filter {
                        guard let country = $0.Country else {
                            return false
                        }
                        return country.contains(str)
                    }
                } else {
                    self.dataSource = self.allCountries
                }
            }
        ).store(in: &disposables)
    }
    
}
