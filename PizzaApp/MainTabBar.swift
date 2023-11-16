//
//  MainTabBar.swift
//  PizzaApp
//
//  Created by Alia on 16.11.2023.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        
        TabView {
            ProfileView()
            .tabItem {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Мій профіль")
                }
            }
            
            MenuView()
                .tabItem {
                    VStack {
                        Image(systemName: "menucard")
                        Text("Меню")
                    }
                }
            
            CartView()
            .tabItem {
                VStack {
                    Image(systemName: "basket")
                    Text("Мій кошик")
                }
            }
        }
        
       
    }
}

#Preview {
    MainTabBar()
}
