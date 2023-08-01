//
//  ContentViewViewModel.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import FirebaseAuth
import Foundation

class ContentViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    //optional because it's originally nil
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        //whenever a user is signed in or out, the listener will be triggered and change the currentUserId so we can updated the view
        //self optional helps prevent memory leaks
        let handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""                
            }
        }
    }

    public var isSignedIn: Bool {
        //current value for user = signed in
        return Auth.auth().currentUser != nil
    }
}
