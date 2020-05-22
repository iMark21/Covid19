//
//  CountriesResponse.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

struct Country: Decodable, Hashable, Identifiable {
    let id = UUID()
    let Country: String?
    let Slug: String?
    let ISO2: String?
    let CountryCode: String?
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
}
