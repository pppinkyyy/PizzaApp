//
//  OrderCell.swift
//  PizzaApp
//
//  Created by Alia on 21.02.2024.
//

import SwiftUI

struct OrderCell: View {
    
    @State var order = Order(userId: "", date: Date(), status: "New")
    
    var body: some View {
        
        HStack {
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundStyle(.green)
        }
        
    }
}

#Preview {
    OrderCell()
}
