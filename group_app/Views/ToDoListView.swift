////
////  ToDoListView.swift
////  group_app
////
////  Created by Emily Markova on 7/31/23.
////
//import FirebaseFirestoreSwift
//import SwiftUI
//
//struct ToDoListView: View {
//    @StateObject var viewModel: ToDoListViewViewModel
//    //property wrapper
//    @FirestoreQuery var items: [ToDoListItem]
//
//    init(userId: String){
//        // data is at users/<id>/todos/<entries>
//        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
//        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
//    }
//    var body: some View {
//        NavigationStack{
//            VStack{
//                List(items){item in
//                    ToDoListItemView(item: item)
//                        .swipeActions{
//                            Button("Delete"){
//                                viewModel.delete(id: item.id)
//                            }
//                            .tint(Color.red)
//                        }
//                    
//                }
//                .listStyle(PlainListStyle())
//            }
//            .navigationTitle("To Do List")
//            .toolbar {
//                Button {
//                    viewModel.showingNewItemView = true
//                } label :{
//                    Image(systemName: "plus")
//                }
//            }
//            .sheet(isPresented: $viewModel.showingNewItemView){
//                NewItemView(newItemPresented: $viewModel.showingNewItemView)
//            }
//        }
//        
//    }
//}
//
//struct ToDoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoListView(userId: "GSP2alJhwyc9dvWGpGZ5XTxeNpo1")
//    }
//}
