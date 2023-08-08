//
//  ContentViewViewModel.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ContentViewViewModel: ObservableObject {
    @Published var isSignedIn: Bool = false
    @Published var currentUserId: String = ""
    @Published var currentUserName: String = ""
    //optional because it's originally nil
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.fetchUserName()
        //whenever a user is signed in or out, the listener will be triggered and change the currentUserId so we can updated the view
        //self optional helps prevent memory leaks
        let handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""                
            }
        }
    }

    func fetchUserName() {
            guard let uID = Auth.auth().currentUser?.uid else {
                return
            }

            let db = Firestore.firestore()
            db.collection("users").document(uID).getDocument { snapshot, error in
                if let data = snapshot?.data(), error == nil {
                    if let userName = data["name"] as? String {
                        DispatchQueue.main.async {
                            self.currentUserName = userName
                            self.isSignedIn = true
                        }
                    }
                }
            }
        }
}
