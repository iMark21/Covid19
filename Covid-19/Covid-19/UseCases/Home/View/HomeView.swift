//
//  HomeView.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 30/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            CountriesView(viewModel: CountriesViewModel.init())
                .tabItem ({
                    Image(systemName: "globe")
                    Text("Countries")
                })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
