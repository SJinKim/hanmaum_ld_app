//
//  LoginView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 02.06.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                CustomHeaderView(title: "Like Daniel", subtitle: "Hanmaum Church", angle: 15, background: .pink
                )
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    CustomButton(title: "Login", background: .blue) {
                        // add login action
                        viewModel.login()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }

        }
    }
}

#Preview {
    LoginView()
}
