//
//  ProductCell.swift
//  PizzaApp
//
//  Created by Alia on 17.11.2023.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        
        VStack {
            Image("pizzaMargarita")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                Text("\(product.price)₴")
                    .font(.custom("AvenirNext-bold", size: 12))
            } .padding(.horizontal)
        } .frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .shadow(radius: 4)
        
    }
}

#Preview {
    ProductCell(product: Product(id: "1", title: "Margarita Premio", imageURL: "not found", price: 260, description: "Vegan pizza"))
}
