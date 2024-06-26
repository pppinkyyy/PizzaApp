//
//  MainTabBar.swift
//  PizzaApp
//
//  Created by Alia on 16.11.2023.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        
        TabView {
    
            ProfileView(viewModel: ProfileViewModel(profile: PizzaUser(id: "",
                                                                         name: "",
                                                                         phoneNumber: 000000000,
                                                                         address: "")))
            .tabItem {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Мій профіль")
                }
            }
            
            NavigationView {
                MenuView()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "menucard")
                        Text("Меню")
                    }
                }
//                .toolbar(.visible, for: .tabBar)
//                .toolbarBackground(Color.black, for: .tabBar)
//                .colorScheme(.dark)
            
            CartView(viewModel: CartViewModel.shared)
            .tabItem {
                VStack {
                    Image(systemName: "basket")
                    Text("Мій кошик")
                }
            }
        }.tint(.orange)
    }
}

