//
//  ToDoListItem.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    //let is immutable while var is mutable
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
