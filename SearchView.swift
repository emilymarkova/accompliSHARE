//
//  ContentView.swift
//  accompliSHARE1
//
//  Created by Michelle Han on 8/2/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewViewModel()
    @State private var searchText = ""
    @State private var user: User? = nil
    

    var body: some View {
        NavigationView {
            let people = ["Michelle Han", "Emily Markova", "Gnapika Birlangi", "Rachel Yoon", "Alicia Chiang", "Aayushi Garg", "Karlie Kloss"]
            VStack {
                Text("Find Friends")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 90)
                    .padding(.bottom, 20)
                
                TextField("Search...", text: $searchText)
                    .padding(7)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(people.filter { person in
                            !searchText.isEmpty && person.lowercased().contains(searchText.lowercased())
                        }, id: \.self) { person in
                            HStack{
                                Text(person)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(Color(red: 128/255, green: 185/255, blue: 235/255))
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                                if let currentUser = User.getUserByName(person) {
                                    NavigationLink(destination: KarlieKlossView1(user: currentUser)) {
                                        Text("Profile")
                                            .frame(width: UIScreen.main.bounds.width / 4)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color(red: 240/255, green: 248/255, blue: 255/255)) // Alice Blue
            .edgesIgnoringSafeArea(.all) // To make the background color take up the full screen
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
