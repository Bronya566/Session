//
//  User.swift
//  Lesson1
//
//  Created by Marcus on 28.02.2021.
//

import Foundation

struct User {
    var name: String
    var imageName: String?
    var groups: [Group]?
    var avatarLikes: Int = 0
    var photos: [String]?
}
