//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Alia on 15.11.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth 

let screen = UIScreen.main.bounds

@main
struct PizzaApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegete: AppDelegate
     
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            print("App Delegate")
            
            return true
        }
    }
}
