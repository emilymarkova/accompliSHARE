//
//  MainTabView.swift
//  accompliSHARE1
//
//  Created by Rachel Yoon on 8/3/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel = ContentViewViewModel()
    @StateObject var timerModel = TimerViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
                .environmentObject(viewModel)
                .environmentObject(timerModel)
            .onAppear {
                print("Account view appeared")
            }
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
//            ToDoListView(userId: viewModel.currentUserId)
            ToDoListView(userId: "15nVZtsUqXSGoA51p4qpPKG3WKn1")
                .tabItem{
                    Label("Home", systemImage:"house")
                }
            GalleryView()
                .tabItem{
                    Label("", systemImage: "globe.asia.australia.fill")
                }
            
            
            ProfileView(user: User.MOCK_USERS[1])
                .tabItem{
                    Label("", systemImage: "person")
                }
            
            
            SearchView()
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
