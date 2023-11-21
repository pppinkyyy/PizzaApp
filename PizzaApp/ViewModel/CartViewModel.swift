//
//  CartViewModel.swift
//  PizzaApp
//
//  Created by Alia on 21.11.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var positions = [Position]()
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
