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
    private let userName: String
    @Published var name: String? = nil
    @Published var bio: String? = nil

    init(user: User){
        self.userName = user.username ?? ""
        self.name = user.fullname
        self.bio = user.bio
    }
    
    
    
    func fetchUser() {
        getUser(name: self.userName) { userId in
            if userId.isEmpty {
                print("Error: User not found")
                return
            }
            let db = Firestore.firestore()
            db.collection("users").document(userId).getDocument { snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    if let error = error {
                        print("Error fetching data:", error.localizedDescription)
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.name = data["name"] as? String
                    self.bio = data["bio"] as? String
                }
            }
        }
        
    }
    func toggleIsDone(item: ToDoListItem){
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
            .setData(itemCopy.asDictionary())
    }

    func Follow(userName: String){
        //get current user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        //create a model
        let newItem = [userName]
        //save a model as a sub collection of the current user
        let db = Firestore.firestore()
        db.collection("users").document(uID).setData([ "following": newItem ], merge: true)
        
        getUser(name: userName) { userId in
            // Use the userId here or perform any other tasks with it
            db.collection("users").document(userId).setData([ "followers": newItem ], merge: true)
        }
    }
    
    func getUser(name: String, completion: @escaping (String) -> Void){
        let db = Firestore.firestore()
        var userId = ""
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        if let username = document.data()["name"] as? String {
                            if username == name {
                                userId = document.documentID
                                break
                            }
                        }
                    }
                }
                completion(userId)
            }
    }

    func getFollowers(userId: String) -> [String] {
        let db = Firestore.firestore()
        var followersList = [String]() // Initialize an empty array to hold the followers

        db.collection("users").document(userId).getDocument { (document, error) in
            if let document = document, document.exists {
                if let followers = document.data()?["followers"] as? [String] {
                    followersList = followers
                }
            } else {
                print("Document does not exist")
            }
        }

        return followersList
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
}
