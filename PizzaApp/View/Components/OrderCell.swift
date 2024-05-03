//
//  OrderCell.swift
//  PizzaApp
//
//  Created by Alia on 21.02.2024.
//

import SwiftUI

struct OrderCell: View {
    
    var order: Order
    
    var body: some View {
        
        HStack {
            Text("\(order.date.formatted(date: .abbreviated, time: .shortened))")
            Text("\(order.cost)₴")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundStyle(.green)
        }
        .background(.black)
        .listRowBackground(Color.black)
    }
}

//#Preview {
//    OrderCell(order: <#Order#>)
//}
