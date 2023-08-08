//
//  RegisterViewViewModel.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var fullname = ""
    @Published var username = ""
    @Published var bio = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        //create the new user
        Auth.auth().createUser(withEmail: email, password: password){[weak self] result, error in
            //make sure the user has a unique id
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
            print("insertUser record")
        }
        
    }
    
    private func insertUserRecord(id:String){
        //create user object
        let newUser = User(id: id, fullname: fullname, bio: bio, profileImageUrl: "cookie", username: username, email: email, following: [], followers: [], minutesStudied: 0)
        
        //insert into database
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    private func validate() -> Bool{
        //make sure none of the input is empty
        guard !fullname.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        //make sure email contains the @ and . to at least partially validate it
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        // password should be at least semi secure
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
