//
//  NetworkService.swift
//  Lesson1
//
//  Created by Marcus on 21.04.2021.
//

import Foundation
import Alamofire
import RealmSwift

class NetworkService {
    func vkFriends(handler: @escaping ([User]) -> Void) {
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

        Alamofire.request(request).response { [weak self] data in
            do {
                let json = try JSONDecoder().decode(FriendsResponse.self, from: data.data!) as FriendsResponse
                    print(json)
                json.response.items.forEach {
                    let item = User(name: $0.first_name + " " + $0.last_name)
                    item.imageName = $0.photo
                    item.photos = [$0.photo_200_orig]
                    self?.useRealm(name: item.name, imageName: item.imageName, groups: [], avatarLikes: item.avatarLikes, photos: item.photos )
                }
            }
            catch {
                print(error)
            }
            
            handler(self?.loadUser() ?? [])
        }
    }
    
    func vkFriendsGroup(handler: @escaping ([Group]) -> Void) {
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

        Alamofire.request(request).response { [weak self] data in
            do {
                let json = try JSONDecoder().decode(GroupResponse.self, from: data.data!) as GroupResponse
                    print(json)
                json.response.items.forEach {
                    let item = Group(name: $0.name, imageName: $0.photo_50)
                    self?.useRealmGroup(name: item.name, imageName: item.imageName, descriptionGroup: item.description)
                }
            }
            catch {
                print(error)
            }
            handler(self?.loadGroup() ?? [])
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
    
    
    func vkNewsPost(handler: @escaping ([News]) -> Void){
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
                urlComponents.path = "/method/newsfeed.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.shared.userId)),
            URLQueryItem(name: "filters", value:  "post"),
            URLQueryItem(name: "start_time", value: "162515419"),
            URLQueryItem(name: "count", value:  "5"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        let request = URLRequest(url: urlComponents.url!)
        var news: [News] = []
        print(request)
        Alamofire.request(request).response { data in
            do {
                let json = try JSONDecoder().decode(NewsResponse.self, from: data.data!) as NewsResponse
                    print(json)
                json.response.items.forEach { item in
                    print(item)
                    let item = News(text: item.text, imageName: item.attachments?[0].photo?.sizes?[0].url, likes: item.likes?.count)
                    news.append(item)
                }
            }
            catch {
                print(error)
            }
            handler(news)
        }
    }
 
    func useRealm(name: String, imageName: String? = "", groups: [Group]? = [], avatarLikes: Int = 0, photos: [String]? = []) {
        let userName = User(name: name, imageName: imageName, groups: groups, avatarLikes: avatarLikes, photos: photos)
        
        let realm = try! Realm()
        try? realm.write {
            realm.add([userName])
        }
    }
    
    func loadUser() -> [User] {
        var friends: [User] = []
        do {
            let realm = try Realm()
            let users = realm.objects(User.self)
            friends = users.map { $0 }
        } catch {
            print(error)
        }
        return friends
    }
    
    
    func useRealmGroup(name: String, imageName: String, descriptionGroup: String ) {
        let userGroup = Group(name: name, imageName: imageName, description: descriptionGroup)
        
        let realm = try! Realm()
        
        try? realm.write {
            realm.add([userGroup])
        }
    }
    
    func loadGroup() -> [Group] {
        var groups: [Group] = []
        do {
            let realm = try Realm()
            let models = realm.objects(Group.self)
            groups = models.map { $0 }
        } catch {
            print(error)
        }
        return groups
    }
    
    func deleteRealm() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error)
        }
    }
    
    
}
