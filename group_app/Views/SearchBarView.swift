////
////  ContentView.swift
////  accompliSHARE1
////
////  Created by Michelle Han on 8/2/23.
////
//
//import SwiftUI
//
//struct SearchBarView: View {
//    @StateObject var viewModel = SearchViewViewModel()
//    @State private var searchText = ""
//    
//
//    var body: some View {
//        NavigationView {
//            let people = viewModel.users
//            VStack {
//                Text("Find Friends")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.top, 90)
//                    .padding(.bottom, 20)
//                
//                TextField("Search...", text: $searchText)
//                    .padding(7)
//                    .background(Color.white)
//                    .cornerRadius(8)
//                    .padding(.horizontal, 10)
//                
//                ScrollView {
//                    VStack(spacing: 10) {
//                        ForEach(people.filter { person in
//                            !searchText.isEmpty && person.lowercased().contains(searchText.lowercased())
//                        }, id: \.self) { person in
//                            HStack{
//                                Text(person)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .padding()
//                                    .background(Color(red: 128/255, green: 185/255, blue: 235/255))
//                                    .cornerRadius(8)
//                                    .foregroundColor(.white)
//                                NavigationLink(destination: ProfileView(userName: person)) {
//                                    Text("Profile")
//                                        .frame(width: UIScreen.main.bounds.width / 4)
//                                        .padding()
//                                        .foregroundColor(.white)
//                                        .background(Color.blue)
//                                        .cornerRadius(10)
//                                }
//                                
//                            }
//                            
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .background(Color(red: 240/255, green: 248/255, blue: 255/255)) // Alice Blue
//            .edgesIgnoringSafeArea(.all) // To make the background color take up the full screen
//        }
//    }
//}
//
//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView()
//    }
//}
