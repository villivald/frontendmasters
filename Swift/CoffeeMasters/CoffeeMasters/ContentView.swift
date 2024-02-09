//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 6.2.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MenuPage()
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Menu")
                }
            OffersPage()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Offers")
                }
            OrderPage()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Order")
                }
            InfoPage()
                .tabItem {
                    Image(systemName: "info")
                    Text("Info")
                }
        }
    }
}

struct Greeting: View {
   @State var name = ""

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
            Text("Hello \(name)")
        }
    }
}

#Preview {
    ContentView()
}
