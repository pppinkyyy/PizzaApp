//
//  ProfileViewModel.swift
//  PizzaApp
//
//  Created by Alia on 24.01.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: PizzaUser
    
    init(profile: PizzaUser) {
        self.profile = profile
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
