//
//  User.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 02.10.22.
//

import Foundation

struct User{
    
    var imageName: String
    var isNotificationEnabled: Bool
    var age:Int
    var region: String
    
    static let testUser = User(imageName: "animal1", isNotificationEnabled: true, age: 80, region: "Klagenfurt")
    
    
    
}
