//
//  ProdutDetailsView.swift
//  PizzaApp
//
//  Created by Alia on 20.11.2023.
//

import SwiftUI

struct ProductDetailsView: View {
    
    var viewModel: ProductDetailsViewModel
    @State var size = "Маленька"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                Image("pizzaMargarita")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 400)
                
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.custom("AvenirNext-bold", size: 25))
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size))₴")
                        .font(.custom("AvenirNext-bold", size: 25))
                    
                }
                .padding(.horizontal)
                
                Text("\(viewModel.product.description)")
                    .font(.custom("AvenirNext-regular", size: 18))
                    .padding(.horizontal)
                    .padding(.vertical, 4)
            }
            .ignoresSafeArea()
            .foregroundColor(.white)
            
            
            HStack {
                Stepper("Кількість піц", value: $count, in: 1...20)
                Text("\(count)")
                    .padding(.leading)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .font(.custom("AvenirNext-regular", size: 15))
            .padding(9)
            .foregroundColor(.white)
            
            Picker("Pizza Size", selection: $size) {
                ForEach(viewModel.pizzaSizes, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.segmented)
            .background(.secondary)
            .font(.custom("AvenirNext-regular", size: 15))
            .padding()
            
            
            Button("Додати до кошика") {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                
                position.product.price = viewModel.getPrice(size: size)
                
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
            }
            .font(.custom("AvenirNext-bold", size: 20))
            .padding(7) 
            .padding(.horizontal, 40)
            .background(.orange)
            .cornerRadius(14)
            .padding()
            .foregroundColor(.black)
            
            Spacer()
        }
        .background(Color.black)
    }
}

#Preview {
    ProductDetailsView(viewModel: ProductDetailsViewModel(product: Product(id: "1",
                                                                           title: "Margarita Premio",
                                                                           imageURL: "not found",
                                                                           price: 260,
                                                                           description: "Tипова неаполітанська піца, виготовлена з помідорами Сан-Марцано, сиром моцарелла, свіжим базиліком, сіллю та оливковою олією.")))
}
