//
//  MenuView.swift
//  PizzaApp
//
//  Created by Alia on 16.11.2023.
//

import SwiftUI

let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]

struct MenuView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Popular") {
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: layout, content: {
                        ForEach(MenuViewModel.share.popularProducts, id: \.id) { item in
                            
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
            
            Section("Pizza") {
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: layout, content: {
                        ForEach(MenuViewModel.share.pizzas, id: \.id) { item in
                            
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
        } .navigationTitle("Меню")
        
//        TODO: сделать фон черным а буквы белым (или адаптивное все) может еще поработать с ячейками
//            .background(.black)
        
    }
}

#Preview {
    MenuView()
}
