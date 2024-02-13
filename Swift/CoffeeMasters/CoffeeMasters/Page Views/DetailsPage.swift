//
//  DetailsPage.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 9.2.2024.
//

import SwiftUI

struct DetailsPage: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.dismiss) var dismiss
    @State var quantity = 1
    var product: Product

    var body: some View {
        ScrollView{
            AsyncImage(url: product.imageURL)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                .padding(.top, 32)
            Text(product.name)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .padding(24)
            Text(product.description)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .padding(24)
                .foregroundColor(Color("Primary"))
            HStack {
                Text("$ \(product.price, specifier: "%.2f") ea")
                Stepper(value: $quantity, in: 1...10) { }
            }
                .frame(maxWidth: .infinity)
                .padding(30)
            Text("Subtotal $\(Double(quantity)*product.price, specifier: "%.2f")")
                .bold()
                .padding(12)
            Button("Add \(quantity) to Cart") {
                cartManager.add(product: product, quantity: quantity)
                dismiss()
            }
                .padding()
                .frame(width: 250.0)
                .background(Color("Alternative2"))
                .foregroundColor(Color.black)
                .cornerRadius(25)
        }
        .navigationTitle("Some title")
    }
}

#Preview {
    DetailsPage(product: Product(id:1, name: "Dummy", description: "Some description", price: 1.25, image: ""))
        .environmentObject(CartManager())
}
