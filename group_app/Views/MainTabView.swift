//
//  MainTabView.swift
//  accompliSHARE1
//
//  Created by Rachel Yoon on 8/3/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            
            Text("Main Page")
                .tabItem{
                    Label("", systemImage: "house")
                }
            
            
            GalleryView()
                .tabItem{
                    Label("", systemImage: "globe.asia.australia.fill")
                }
            
            
            ProfileView(user: User.MOCK_USERS[1])
                .tabItem{
                    Label("", systemImage: "person")
                }
            
            
            ContentView()
                .tabItem{
                    Label("", systemImage: "magnifyingglass")
                }
            
            
        }
        .accentColor(.purple)
    }
    
    struct MainTabView_Previews: PreviewProvider {
        static var previews: some View {
            MainTabView()
        }
    }
}
