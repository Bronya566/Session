//
//  SessionViewController.swift
//  Lesson1
//
//  Created by Marcus on 08.04.2021.
//

import UIKit

class Session {
    
    static var session : Session = {
        let instance = Session()
        return instance
    }()
    
    private init(){}
    
    var token: String = "" //Хранение токена в VK
    var userId: Int = 0   //Для хранение идентификатора пользователя VK
    
}




