//
//  ToDoListViewViewModel.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//
import FirebaseFirestore
import Foundation

//ViewModel for list of items view
// primary tab
class ToDoListViewViewModel : ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String

    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
