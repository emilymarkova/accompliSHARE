//
//  ProfileView.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationStack{
            VStack{
                //sign out
                Button("Log Out"){
                    viewModel.logOut()
                }
                .tint(.red)
                .padding()
            }
            .navigationTitle("Profile")
            
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
