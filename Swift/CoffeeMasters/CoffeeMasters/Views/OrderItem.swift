//
//  OrderItem.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 10.2.2024.
//

import SwiftUI

struct OrderItem: View {
    @EnvironmentObject var cartManager: CartManager
    
    var item: (Product, Int)
    
    var body: some View {
        HStack {
            Text("\(item.1)x")
            Text(item.0.name)
            Spacer()
            Text("\(Double(item.1)*item.0.price, specifier: "%.2f")")
            Image(systemName: "trash")
                .font(.title)
                .foregroundColor(Color("Secondary"))
                .padding()
                .onTapGesture {
                    cartManager.remove(product: item.0)
                }
        }
    }
}

#Preview {
    OrderItem(item: (Product(id: 1, name: "Dummy", description: "xxx", price: 2.25, image: ""), 2))
        .padding()
}
