//
//  File.swift
//  Covid-19
//
//  Created by Juan Miguel Marques on 30/05/2020.
//  Copyright © 2020 Juan Miguel Marques. All rights reserved.
//

import Foundation
import SwiftUI

protocol AppCoordinatorProtocol {
    func start()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    let window: UIWindow?
    
    init(_ window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        startHome()
    }
    
    private func startHome() {
        let homeView = HomeView.init()

        window?.rootViewController = UIHostingController(rootView: homeView)
        window?.makeKeyAndVisible()
    }
}
