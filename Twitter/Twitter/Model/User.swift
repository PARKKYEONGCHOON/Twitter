//
//  User.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/02.
//

import Foundation

struct User: Codable {
    var name: String
    var account: String
    
    
    static var shared = User(name: "ios개발", account: "ios개발")
}
