//
//  AddProductView.swift
//  PizzaApp
//
//  Created by Alia on 11.04.2024.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "pizzaNeopolitano")!
    @State var title: String = ""
    @State var descript: String = ""
    @State var price: Int? = nil
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .clipped()
                    .onTapGesture {
                        showImagePicker.toggle()
                    }
                TextField("Назва товару", text: $title)
                    .submitLabel(.done)
                    .padding()
                
                TextField("Вартість товару", value: $price, format: .number)
                    .padding()
                    .keyboardType(.numbersAndPunctuation)
                    .submitLabel(.done)
                
                TextField("Опис товару ", text: $descript)
                    .submitLabel(.done)
                    .padding()
                
                Button("Зберегти") {
                    
                    guard let price = price else {
                        print("Не можливо вилучити текст з TextField")
                        return
                    }
                    
                    let product = Product(id: UUID().uuidString, title: title, price: price, description: descript)
                    guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }
                    DatabaseService.shared.setProduct(product: product, image: imageData) { result in
                        switch result {
                        case .success(let product):
                            print(product.title)
                            dismiss()
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                .foregroundStyle(.black)
                .padding()
                .background(.quaternary)
                .cornerRadius(14)
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

#Preview {
    AddProductView()
}
