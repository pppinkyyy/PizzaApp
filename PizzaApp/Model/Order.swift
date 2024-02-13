//
//  Order.swift
//  PizzaApp
//
//  Created by Alia on 13.02.2024.
//

import Foundation
import FirebaseFirestore

struct Order {
    var id: String = UUID().uuidString
    var userId: String
    var positions = [Position]()
    var date: Date
    var status: String
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum 
    }
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = id
        repres["userId"] = userId
        repres["status"] = status
        repres["date"] = Timestamp(date: date)
        return repres
    }
    
    
}
