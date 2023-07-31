//
//  ContentView.swift
//  navigation
//
//  Created by Emily Markova on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            GalleryView()
                .tabItem{
                    Image(systemName: "person.2")
                }
            ToDoListView()
                .tabItem{
                    Image(systemName: "house")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.fill")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
