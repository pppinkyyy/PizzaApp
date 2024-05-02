//
//  ProductDetailsViewModel.swift
//  PizzaApp
//
//  Created by Alia on 21.11.2023.
//

import Foundation
import UIKit

class ProductDetailsViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var pizzaSizes = ["Маленька", "Середня", "Велика"]
    @Published var count = 0
    @Published var image = UIImage(named: "pizzaPiece")!
    
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
    
    func getImage() {
        StorageService.shared.downloadProductImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
