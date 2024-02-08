//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 6.2.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Greeting()
            Greeting()
            Greeting()
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
