//
//  KarlieKlossView1.swift
//  accompliSHARE1
//
//  Created by Gnapika Birlangi on 8/2/23.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewViewModel

    init(userName: String) {
        self._viewModel = StateObject(wrappedValue: ProfileViewViewModel(userName: userName))
//        viewModel.fetchUser()
    }

    var body: some View {
        //let people = viewModel.users
            NavigationView {
                ZStack {
                    Color(.init(genericCMYKCyan: 0.00, magenta: 0.06, yellow: 0.39, black: 0.00, alpha: 0.93))
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
//                        HStack {
//                            Text(name)
//                                .fontWeight(.bold)
//                                .font(.title)
//                                .multilineTextAlignment(.center)
//                        }
//                        Text(bio)
//                            .padding(.top, 5)
//
//                        Button("Follow"){
//                            viewModel.Follow(userName: viewModel.name!)
//                        }
//                        .fontWeight(.thin)
//                        .foregroundColor(Color.black)
//                        //                    NavigationLink(destination: FollowersView()) {
//                        //                        Text("Follow")
//                        //                            .fontWeight(.thin)
//                        //                            .foregroundColor(Color.black)
//                        //
//                        //                    }
//                        .font(.title2)
//                        .buttonStyle(.borderedProminent)
//                        .padding(.top, 10)
                        if let name = viewModel.name, let bio = viewModel.bio {
                            HStack {
                                Text(name)
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                            }
                            Text(bio)
                                .padding(.top, 5)
                            Button("Follow") {
                                viewModel.Follow(userName: name)
                            }
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .font(.title2)
                            .buttonStyle(.borderedProminent)
                            .padding(.top, 10)
                        } else {
                            Text("Loading...")
                        }
                        NavigationLink(destination: FollowersView()) {
                            Text("Unfollow")
                                .fontWeight(.thin)
                                .foregroundColor(Color.black)
                            
                        }
                        .font(.title2)
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 5)
                        
                        VStack{
                            //sign out
                            Button("Log Out"){
                                viewModel.logOut()
                            }
                            .tint(.red)
                            .padding()
                        }
                        
                        
                    }
                    .padding()
                    .cornerRadius(25)
                    .padding()
                    .padding()
                    .padding(.bottom, 50)
                    .padding(.top, -400)
                    
                }
            }
            .onChange(of: viewModel.name) { _ in
                // Trigger a view update when the name is fetched
                print("Name fetched:", viewModel.name ?? "")
            }
            .onChange(of: viewModel.bio) { _ in
                // Trigger a view update when the bio is fetched
                print("Bio fetched:", viewModel.bio ?? "")
            }
            .onAppear {
                        viewModel.fetchUser() // Fetch user data when the view appears
                    }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userName: "kate")
    }
}

