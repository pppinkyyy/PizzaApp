//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Alia on 15.11.2023.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct PizzaAppApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
