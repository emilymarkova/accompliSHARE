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
                
                Text("Karlie Kloss")
                .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
            
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
                            
                        }
                        .frame(alignment: .leading)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.all)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4){
                            UserStatView(value: 12, digit: "M", title: "Followers")
                            
                            UserStatView(value: 5, digit: "", title: "Following")
                        }
                        
                        Button {
                            self.buttonText = "Following"
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
        KarlieKlossView1(user: User.MOCK_USERS[9])
    }
}
