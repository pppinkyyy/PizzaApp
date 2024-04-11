//
//  AdminOrdersView.swift
//  PizzaApp
//
//  Created by Alia on 27.02.2024.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    @State var isAuthViewShow = false
    
    var body: some View {
        VStack {
            
            HStack {
                Button("Вихід") {
                    AuthService.shared.signOut()
                    isAuthViewShow.toggle()
                }
                
                Spacer()
                
                Button("Додати замовлення") {
                    
                }
                .foregroundStyle(.white)
                .padding()
                .background(.galaxy)
                .cornerRadius(15)
    
                Spacer()
                
                Button("Оновити") {
                    viewModel.getOrders()
                }
            }
            .padding()
            
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }
            .background(.galaxy)
            .listStyle(.plain)
            .onAppear {
                viewModel.getOrders()
            }
            .sheet(isPresented: $isOrderViewShow, content: {
                let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                OrderView(viewModel: orderViewModel)
        })
        }.fullScreenCover(isPresented: $isAuthViewShow, content: {
            AuthView()
        })
    }
}

#Preview {
    AdminOrdersView()
}
