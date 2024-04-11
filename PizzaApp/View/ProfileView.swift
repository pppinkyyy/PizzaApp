//
//  ProfileView.swift
//  PizzaApp
//
//  Created by Alia on 16.11.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false

    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(alignment:.center, spacing: 20 ) {
            HStack(spacing: 12) {
                Image("user")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(8)
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Додати фото", isPresented: $isAvaAlertPresented) {
                        
                        Button("Відкрити галерею") {
                            
                        }
                        Button("Відкрити камеру") {
                            
                        }
                        
                        Button(role: .cancel) { } label: {
                            Text("Відмінити")
                        }
                        
                    }
                
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Ваше ім`я та прізвище", text: $viewModel.profile.name)
                        .font(.custom("AvenirNext-bold", size: 18))
                   
                    HStack {
                        Text("+380")
                        TextField("Ваш номер телефону", value: $viewModel.profile.phoneNumber, format: .number)
                    }

                }
            }
            
            VStack(alignment:.leading, spacing: 8) {
                Text("Адреса доставки:")
                    .bold()
                
                TextField("Ваша адреса", text: $viewModel.profile.address)
            }
            .padding(.horizontal)
            
            List {
                if viewModel.orders.count == 0 {
                    Text("Тут з'являться ваші замовлення")
                } else {
                    ForEach(viewModel.orders, id:\.id) { order in
                        OrderCell(order: order)
                    }
                }
//                Text("Тут з'являться ваші замовлення")
            }
            .listStyle(.plain)
            
            
            Button("Вийти з облікового запису") {
                isQuitAlertPresented.toggle()
            }
            .padding()
            .padding(.horizontal, 30)
            .background(.orange)
            .foregroundStyle(.black)
            .cornerRadius(20)
            .padding()
            .confirmationDialog("Ви впевнені, що хочете вийти?", isPresented: $isQuitAlertPresented, titleVisibility: .visible) {
                Button("Вийти") {
                    isAuthViewPresented.toggle()
                }
                Button(role: .cancel) { } label: {
                    Text("Залишитись")
                }
            }
            .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                AuthView()
            }
            
        }  .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .foregroundStyle(.orange)
            .onSubmit {
                viewModel.setProfile()
            }
            .onAppear{
                self.viewModel.getProfile()
                self.viewModel.getOrders()
            }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(profile: PizzaUser(id: "",
                                                               name: "Влад Степаненко",
                                                               phoneNumber: 666888999,
                                                               address: "Київ")))
}
