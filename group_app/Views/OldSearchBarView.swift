////
////  SearchBar.swift
////  group_app
////
////  Created by Michelle Han on 8/2/23.
////
//
//
//import SwiftUI
//
//struct SearchBarView: View {
//    @State private var searchText = ""
//
//    let people: [String] = ["Michelle Han", "Emily Markova", "Gnapika Birlangi", "Rachel Yoon", "Alicia Chiang", "Aayushi Garg", "Margot Robbie",  "Taylor Swift", "Dwayne Johnson", "Karlie Kloss"]
//
//    var body: some View {
//        VStack {
//            Text("Find Friends")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.top, 90)
//                .padding(.bottom, 20)
//
//            TextField("Search...", text: $searchText)
//                .padding(7)
//                .background(Color.white)
//                .cornerRadius(8)
//                .padding(.horizontal, 10)
//
//            ScrollView {
//                VStack(spacing: 10) {
//                    ForEach(people.filter { person in
//                        !searchText.isEmpty && person.lowercased().contains(searchText.lowercased())
//                    }, id: \.self) { person in
//                        Text(person)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding()
//                            .background(Color(red: 128/255, green: 185/255, blue: 235/255))
//                            .cornerRadius(8)
//                            .foregroundColor(.white)
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//        .background(Color(red: 240/255, green: 248/255, blue: 255/255))
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView()
//    }
//}
