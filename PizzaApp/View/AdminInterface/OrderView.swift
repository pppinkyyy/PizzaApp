//
//  OrderView.swift
//  PizzaApp
//
//  Created by Alia on 11.03.2024.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
    
    var statuses: [String] {
        var sts = [String]()
        
        for status in OrderStatus.allCases {
            sts.append(status.rawValue)
        }
        return sts
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8 ) {
            
            Text("\(viewModel.user.name)")
                .bold()
                .font(.title3)
                .foregroundStyle(.white)
            
            Text("+380 \(viewModel.user.phoneNumber)")
                .bold()
                .foregroundStyle(.white)
            
            Text("\(viewModel.user.address)")
                .foregroundStyle(.white)
            
            Picker("Статус замовлення", selection: $viewModel.order.status) {
                ForEach(statuses, id: \.self) { status in
                    Text(status)
                }
            }
            .pickerStyle(.palette)
            .onChange(of: viewModel.order.status) { newStatus in
                DatabaseService.shared.setOrders(order: viewModel.order) { result in
                    switch result {
                    case .success(let order):
                        print(order.status)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }
            }
            
            List {
                ForEach (viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
                
                Text("Всього: \(viewModel.order.cost) ₴")
                    .bold()
            }
        }
        .padding()
        .onAppear {
            viewModel.getUserData()
        }
        .background(.galaxy)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    OrderView(viewModel: OrderViewModel(order: Order(userId:  "", date: Date(), status: "New")))
}
