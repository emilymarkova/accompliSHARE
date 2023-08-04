//
//  User.swift
//  accompliSHARE1
//
//  Created by Rachel Yoon on 8/3/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var fullname: String?
    var bio: String?
    var profileImageUrl: String?
    var username: String?
    var email: String
    var following: Array<String>
    var followers: Array<String>
    var minutesStudied: Int
}


extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, fullname: "Michelle Han", bio: "she/her", profileImageUrl: "flowers-m", email: "a@b.c", following: ["Aayushi Garg"], followers:["Aayushi Garg"], minutesStudied: 15),
        .init(id: NSUUID().uuidString, fullname: "Emily Markova", bio: "she/her", profileImageUrl: "emily", email: "a@b.d", following: ["Rachel Yoon"], followers:["Rachel Yoon"], minutesStudied: 20),
        .init(id: NSUUID().uuidString, fullname: "Gnapika Birlangi", bio: "she/her", profileImageUrl: "dog", email: "a@b.e", following: [], followers:[], minutesStudied: 10),
        .init(id: NSUUID().uuidString, fullname: "Rachel Yoon", bio: "OA 2025, she/her", profileImageUrl: "cookie", email: "a@b.f", following: ["Karlie Kloss", "Emily Markova"], followers:["Karlie Kloss", "Emily Markova"], minutesStudied: 15),
        .init(id: NSUUID().uuidString, fullname: "Alicia Chiang", bio: "she/her", profileImageUrl: "alicia", email: "a@b.g", following: [], followers:[], minutesStudied: 20),
        .init(id: NSUUID().uuidString, fullname: "Aayushi Garg", bio: "she/her", profileImageUrl: "Aayushi", email: "a@b.h", following: ["Michelle Han", "Karlie Kloss"], followers:["Michelle Han"], minutesStudied: 25),
        .init(id: NSUUID().uuidString, fullname: "Margot Robbie", bio: "she/her", profileImageUrl: "barbie", email: "a@b.i", following: ["Michelle Han"], followers:["Michelle Han"], minutesStudied: 25),
        .init(id: NSUUID().uuidString, fullname: "Taylor Swift", bio: "she/her", profileImageUrl: "taylor", email: "a@b.j", following: ["Michelle Han"], followers:["Michelle Han"], minutesStudied: 25),
        .init(id: NSUUID().uuidString, fullname: "Dwayne Johnson", bio: "he/him", profileImageUrl: "rock", email: "a@b.k", following: ["Michelle Han", "Karlie Kloss"], followers:["Michelle Han", "Karlie Kloss"], minutesStudied: 25),
        .init(id: NSUUID().uuidString, fullname: "Karlie Kloss", bio: "American supermodel, 40+ time Vogue cover girl, entrepreneur and philanthropist", profileImageUrl: "karliekloss", email: "a@b.l", following: ["Rachel Yoon", "Karlie Kloss"], followers:["Rachel Yoon", "Emily Markova", "Karlie Kloss"], minutesStudied: 105),
    ]
    
    static func getUserByName(_ name: String) -> User? {
        for user in MOCK_USERS {
            if user.fullname == name {
                return user
            }
        }
        return nil // User not found
    }
}
