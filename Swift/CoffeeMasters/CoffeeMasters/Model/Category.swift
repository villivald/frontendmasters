//
//  Category.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 10.2.2024.
//

import Foundation

struct Category: Decodable, Identifiable {
    var name: String
    var products: [Product]
    var id: String {
        return self.name
    }
}
