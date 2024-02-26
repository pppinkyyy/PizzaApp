//
//  ProfileViewModel.swift
//  PizzaApp
//
//  Created by Alia on 24.01.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: PizzaUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: PizzaUser) {
        self.profile = profile
    }
    
    func getOrders() {
        DatabaseService.shared.getOrders(userId: AuthService.shared.currentUser!.uid) { result in
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
                print("Всего заказов:\(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Помилка відправки данних \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
            DatabaseService.shared.getProfile { result in
                switch result {
                case .success(let user):
                    print(user)
                    self.profile = user
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
}

