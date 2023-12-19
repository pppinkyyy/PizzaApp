//
//  CartViewModel.swift
//  PizzaApp
//
//  Created by Alia on 21.11.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
//    pattern singleton:
    static let shared = CartViewModel()
    
    private init() { }
    
    @Published var positions = [Position]()
    
    var cost: Int {
        var sum = 0
        
        for pos in positions {
            sum += pos.cost
        }
        return sum 
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
