//
//  User.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 03/12/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    let username: String
    let profileImafeUrl: String?
    let bio: String?
}
