//
//  Group.swift
//  Lesson1
//
//  Created by Marcus on 28.02.2021.
//

import Foundation
import RealmSwift

@objc class Group: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var imageName: String = ""
    @objc dynamic var descriptionGroup: String = ""
    override init() {
        super.init()
    }
    
    init(name: String, imageName: String, description: String = ""){
        self.name = name
        self.imageName = imageName
        self.descriptionGroup = description
        super.init()
    }
}

struct GroupResponse: Decodable {
    var response: GroupItems
}

struct GroupItems: Decodable {
    var items: [GroupData]
}

struct GroupData: Decodable {
    var name: String
    var photo_50: String
}
