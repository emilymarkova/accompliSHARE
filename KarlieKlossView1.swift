//
//  KarlieKlossView1.swift
//  accompliSHARE1
//
//  Created by Gnapika Birlangi on 8/2/23.
//

import SwiftUI

struct KarlieKlossView1: View {
    @State private var buttonText = "Follow"
    
    let user: User
    
    var body: some View {
    
        VStack {
            
            if let fullname = user.fullname {
                Text(fullname)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
            }
            
            Divider()
            
            ScrollView {
                VStack {
                    HStack {
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100.0, height: 100.0)
                            .clipShape(Circle())
                        
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

                            if let minutesStudied = user.minutesStudied {
                                Text("Mintues studied: \(minutesStudied)")
                                    .font(.footnote)
                            }
                            
                        }
                        .frame(alignment: .leading)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.all)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4){
                            if let followerCount = user.followers.count {
                                if user.fullname != "Karlie Kloss"{
                                    UserStatView(value: followerCount, digit: "", title: "Followers")
                                } else {
                                    UserStatView(value: followerCount, digit: "M", title: "Followers")
                                }
                            }
                            if let followingCount = user.following.count {
                                UserStatView(value: followingCount, digit: "", title: "Following")
                            }
                        }
                        
                        Button {
                            if(self.buttonText == "Follow"){
                                self.buttonText = "Following"
                            } else {
                                self.buttonText = "Follow"
                            }
                           
                        } label: {
                            Text(self.buttonText)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 125, height: 32)
                                .background(Color(.systemBlue))
                                .foregroundColor(.white)
                                .cornerRadius(6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(.clear, lineWidth: 1))
                        }
                        .padding(.trailing, 30)
                    }
                    
                    
                }
            }
            .background(Color(red: 240/255, green: 248/255, blue: 255/255))
        }
    }
}

struct KarlieKlossView1_Previews: PreviewProvider {
    static var previews: some View {
        KarlieKlossView1(user: User.MOCK_USERS[6])
    }
}
