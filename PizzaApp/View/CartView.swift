//
//  CartView.swift
//  PizzaApp
//
//  Created by Alia on 16.11.2023.
//

import SwiftUI

struct CartView: View {
    
    var viewModel: CartViewModel
    
    var body: some View {
        Text("Cart")
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
