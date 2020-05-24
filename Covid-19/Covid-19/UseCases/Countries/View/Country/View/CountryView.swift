//
//  CountryView.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 22/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import SwiftUI

struct CountryView: View {
    
    private let viewModel: CountryViewModel
    
    init(viewModel: CountryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.output.name)
                .font(Font.headline)
            Text("")
            HStack(alignment: .center) {
                Text(viewModel.output.newDeaths)
                    .foregroundColor(.red)
                Text(viewModel.output.totaDeaths)
                    .foregroundColor(.red)
            }
            HStack {
                Text(viewModel.output.newConfirmed)
                    .foregroundColor(.black)
                Text(viewModel.output.totalConfirmed)
                    .foregroundColor(.black)
            }
            HStack {
                Text(viewModel.output.newRecovered)
                    .foregroundColor(.green)
                Text(viewModel.output.totalRecoverd)
                    .foregroundColor(.green)
            }
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        let country = Country.init(
            Country: "España",
            Slug: "ESP", ISO2: "ES",
            CountryCode: "ES",
            NewConfirmed: 12,
            TotalConfirmed: 2221,
            NewDeaths: 2321,
            TotalDeaths: 321332,
            NewRecovered: 2,
            TotalRecovered: 231
        )
        let countryViewModel = CountryViewModel.init(country: country)
        return CountryView.init(viewModel: countryViewModel)
    }
}
