//
//  ProductDetailsViewModel.swift
//  PizzaApp
//
//  Created by Alia on 21.11.2023.
//

import Foundation

class ProductDetailsViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var pizzaSizes = ["Маленька", "Середня", "Велика"]
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "Велика": return Int(Double(product.price) * 1.6)
        case "Середня": return Int(Double(product.price) * 1.25)
        case "Маленька": return product.price
        default: return 0
        }
    }
}
