//
//  NewItemViewViewModel.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    func save(){
        guard canSave else {
            return
        }
        //get current user id
        let uId = "i7IiYkgIzuf8yq25uB3dQfPswUJ2"
        //create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        //save a model as a sub collection of the current user
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        //make sure due date is greater than or equal 24 hours before now to get past time weirdness
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
