//
//  Extensions.swift
//  group_app
//
//  Created by Emily Markova on 8/1/23.
//

import Foundation

//write an extension to encode the data
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            //if you fail encoding, return an empty dictionary
            return [:]
        }
        do {
            //if you are able to encode the string
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        } catch {
            //in case of an error...
            return [:]
        }
    }
}
