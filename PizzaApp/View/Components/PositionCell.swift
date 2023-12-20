//
//  PositionCellView.swift
//  PizzaApp
//
//  Created by Alia on 23.11.2023.
//

import SwiftUI

struct PositionCell: View {
    
    var position: Position
    
    var body: some View {
        
        HStack {
            Text("\(position.product.title)")
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost)₴")
                .bold()
                .frame(width: 65, alignment: .trailing)
        }
        .font(.custom("AvenirNext-regular", size: 15))
        .foregroundColor(.white)
        .padding(.horizontal)
        .listRowBackground(Color.black)
    }
}

#Preview {
    PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Неаполітанська піца",
                                                                            imageURL: "pizzaNeopolitano",
                                                                            price: 280,
                                                                            description: "Неаполітанська піца — з помідорами, моцарелою, пармезаном, анчоусами, оливковою олією, орегано та базиліком."),
                                    count: 3))
}
