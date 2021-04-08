//
//  TestsData.swift
//  Lesson1
//
//  Created by Marcus on 02.03.2021.
//

import Foundation

class TestsData {
    
    static func testsGroup() -> [Group] {
        var groups: [Group] = []
        groups.append(Group(name: "MDK",
                            imageName: "square.and.arrow.up.on.square",
                            description: ""))
        groups.append(Group(name: "ORLENOK",
                            imageName: "person.crop.square.fill",
                            description: ""))
        groups.append(Group(name: "MSK",
                            imageName: "person.crop.circle.fill",
                            description: ""))
        return groups
    }
    
    static func testsManyGroups() -> [Group] {
    var groups: [Group] = []
    groups.append(Group(name: "ASCONA",
                        imageName: "square.and.arrow.up.on.square",
                        description: ""))
    groups.append(Group(name: "POTOLOK MSK",
                        imageName: "square.and.arrow.up.on.square",
                        description: ""))
    groups.append(Group(name: "MSK-TVER'",
                        imageName: "person.crop.square.fill",
                        description: ""))
    groups.append(Group(name: "PITER",
                        imageName: "person.fill.questionmark.rtl",
                        description: ""))
    groups.append(Group(name: "SMOLENSK",
                        imageName: "square.and.arrow.up.on.square",
                        description: ""))
    return groups
    }
    
    static func testsFriends()-> [User] {
        var friends: [User] = []
        friends.append(User(name: "VASYA PUPKIN", imageName: "square.and.arrow.up.on.square", groups: nil, avatarLikes: 54, photos: ["trash", "doc","lasso"]))
        friends.append(User(name: "VASYLYI UTKIN", imageName: "person.crop.square.fill", groups: nil, avatarLikes: 100, photos: ["moon", "moon.fill"]))
        friends.append(User(name: "PONCHIK ZAVARNOY", imageName: "person.crop.circle.fill", groups: nil, avatarLikes: 154, photos: ["pencil", "book"]))
        friends.append(User(name: "KOLYA VASECHKIN", imageName: "square.and.arrow.up.on.square", groups: nil, avatarLikes: 54, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "ARTEM ARTEMIEV", imageName: "person.crop.square.fill", groups: nil, avatarLikes: 100, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "BOBO SERGEICH", imageName: "person.crop.circle.fill", groups: nil, avatarLikes: 154, photos: ["pencil", "book"]))
        friends.append(User(name: "SERGEY PUPOCHKIN", imageName: "square.and.arrow.up.on.square", groups: nil, avatarLikes: 54, photos: ["trash", "doc","lasso"]))
        friends.append(User(name: "DMITRIY PESKOV", imageName: "person.crop.square.fill", groups: nil, avatarLikes: 100,  photos: ["moon", "moon.fill"]))
        friends.append(User(name: "ALLO ALLOVICH", imageName: "person.crop.circle.fill", groups: nil, avatarLikes: 154, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "KOT KOTOVICH", imageName: "square.and.arrow.up.on.square", groups: nil, avatarLikes: 54, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "DOG DOGOVICH", imageName: "person.crop.square.fill", groups: nil, avatarLikes: 100, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "UTKA UTOCHKIN", imageName: "person.crop.circle.fill", groups: nil, avatarLikes: 154, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "KOTIK KOTIKOVICH", imageName: "square.and.arrow.up.on.square", groups: nil, avatarLikes: 54, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "PAVEL PAVLOVICH", imageName: "person.crop.square.fill", groups: nil, avatarLikes: 100, photos: ["folder", "moon.fill", "sunset"]))
        friends.append(User(name: "UTOCHKA UTOCHKINA", imageName: "person.crop.circle.fill", groups: nil, avatarLikes: 154,photos: ["folder", "moon.fill", "sunset"]))
        return friends
    }
    
    static func testsNews() -> [News] {
        var news: [News] = []
        news.append(News(text:"New news", imageName:"person.crop.square.fill"))
        news.append(News(text:"Second news", imageName:"pencil"))
        news.append(News(text:"Third very very very important news", imageName:"lasso"))
        news.append(News(text:"Bad news", imageName:"trash"))
        return news
    }
}
