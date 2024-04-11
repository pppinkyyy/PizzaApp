//
//  OrderViewModel.swift
//  PizzaApp
//
//  Created by Alia on 11.03.2024.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var order: Order
    @Published var user = PizzaUser(id: "", name: "", phoneNumber: 0, address: "")
    
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        DatabaseService.shared.getProfile(by: order.userId) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
