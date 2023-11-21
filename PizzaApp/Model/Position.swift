//
//  Position.swift
//  PizzaApp
//
//  Created by Alia on 21.11.2023.
//

import Foundation

struct Position {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
