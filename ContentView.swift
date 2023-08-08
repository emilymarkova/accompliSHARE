//
//  ContentView.swift
//  accompliSHARE1
//
//  Created by Michelle Han on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    let people: [String] = ["Michelle Han", "Emily Markova", "Gnapika Birlangi", "Rachel Yoon", "Alicia Chiang", "Aayushi Garg", "Margot Robbie",  "Taylor Swift", "Dwayne Johnson", "Karlie Kloss"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Find Friends")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 90)
                    .padding(.bottom, 20)

                TextField("Search...", text: $searchText)
                    .padding(7)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 10)

                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(people.filter { person in
                            !searchText.isEmpty && person.lowercased().contains(searchText.lowercased())
                        }, id: \.self) { person in
                            if person == "Karlie Kloss" {
                                NavigationLink(destination: KarlieKlossView1(user: User.MOCK_USERS[9])) {
                                    Text(person)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding()
                                        .background(Color(red: 128/255, green: 185/255, blue: 235/255))
                                        .cornerRadius(8)
                                        .foregroundColor(.white)
                                }
                            } else {
                                Text(person)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(Color(red: 128/255, green: 185/255, blue: 235/255))
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color(red: 240/255, green: 248/255, blue: 255/255))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
