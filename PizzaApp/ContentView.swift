//
//  ContentView.swift
//  PizzaApp
//
//  Created by Alia on 15.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        VStack (spacing: 50) {
           
            Text("Авторизація")
                .padding()
                .padding(.horizontal, 30)
                .font(.title2 .bold())
                .background(Color("blackAlpha"))
                .cornerRadius(16)
                .foregroundColor(.yellow)
            
            VStack {
                TextField("", text: $email, prompt: Text("Введіть Еmail").foregroundColor(Color.gray))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("silver"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("", text: $password, prompt: Text("Введіть пароль").foregroundColor(Color.gray))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("silver"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                Button {
                    print("Увійти")
                } label: {
                    Text("Увійти")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
                
                Button {
                    print("Зареєструватися")
                } label: {
                    Text("Я ще не зареєстрований")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .background(Color .clear)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.yellow)
                }

            }
            .padding()
            .background(Color("blackAlpha"))
            .cornerRadius(20)
            .padding()
            .padding(.vertical)
           
            
             
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("pizzaBG"))
        
    }
}

#Preview {
    ContentView()
}
