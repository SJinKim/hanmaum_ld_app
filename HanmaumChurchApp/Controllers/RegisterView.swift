//
//  RegisterView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 02.06.24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            CustomHeaderView(title: "Register", subtitle: "become a Like Daniel member", angle: 15, background: .orange)
                
            //Registration Form
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                CustomButton(title: "Register", background: .green) {
                    // attempt registration
                    viewModel.register()
                }
            }
        Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
