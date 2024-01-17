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
    
            ProfileView()
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

