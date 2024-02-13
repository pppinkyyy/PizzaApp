//
//  Position.swift
//  PizzaApp
//
//  Created by Alia on 21.11.2023.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        
        repres["id"] = id
        repres["count"] = count
        repres["title"] = product.title
        repres["price"] = product.price 
        repres["cost"] = cost
        
        return repres
    }
}
