//
//  AdminOrdersViewModel .swift
//  PizzaApp
//
//  Created by Alia on 27.02.2024.
//

import Foundation

class  AdminOrdersViewModel: ObservableObject {
    
    @Published var orders = [Order]()
    var currentOrder = Order(userId: "", date: Date(), status: "New")
    
    func getOrders() {
        DatabaseService.shared.getOrders(userId: nil) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                        case .success(let positions):
                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
