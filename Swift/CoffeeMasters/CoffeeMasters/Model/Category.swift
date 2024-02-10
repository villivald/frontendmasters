//
//  Category.swift
//  CoffeeMasters
//
//  Created by Maxim Villivald on 10.2.2024.
//

import Foundation

struct Category: Decodable {
    var name: String
    var products: [Product]
}
