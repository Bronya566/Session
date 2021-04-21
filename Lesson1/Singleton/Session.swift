//
//  SessionViewController.swift
//  Lesson1
//
//  Created by Marcus on 08.04.2021.
//

import UIKit
import Alamofire


class Session {
    
    static var shared : Session = {
        let instance = Session()
        return instance
    }()
    
    private init(){}
    
    var token: String = "" //Хранение токена в VK
    var userId: Int = 0   //Для хранение идентификатора пользователя VK
}







