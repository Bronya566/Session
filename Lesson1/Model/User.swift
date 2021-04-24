//
//  User.swift
//  Lesson1
//
//  Created by Marcus on 28.02.2021.
//

import Foundation
import RealmSwift



@objc class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var imageName: String?
    var groups: [Group]?
    @objc dynamic var avatarLikes: Int = 0
    var photos: [String]?
    
    override init() {
        super.init()
    }
    
    init(name: String, imageName: String? = "", groups: [Group]? = [], avatarLikes: Int = 0, photos: [String]? = []) {
    self.name = name
    self.imageName = imageName
        self.groups = groups
        self.avatarLikes = avatarLikes
        self.photos = photos
        super.init()
    }
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
