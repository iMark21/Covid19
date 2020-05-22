//
//  SummaryResponse.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

struct SummaryResponse: Decodable, Hashable, Identifiable {
    let id = UUID()
    let Countries: [Country]
}

