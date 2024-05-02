//
//  MenuViewModell.swift
//  PizzaApp
//
//  Created by Alia on 17.11.2023.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    static let shared = MenuViewModel()
    
    @Published var popularProducts = [Product]()
//    [
//        Product(id: "1",
//                title: "Margarita Premio",
//                price: 260,
//                description: "Tипова неаполітанська піца, виготовлена з помідорами Сан-Марцано, сиром моцарелла, свіжим базиліком, сіллю та оливковою олією."),
//        Product(id: "2",
//                title: "Italiano Peperoni",
//                price: 360,
//                description: "Hot pizza with chilly 
//    Сacciatore
    
//    Cправжня мисливська піца із ковбасками прямо з печі, виготовлена з сиром моцарелла, перцем Чилі, маслинами та томатами. "),
//        Product(id: "3",
//                title: "4 Cheeses",
//                price: 500,
//                description: "Pizzas consist of 4 cheeses"),
//        Product(id: "4",
//                title: "Double Meet",
//                price: 250,
//                description: "Пікантна піца, виготовлена з сиром моцарелла, в'яленого м'яса та приправлена паприкою, сіллю та паприковою олією.")]
    
   @Published var pizzas = [Product]()
//        Product(id: "1",
//                title: "Margarita Premio",
//                price: 260,
//                description: "Tипова неаполітанська піца, виготовлена з помідорами Сан-Марцано, сиром моцарелла, свіжим базиліком, сіллю та оливковою олією."),
//        Product(id: "2",
//                title: "Napolеtana",
//                price: 360,
//                description: "Неаполітанська піца — з помідорами, моцарелою, пармезаном, анчоусами, оливковою олією, орегано та базиліком."),
//        Product(id: "3",
//                title: "4 Formaggio",
//                price: 500,
//                description: "Дуууже сирна піца, виготовлена на тонкому тісті з сиром моцарелла, сиром Дор-блю, приправленим запашними травами сиром Фета, та Пармезаном. "),
//        Product(id: "4",
//                title: "Double Meet",
//                price: 250,
//                description: "Very meet pizza"),
//        Product(id: "5",
//                title: "Margarita Premio",
//                price: 260,
//                description: "Vegan pizza"),
//        Product(id: "6",
//                title: "Hot Peperony",
//                price: 360,
//                description: "Піца для шпіцов, маленька, смачна, і саме головне - корисна страва для ваших улюбленців. "),
//        Product(id: "7",
//                title: "Shpizza",
//                price: 500,
//                description: "Pizzas consist of 4 cheeses"),
//        Product(id: "8",
//                title: "Double Meet",
//                price: 250,
//                description: "Very meet pizza")
//   ]
    
    func getProducts() {
        DatabaseService.shared.getProducts { result in
            switch result {
            case .success(let products):
                self.pizzas = products
                self.popularProducts = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
