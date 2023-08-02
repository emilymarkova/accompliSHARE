//
//  ProfileViewViewModel.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel : ObservableObject{
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        //cretae a new var bc item is content so it's immutable
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        //replace old item with new one
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
            
    }
}
