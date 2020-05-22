//
//  ContentView.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 17/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: CountriesViewModel

    var body: some View {
        NavigationView {
            List(viewModel.dataSource) { country in
                CountryRow(country: country)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("COVID-19 🦠")
        }
    }
    
    struct CountryRow: View {
        var country: Country

        var body: some View {
            VStack(alignment: .leading) {
                Text("\(country.Country ?? "")")
                Text("New deaths: \(country.NewDeaths)")
                    .foregroundColor(.red)
                Text("Total deaths: \(country.TotalDeaths)")
                    .foregroundColor(.red)
                Text("New confirned: \(country.NewConfirmed)")
                    .foregroundColor(.black)
                Text("Total confirmed: \(country.TotalConfirmed)")
                    .foregroundColor(.black)
                Text("New recovered: \(country.NewRecovered)")
                    .foregroundColor(.green)
                Text("Total recovered: \(country.TotalRecovered)")
                    .foregroundColor(.green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CountriesViewModel())
    }
}
