//
//  Group.swift
//  Lesson1
//
//  Created by Marcus on 28.02.2021.
//

import Foundation

struct Group {
    var name: String
    var imageName: String
    var description: String
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
