//
//  ProfileView.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileView = ToDoListViewViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Text("Profile View")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .toolbar {
            Button {
                //action
            } label :{
                Image(systemName: "plus")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}