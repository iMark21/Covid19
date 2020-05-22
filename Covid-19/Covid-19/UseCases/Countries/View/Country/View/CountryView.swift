//
//  CountryView.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import SwiftUI

struct CountryView: View {
    var country: Country
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(country.Country ?? "")")
                .font(Font.headline)
            Text("")
            HStack(alignment: .center) {
                Text("\(country.NewDeaths) death today,")
                    .foregroundColor(.red)
                Text("total: \(country.TotalDeaths)")
                    .foregroundColor(.red)
            }
            HStack {
                Text("\(country.NewConfirmed) confirmed today,")
                    .foregroundColor(.black)
                Text("total: \(country.TotalConfirmed)")
                    .foregroundColor(.black)
            }
            HStack {
                Text("\(country.NewRecovered) recovered today,")
                    .foregroundColor(.green)
                Text("total: \(country.TotalRecovered)")
                    .foregroundColor(.green)
            }
        }
    }
}
