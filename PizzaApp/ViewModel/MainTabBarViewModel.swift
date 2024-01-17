//
//  MainTabBarViewModel.swift
//  PizzaApp
//
//  Created by Alia on 17.01.2024.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
