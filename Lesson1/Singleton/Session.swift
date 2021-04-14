//
//  SessionViewController.swift
//  Lesson1
//
//  Created by Marcus on 08.04.2021.
//

import UIKit
import Alamofire


class Session {
    
    static var session : Session = {
        let instance = Session()
        return instance
    }()
    
    private init(){}
    
    var token: String = "" //Хранение токена в VK
    var userId: Int = 0   //Для хранение идентификатора пользователя VK
    
//    func vk() {
//    // создаем URL из строки
//            let url = URL(string: https://oauth.vk.com/authorize?client_id=1&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.130&state=123456)
//            
//    // сессия по умолчанию
//            let session = URLSession.shared
//            
//    // задача для запуска
//            let task = session.dataTask(with: url!) { (data, response, error) in
//    // в замыкании данные, полученные от сервера, мы преобразуем в json
//                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
//    // выводим в консоль
//                print(json)
//            }
//    // запускаем задачу
//            task.resume()
//    
//    }
    
}







