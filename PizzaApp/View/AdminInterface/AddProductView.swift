//
//  AddProductView.swift
//  PizzaApp
//
//  Created by Alia on 11.04.2024.
//

import SwiftUI

struct AddProductView: View {
    
//    enum Field {
//            case title
//            case descript
//            case price
//        }
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "pizzaNeopolitano")!
    @State var title: String = ""
    @State var descript: String = ""
    @State var price: Int? = nil
    @Environment (\.dismiss) var dismiss
    
//    @FocusState private var focusedField: Field?
    
    var body: some View {
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
                .padding()
//                .focused($focusedField, equals: .title)
//                .textContentType(.givenName)
//                .submitLabel(.next)

            TextField("Вартість товару", value: $price, format: .number)
                .padding()
                .keyboardType(.numberPad)
//                .focused($focusedField, equals: .price)
//                .textContentType(.givenName)
//                .submitLabel(.next)
            
            TextField("Опис товару ", text: $descript)
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
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

#Preview {
    AddProductView()
}
