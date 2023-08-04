//
//  User.swift
//  group_app
//
//  Created by Emily Markova on 7/31/23.
//

import Foundation

struct User: Codable {
    let id: String
    let bio: String
    let name: String
    let email: String
    let joined: TimeInterval
    let following: Array<String>
    let followers: Array<String>
}
