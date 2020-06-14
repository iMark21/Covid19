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
    
    /// Output Subscribers
    @Published var state: CountriesViewState
    @Published var dataSource: [CountryViewModel]
    @Published var searchText: String
    
    /// Inpunt variables
    private let input: Input
    
    struct Input {
        let repository: CovidRepositoryProtocol
    }
    
    /// Private variables
    private var allRowCountries: [CountryViewModel]
    private var disposables: Set<AnyCancellable>
    
    init(repository: CovidRepositoryProtocol = CovidRepository()) {
        self.input = Input.init(
            repository: repository
        )
        
        self.state = .loading
        self.allRowCountries = []
        self.dataSource = []
        self.searchText = ""
        self.disposables = Set<AnyCancellable>()
        
        setup()
    }
    
    func setup() {
        
        input.repository.summary()
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    print("Failure")
                    self.state = .error
                case .finished:
                    print("Finished")
                    self.state = .success
                }
                }, receiveValue: { [weak self] summary in
                    guard let self = self else { return }
                    self.allRowCountries = self.generateDatasource(
                        countries: summary.Countries
                    )
                    self.dataSource = self.allRowCountries
                }
        ).store(in: &disposables)
        
        $searchText
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { (str) in
                if !self.searchText.isEmpty {
                    self.dataSource = self.allRowCountries.filter {
                        let country = $0.output.name.lowercased()
                        return country.contains(str.lowercased())
                    }
                } else {
                    self.dataSource = self.allRowCountries
                }
            }
        ).store(in: &disposables)
    }
    
    // MARK: - Datasource
    
    private func generateDatasource(countries: [Country]) -> [CountryViewModel]{
        var result: [CountryViewModel] = []
        for country in countries {
            let countryViewModel = CountryViewModel.init(country: country)
            result.append(countryViewModel)
        }
        return result
    }
    
}
