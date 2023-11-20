//
//  ProdutDetailsView.swift
//  PizzaApp
//
//  Created by Alia on 20.11.2023.
//

import SwiftUI

struct ProdutDetailsView: View {
    
    var product: Product
    
    var body: some View {
        Text("\(product.title)")
    }
}

#Preview {
    ProdutDetailsView(product: Product(id: "1",
                                       title: "Margarita Premio",
                                       imageURL: "not found",
                                       price: 260,
                                       descript: "Vegan pizza"))
}
