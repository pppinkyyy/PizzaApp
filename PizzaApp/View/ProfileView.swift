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
                    Text("Мирослав Филиппецкий")
                        .font(.custom("AvenirNext-bold", size: 18))
                    
                    Text("+38(0 66 673 53 90)")
                }
            }
            
            VStack(alignment:.leading, spacing: 8) {
                Text("Адреса доставки:")
                    .bold()
                Text("Україна, м. Київ, вул. Юнацька 9, кв .7")
            } 
            
            List {
                Text("Замовлення")
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
    }
}

#Preview {
    ProfileView()
}
