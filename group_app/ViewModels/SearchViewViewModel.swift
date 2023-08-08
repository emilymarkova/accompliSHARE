//
//  SearchViewViewModel.swift
//  group_app
//
//  Created by Emily Markova on 8/2/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SearchViewViewModel: ObservableObject {
    @Published var users: [String] = [] // Published property to notify SwiftUI about changes
    init() {
        getUsers()
    }
    
    func getUsers(){
        let db = Firestore.firestore()
        var users = [String]()

        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if let username = document.data()["name"] as? String {
                        users.append(username)
                    }
                }
            }
            self.users = users
        }
    }
}
