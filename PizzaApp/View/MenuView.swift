//
//  MenuView.swift
//  PizzaApp
//
//  Created by Alia on 16.11.2023.
//

import SwiftUI

struct MenuView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Популярні піцци") {
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: layout, content: {
                        ForEach(viewModel.popularProducts, id: \.id) { item in
                            
                            NavigationLink {
                                let viewModel = ProductDetailsViewModel(product: item)
                                ProductDetailsView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.white)
                            }
                        } .padding(12)
                    })
                }
            }
            
            Section("Всі піцци") {
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: layout, content: {
                        ForEach(viewModel.pizzas, id: \.id) { item in
                            
                            NavigationLink {
                                let viewModel = ProductDetailsViewModel(product: item)
                                ProductDetailsView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.white)
                            }
                            
                        } .padding(12)
                    })
                }
            }
        } 
        .navigationTitle("Меню")
        .background(.black)
        .foregroundStyle(.white)
        .onAppear {
            viewModel.getProducts()
        }
        
//        TODO: сделать фон черным а буквы белым (или адаптивное все) может еще поработать с ячейками
//            .background(.black)
//        .scrollContentBackground(.hidden)
        
    }
}

#Preview {
    MenuView()
}
