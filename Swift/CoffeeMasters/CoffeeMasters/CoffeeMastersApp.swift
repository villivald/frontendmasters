//
//  CoffeeMastersApp.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 6.2.2024.
//

import SwiftUI

@main
struct CoffeeMastersApp: App {
    var menuManager = MenuManager()
    var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
                .environmentObject(cartManager)
        }
    }
}
