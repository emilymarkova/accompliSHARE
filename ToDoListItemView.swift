//
//  ToDoListItemView.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @State var viewModel = ToDoListItemViewViewModel()
    @StateObject var timerModel = TimerViewViewModel()
    let item: ToDoListItem
    @Environment(\.scenePhase) var phase
    
    @State var lastActiveTimeStamp: Date = Date()
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.title)
                    .bold()
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            
//            Button {
//                viewModel.toggleIsDone(item: item)
//            } label: {
//                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
//                    .foregroundColor(Color.blue)
//            }
            
            NavigationLink(destination: StudyView()) {
//                            Image(systemName: "clock.fill")
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
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id:"123",
                                     title: "get milk",
                                     dueDate: Date().timeIntervalSince1970,
                                     createdDate: Date().timeIntervalSince1970,
                                     isDone: false
                                    ))
    }
}
