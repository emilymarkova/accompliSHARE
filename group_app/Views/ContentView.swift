//
//  ContentView.swift
//  navigation
//
//  Created by Emily Markova on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    @StateObject var timerModel = TimerViewViewModel()
    @StateObject var profileViewModel = ProfileViewViewModel(userName: "")
    
    @Environment(\.scenePhase) var phase
    
    @State var lastActiveTimeStamp: Date = Date()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
                .environmentObject(viewModel)
                .environmentObject(timerModel)
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage:"house")
                }
            ProfileView(viewModel: profileViewModel)
                .tabItem{
                    Label("Profile", systemImage:"person.circle")
                }
            StudyView()
                .tabItem{
                    Label("Study", systemImage: "clock")
                }
                .onChange(of: phase) { newValue in
                    if newValue == .background{
                        lastActiveTimeStamp = Date()
                    }
                    if newValue == .active {
                        //finding the difference
                        let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                        if timerModel.totalSeconds - Int(currentTimeStampDiff) <= 0{
                            timerModel.isStarted = false
                            timerModel.totalSeconds = 0
                            timerModel.isFinished = true
                        } else {
                            timerModel.totalSeconds -= Int(currentTimeStampDiff)
                        }
                    }
                }
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass.circle.fill")
                }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
