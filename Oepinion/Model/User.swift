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
    var isNotificationsEnabled: Bool
    var birthdate:Date
    var region: String
    var gender:Gender
    var answeredSurveys = [String]()
    
    
    init(id: String, imageName: String,isNotificationsEnabled:Bool, birthdate:Date, region:String, gender:Gender) {
        self.id = id
        self.imageName = imageName
        self.isNotificationsEnabled = isNotificationsEnabled
        self.birthdate = birthdate
        self.region = region
        self.gender = gender
    }
    init(fromData data:[String:Any], id: String) {
        
        self.id = id
        self.imageName = data["imageName"] as? String ?? "animal1"
        self.isNotificationsEnabled = data["isNotificationsEnabled"] as? Bool ?? false
        self.region = data["region"] as? String ?? "n/a"
        self.gender = Gender(rawValue: data["gender"] as? String ?? "Männlich")!
        self.birthdate = data["birthdate"] as? Date ?? Date()
        self.answeredSurveys = data["answeredSurveys"] as? [String] ?? [String]()
        
    }
    func getData()-> [String: Any]{
        return ["imageName" : imageName,
                "isNotificationsEnabled" : isNotificationsEnabled,
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
