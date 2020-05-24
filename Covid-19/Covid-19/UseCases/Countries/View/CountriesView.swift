//
//  CountriesView.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 17/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import SwiftUI

struct CountriesView: View {
    
    @ObservedObject var viewModel: CountriesViewModel
        
    init(viewModel: CountriesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    SearchBarView(searchText: $viewModel.searchText)
                    ForEach(
                        viewModel.dataSource,
                        content: CountryView.init(viewModel:)
                    )
                }
            }
            .navigationBarTitle("COVID-19 🦠")
        }
    }
}


struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(viewModel: CountriesViewModel())
    }
}
