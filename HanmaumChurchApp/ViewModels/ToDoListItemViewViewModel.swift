//
//  ToDoListItemViewViewModel.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 02.06.24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for single to do list item view (each row in items list)ø
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDict())
        
    }
}
