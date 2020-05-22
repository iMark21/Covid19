//
//  URLExtensions.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation

extension URL {
    func fixPlusSymbolUrlEncoding() -> String {
        return self.absoluteString.replacingOccurrences(of: "+", with: "%2B")
    }
}
