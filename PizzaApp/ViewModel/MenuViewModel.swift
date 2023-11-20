//
//  MenuViewModell.swift
//  PizzaApp
//
//  Created by Alia on 17.11.2023.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    static let share = MenuViewModel()
    
    var popularProducts = [
        Product(id: "1", 
                title: "Margarita Premio",
                imageURL: "not found",
                price: 260,
                descript: "Vegan pizza"),
        Product(id: "2", 
                title: "Hot Peperony",
                imageURL: "not found",
                price: 360,
                descript: "Hot pizza with chilly pepers "),
        Product(id: "3",
                title: "4 Cheeses",
                imageURL: "not found",
                price: 500,
                descript: "Pizzas consist of 4 cheeses"),
        Product(id: "4",
                title: "Double Meet",
                imageURL: "not found",
                price: 250,
                descript: "Very meet pizza")]
    
    var pizzas = [
        Product(id: "1",
                title: "Margarita Premio",
                imageURL: "not found",
                price: 260,
                descript: "Vegan pizza"),
        Product(id: "2",
                title: "Hot Peperony",
                imageURL: "not found",
                price: 360,
                descript: "Hot pizza with chilly pepers "),
        Product(id: "3",
                title: "4 Cheeses",
                imageURL: "not found",
                price: 500,
                descript: "Pizzas consist of 4 cheeses"),
        Product(id: "4",
                title: "Double Meet",
                imageURL: "not found",
                price: 250,
                descript: "Very meet pizza"),
        Product(id: "5",
                title: "Margarita Premio",
                imageURL: "not found",
                price: 260,
                descript: "Vegan pizza"),
        Product(id: "6",
                title: "Hot Peperony",
                imageURL: "not found",
                price: 360,
                descript: "Hot pizza with chilly pepers "),
        Product(id: "7",
                title: "4 Cheeses",
                imageURL: "not found",
                price: 500,
                descript: "Pizzas consist of 4 cheeses"),
        Product(id: "8",
                title: "Double Meet",
                imageURL: "not found",
                price: 250,
                descript: "Very meet pizza")]
}
