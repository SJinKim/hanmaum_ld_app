//
//  RegisterViewViewModel.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 02.06.24.
//

import FirebaseAuth
import Foundation
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        //insert into db
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDict())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else { return false }
        
        guard password.count >= 6 else {
            // TODO give some advice that the password has to be longer than 6 characters
            return false
        }
        
        return true
    }
}
