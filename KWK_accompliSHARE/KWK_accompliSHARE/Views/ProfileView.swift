//
//  ProfileView.swift
//  accompliSHARE1
//
//  Created by Rachel Yoon on 8/3/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewViewModel// = ProfileViewViewModel(user: User.MOCK_USERS[1])
    let user: User
    init(user: User) {
        self.user = user
                self._viewModel = StateObject(wrappedValue: ProfileViewViewModel(user: user))
        }
    @State private var showEditProfile = false
    @State private var showAccomplishments = true
    @State private var showFollowers = false
    @State private var showFollowing = false

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        
        VStack {
            Text("Profile")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            Divider()
            
            ScrollView {
                
                VStack {
                    //Name and Pronouns
                    HStack {
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100.0, height: 100.0)
                            .clipShape(Circle())
                            .padding(.top, 10.0)
                        
                        VStack (alignment: .leading, spacing: 5.0) {
                            if let fullname = user.fullname {
                                Text(fullname)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            
                            if let bio = user.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        Button(action: {
                            showEditProfile.toggle()
                        }) {
                            Text("Edit")
                                .foregroundColor(Color.black)
                                .frame(width: 40, height: 32)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray, lineWidth:1))
                        }
                        
                    }
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, 50.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 20.0)
                    
                    //Followers
                    UserStatView(value: 5, digit: "", title: "Followers")
                    
                    HStack {
                        Image("dog")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("flowers-m")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("cookie")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("alicia")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("Aayushi")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            
                    }
                    
                    
                    Button("More") {
                        showFollowers.toggle()
                    }
                    
                    .padding(.bottom, 20.0)
                    
                    //Following
                    UserStatView(value: 7, digit: "", title: "Following")
                    
                    HStack {
                        Image("dog")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("flowers-m")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("cookie")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("taylor")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding([.trailing], 5.0)
                        Image("rock")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                    //button
                    Button("More") {
                        showFollowing.toggle()
                    }
                    
                    
                    .padding(.bottom, 50.0)
                    
                    //Accomplishments scroll page
                    
                    if showAccomplishments {
                        HStack {
                            Text("Accomplishments")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.horizontal, 50.0)
                        
                        
                        //Accomplishment gridview
                        
                        LazyVGrid(columns: gridItems) {
                            ForEach(0 ... 15, id: \.self) {index in
                                Image("mathhw")
                                    .resizable()
                                    .frame(width: 123.0, height: 123.0)
                                    .scaledToFill()
                            }
                        }
                    }
                    
                }
                
                
                .fullScreenCover(isPresented:  $showEditProfile) {
                    EditProfileView(user: user)
                }
                
                .fullScreenCover(isPresented:  $showFollowers) {
                    FollowersView()
                }
                
                .fullScreenCover(isPresented:  $showFollowing) {
                    FollowingView()
                }
                VStack{
                    //sign out
                    Button("Log Out"){
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                }
        }
        
        
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView(user: User.MOCK_USERS[1])
        }
    }
}

