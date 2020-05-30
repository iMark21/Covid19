//
//  CountryViewModel.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 24/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class CountryViewModel: Identifiable {
    
    struct Output {
        let name: String
        let newDeaths: String
        let totaDeaths: String
        let newConfirmed: String
        let totalConfirmed: String
        let newRecovered: String
        let totalRecoverd: String
        let image: String
    }
    
    struct Input {
        let country: Country
    }
    
    private let input: Input
    let id = UUID()
    let output: Output
    
    init(country: Country) {
        input = Input.init(country: country)
        output = Output.init(
            name: country.Country ?? "",
            newDeaths: "\(country.NewDeaths) death today",
            totaDeaths: "total: \(country.TotalDeaths)",
            newConfirmed: "\(country.NewConfirmed.formattedWithSeparator) confirmed today",
            totalConfirmed: "total: \(country.TotalConfirmed)",
            newRecovered: "\(country.NewRecovered) recovered today",
            totalRecoverd: "total: \(country.TotalRecovered)",
            image: "\(country.Slug ?? "")-flag-icon-128"
        )
    }
    
}
