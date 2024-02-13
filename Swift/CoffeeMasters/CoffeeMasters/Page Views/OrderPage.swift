//
//  OrderPage.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 9.2.2024.
//

import SwiftUI

struct OrderPage: View {
    @State var name: String = ""
    @State var phone: String = ""
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
                   if cartManager.cart.count == 0 {
                       Text("Your order is empty")
                           .navigationTitle("Your Order")
                   } else {
                       List {
                           Section("ITEMS") {
                               ForEach(cartManager.cart, id:\.0.id) { item in
                                   OrderItem(item: item)
                               }
                           }.listRowBackground(Color("CardBackground"))
                                               
                           Section("YOUR DETAILS") {
                               VStack {
                                   TextField("Your Name", text: $name)
                                       .textFieldStyle(.roundedBorder)
                                   Spacer().frame(height: 20)
                                   TextField("Your Phone #", text: $phone)
                                       .keyboardType(.phonePad)
                                       .textFieldStyle(.roundedBorder)
                               }.padding(.top)
                                .padding(.bottom)
                           }.listRowBackground(Color("CardBackground"))
                           
                           Section() {
                               HStack {
                                   Spacer()
                                   Text("Total")
                                   Spacer()
                                   Text("$\(cartManager.total(), specifier: "%.2f")").bold()
                                   Spacer()
                               }
                           }.listRowBackground(Color.clear)
                           
                           Section {
                               HStack {
                                   Spacer()
                                   Button("Place Order") {
                                       //TODO: Validation
                                   }
                                       .padding()
                                       .frame(width: 250.0)
                                       .background(Color("Alternative2"))
                                       .foregroundColor(Color.black)
                                       .cornerRadius(25)
                                       
                                   Spacer()
                               }
                           }.listRowBackground(Color.clear)
                       }
                       .listSectionSeparatorTint(Color("AccentColor"))
                       .listStyle(.insetGrouped)
                       .navigationTitle("Your Order")
                   }
               }
    }
}

#Preview {
    OrderPage()
        .environmentObject(CartManager())
}
