//
//  FormatterExtensions.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 30/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
