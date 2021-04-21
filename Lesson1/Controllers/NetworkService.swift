//
//  NetworkService.swift
//  Lesson1
//
//  Created by Marcus on 21.04.2021.
//

import Foundation
import Alamofire

class NetworkService {
    func vkFriends(handler: @escaping ([User]) -> Void) {
        var friends: [User] = []
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
                urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.shared.userId)),
            URLQueryItem(name: "order", value:  "name"),
            URLQueryItem(name: "count", value:  "20"),
            URLQueryItem(name: "fields", value:  "name, photo, photo_200_orig"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: urlComponents.url!)

        Alamofire.request(request).response { data in
            do {
                let json = try JSONDecoder().decode(FriendsResponse.self, from: data.data!) as FriendsResponse
                    print(json)
                json.response.items.forEach {
                    var item = User(name: $0.first_name + " " + $0.last_name)
                    item.imageName = $0.photo
                    item.photos = [$0.photo_200_orig]
                    friends.append(item)
                }
            }
            catch {
                print(error)
            }
            handler(friends)
        }
    }
    
    func vkFriendsGroup(handler: @escaping ([Group]) -> Void) {
        var groups: [Group] = []
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
                urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.shared.userId)),
            URLQueryItem(name: "extended", value:  "1"),
            URLQueryItem(name: "fields", value:  "description"),
            URLQueryItem(name: "count", value:  "20"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.130")
        ]
        let request = URLRequest(url: urlComponents.url!)

        Alamofire.request(request).response { data in
            do {
                let json = try JSONDecoder().decode(GroupResponse.self, from: data.data!) as GroupResponse
                    print(json)
                json.response.items.forEach {
                    let item = Group(name: $0.name, imageName: $0.photo_50, description: "")
                    groups.append(item)
                }
            }
            catch {
                print(error)
            }
            handler(groups)
        }
    }
    
    func vkFriendsGroupSerch() {
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
                urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            
            URLQueryItem(name: "q", value:  "Music"),
            URLQueryItem(name: "count", value:  "20"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: urlComponents.url!)
        Alamofire.request(request).response { data in
            print(data)
            print("")
        }
    }
}
