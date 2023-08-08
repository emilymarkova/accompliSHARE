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
    @Published var user: User? = nil
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
    
//    func getUser(name: String, completion: @escaping (String) -> Void){
//        let db = Firestore.firestore()
//        var userId = ""
//        
//        db.collection("users").getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        if let username = document.data()["name"] as? String {
//                            if username == name {
//                                let userData = document.data()
//                                let id = document.documentID
//                                let fullname = userData["fullname"] as? String
//                                let bio = userData["bio"] as? String
//                                let profileImageUrl = userData["profileImageUrl"] as? String
//                                let username = userData["username"] as? String
//                                let email = userData["email"] as? String
//                                let following = userData["following"] as? [String] ?? []
//                                let followers = userData["followers"] as? [String] ?? []
//
//                                let user = User(id: id, fullname: fullname, bio: bio, profileImageUrl: profileImageUrl, username: username, email: email, following: following, followers: followers)
//                                completion(user)
//                                return
//                            }
//                        }
//                    }
//                }
//                completion(nil)
//            }
//    }
}
