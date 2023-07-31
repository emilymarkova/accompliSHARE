//
//  ToDoListView.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("To-do View")
                    .font(.largeTitle)
                    .fontWeight(.bold)

            }
            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
