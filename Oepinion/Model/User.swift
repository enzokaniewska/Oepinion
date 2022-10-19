//
//  User.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 02.10.22.
//

import Foundation

struct User: Codable{
    
    var id:String?
    var imageName: String
    var isNotificationEnabled: Bool
    var birthdate:Date
    var region: String
    var gender:Gender
  
    func getData()-> [String: Any]{
        return ["imageName" : imageName,
                "isNotificationsEnabled" : isNotificationEnabled,
                "birthdate": birthdate,
                "region": region,
                "gender":gender.rawValue]
    }
    
    func getAge()->Int{
        let now = Date()
        let calendar = Calendar.current

        let ageComponents = calendar.dateComponents([.year], from: self.birthdate, to: now)
        let age = ageComponents.year!
        return age
    }
}

enum Gender:String, CaseIterable,Identifiable, Codable{
    case male = "Männlich"
    case female = "Weiblich"
    case diverse = "Divers"
    
    var id: String { rawValue }
}
