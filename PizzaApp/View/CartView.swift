//
//  CartView.swift
//  PizzaApp
//
//  Created by Alia on 16.11.2023.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack {
            
            Text("Ваше замовлення:")
                .foregroundStyle(.white)
                .font(.custom("AvenirNext-bold", size: 19))
            
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button ("Видалити") {
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        }.tint(.red)
                    }
            }
            .navigationTitle("Мій кошик")
            .listStyle(.plain)
            
            
            HStack {
                Text("Всього:")
                Spacer()
                Text("\(viewModel.cost)₴")
            }
            .padding(.horizontal)
            .font(.custom("AvenirNext-bold", size: 19))
            .foregroundColor(.white)
            
            
            HStack(spacing: 24) {
                Button(role: .cancel) {
                    viewModel.positions.removeAll()
                } label: {
                    Text("Скасувати")
                }
                .padding()
                .foregroundColor(.white)
                
                Button("Замовити") {
                    
                    var order = Order(userId: AuthService.shared.currentUser!.uid, date: Date(), status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOrders(order: order) { result in
                        switch result {
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        showingAlert.toggle()
                        viewModel.positions.removeAll()
                    }
                }   .padding()
                    .frame(maxWidth: .infinity)
                    .background(.orange)
                    .foregroundColor(.black)
                    .cornerRadius(18)
                    .alert("Ваше замовлення прийнято, очікуйте на наш дзвінок", isPresented: $showingAlert) {
                        Button("Добре") { }
                    }
            }
            .padding()
            
        }
        .background(.black)
    }
}

#Preview {
    CartView(viewModel: CartViewModel.shared)
}
