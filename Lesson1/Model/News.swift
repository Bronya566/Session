//
//  News.swift
//  Lesson1
//
//  Created by Marcus on 18.03.2021.
//

import Foundation

struct News {
    var text: String?
    var imageName: String?
    var likes: Int?
    var date: Double?
    
    func getStringDate()-> String {
        let dateFormatter = DateFormatterVK()
        return dateFormatter.convertDate(timeIntervalSince1970: 1625154197)
        
    }
}

struct NewsResponse: Decodable {
    var response: NewsItems
}

struct NewsItems: Decodable {
    var items: [NewsItem]
}

struct NewsItem: Decodable {
    var text: String?
    var attachments: [NewsAttachments]?
    var likes: NewsLikes?
}

struct NewsAttachments: Decodable {
    var photo: NewsPhotoPost?
}

struct NewsPhotoPost: Decodable {
    var sizes: [NewsPhotoPostUrl]?
}

struct NewsPhotoPostUrl: Decodable {
    var url: String?
}

struct NewsLikes: Decodable {
    var count: Int?
}
