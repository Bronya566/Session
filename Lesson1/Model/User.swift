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

struct FriendsItems: Decodable {
    var items: [Friends]
}

struct FriendsResponse: Decodable {
    var response: FriendsItems
}

struct Friends: Decodable {
    var first_name: String
    var last_name: String
    var photo: String
    var photo_200_orig: String
}
