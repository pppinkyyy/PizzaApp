//
//  ContentView.swift
//  PizzaApp
//
//  Created by Alia on 15.11.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        
        VStack (spacing: 50) {
            
            Text(isAuth ? "Авторизація" : "Реєстрація")
                .padding(isAuth ? 16 : 20)
                .padding(.horizontal, 30)
                .font(.title2 .bold())
                .background(Color("blackAlpha"))
                .cornerRadius(16)
                .foregroundColor(.orange)
                .padding()
            
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
                
                if !isAuth {
                    SecureField("", text: $confirmPassword, prompt: Text("Повторіть пароль").foregroundColor(Color.gray))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("silver"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("Увійти")
                        
                        AuthService.shared.signIn(email: self.email, password: self.password) { result in
                            switch result {
                                
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Помилка авторизації: \(error.localizedDescription)"
                                isShowAlert.toggle()
                            }
                        }
                        
                    } else {
                        print("Зареєструватися")
                        
                        guard password == confirmPassword else {
                            self.alertMessage = "Паролі не співпадають"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                            case.success(let user):
                                alertMessage = "Ви зареєструвалися з email \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassword = ""
                                self.isAuth.toggle()
                                
                            case.failure(let error):
                                alertMessage = "Помилка реєстрації \(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                    }
                } label: {
                    Text(isAuth ? "Увійти" : "Зареєструватися")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Я ще не зареєстрований" : "В мене вже є аккаунт")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .background(.clear)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.orange)
                }
            }
            .padding()
            .background(Color("blackAlpha"))
            .cornerRadius(20)
            .padding(isAuth ? 16 : 8)
            .padding(.vertical)
            .alert(alertMessage,
                   isPresented: $isShowAlert, actions: {
                Button("Oк") { }
            })
            
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("pizzaBG") .blur(radius: isAuth ? 0 : 5))
            .animation(.easeInOut(duration: 0.6), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow, content: {
                
                if AuthService.shared.currentUser?.uid == "VNH5mNWTjgQlHq4t4iFtJ5M66nC3" {
                    AdminOrdersView()
                } else {
                    let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                    
                    MainTabBar(viewModel: mainTabBarViewModel)
                }
            })
    }
}

#Preview {
    AuthView()
}
