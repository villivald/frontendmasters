//
//  OffersPage.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 9.2.2024.
//

import SwiftUI

struct OffersPage: View {
    var body: some View {
        NavigationView{
            List {
                Offer(title: "Black Coffee", description: "Standard coffee")
                Offer(title: "Espresso", description: "Intense dark coffee")
                Offer(title: "Capuccino", description: "Signature coffee")
                Offer(title: "Latte", description: "Most wanted coffee")
            }.navigationTitle("Offers")
        }
    }
}

#Preview {
    OffersPage()
}
