//
//  SurveyResult.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation
import SwiftUI

struct Survey: Identifiable{
    
    var id:String
    var title: String
    var question:String
    var category:Category
    var resultsByGender:[ResultByGender]
    var resultsByAge:[ResultByAge]
    
    var totalParticipants:Int {
        var i = 0
        for result in resultsByGender{
            i += result.count
        }
        return i
    }
    
    var resultsByOptions: [String:Int] {
        var dict = [String:Int]()
        for result in resultsByGender{
            
            if dict[result.answer] == nil{
                dict[result.answer] = result.count
            }else{
                dict[result.answer]! += result.count
            }
        }
        return dict
    }
    
    var wasAnswered = false
    
    
    init(fromData data: [String:Any], withID id: String) {
        
        self.id = id
        self.title = data["title"] as? String ?? "n/a"
        self.question = data["question"] as? String ?? "n/a"
        self.category = Survey.Category(rawValue:  data["category"] as? String ?? "") ?? .health
        
                
        let yesMale = (data["AM_J"] as? Int ?? 0) + (data["BM_J"] as? Int ?? 0) + (data["CM_J"] as? Int ?? 0)
        let yesFemale = (data["AF_J"] as? Int ?? 0) + (data["BF_J"] as? Int ?? 0) + (data["CF_J"] as? Int ?? 0)
        
        resultsByGender = [ResultByGender]()
        resultsByAge = [ResultByAge]()
        
        resultsByGender.append(ResultByGender(answer: "Yes", gender: .male, count: yesMale))
        resultsByGender.append(ResultByGender(answer: "Yes", gender: .female, count: yesFemale))
        
        let noMale = (data["AM_N"] as? Int ?? 0) + (data["BM_N"] as? Int ?? 0) + (data["CM_N"] as? Int ?? 0)
        let noFemale = (data["AF_N"] as? Int ?? 0) + (data["BF_N"] as? Int ?? 0) + (data["CF_N"] as? Int ?? 0)
        
        resultsByGender.append(ResultByGender(answer: "No", gender: .male, count: noMale))
        resultsByGender.append(ResultByGender(answer: "No", gender: .female, count: noFemale))
        
        let neutralMale = (data["AM_X"] as? Int ?? 0) + (data["BM_X"] as? Int ?? 0) + (data["CM_X"] as? Int ?? 0)
        let neutralFemale = (data["AF_X"] as? Int ?? 0) + (data["BF_X"] as? Int ?? 0) + (data["CF_X"] as? Int ?? 0)
        
        resultsByGender.append(ResultByGender(answer: "Neutral", gender: .male, count: neutralMale))
        resultsByGender.append(ResultByGender(answer: "Neutral", gender: .female, count: neutralFemale))
        
        let yesGroupA = (data["AM_J"] as? Int ?? 0) + (data["AF_J"] as? Int ?? 0)
        let noGroupA = (data["AM_N"] as? Int ?? 0) + (data["AF_N"] as? Int ?? 0)
        let neutralGroupA = (data["AM_X"] as? Int ?? 0) + (data["AF_X"] as? Int ?? 0)
        let yesGroupB = (data["BM_J"] as? Int ?? 0) + (data["BF_J"] as? Int ?? 0)
        let noGroupB = (data["BM_N"] as? Int ?? 0) + (data["BF_N"] as? Int ?? 0)
        let neutralGroupB = (data["BM_X"] as? Int ?? 0) + (data["BF_X"] as? Int ?? 0)
        let yesGroupC = (data["CM_J"] as? Int ?? 0) + (data["CF_J"] as? Int ?? 0)
        let noGroupC = (data["CM_N"] as? Int ?? 0) + (data["CF_N"] as? Int ?? 0)
        let neutralGroupC = (data["CM_X"] as? Int ?? 0) + (data["CF_X"] as? Int ?? 0)
        
        resultsByAge.append(ResultByAge(answer: "Yes", ageGroup: .groupA, count: yesGroupA))
        resultsByAge.append(ResultByAge(answer: "No", ageGroup: .groupA, count: noGroupA))
        resultsByAge.append(ResultByAge(answer: "Neutral", ageGroup: .groupA, count: neutralGroupA))
        resultsByAge.append(ResultByAge(answer: "Yes", ageGroup: .groupB, count: yesGroupB))
        resultsByAge.append(ResultByAge(answer: "No", ageGroup: .groupB, count: noGroupB))
        resultsByAge.append(ResultByAge(answer: "Neutral", ageGroup: .groupB, count: neutralGroupB))
        resultsByAge.append(ResultByAge(answer: "Yes", ageGroup: .groupC, count: yesGroupC))
        resultsByAge.append(ResultByAge(answer: "No", ageGroup: .groupC, count: noGroupC))
        resultsByAge.append(ResultByAge(answer: "Neutral", ageGroup: .groupC, count: neutralGroupC))
        
        
        
    }
    
    init(id:String, title:String, question:String, category:Category, resultsByGender:[ResultByGender], resultsByAge: [ResultByAge]){
        self.id = id
        self.title = title
        self.question = question
        self.category = category
        self.resultsByGender = resultsByGender
        self.resultsByAge = resultsByAge
            
    }
    
    enum Category:String, CaseIterable, Codable, Identifiable{
        var id: Self { self }
        
        case political = "Politik"
        case health = "Gesundheit"
        case transport = "Transport"
        case financial = "Finanzen"
        case education = "Bildung"
        case environment = "Umwelt"
        
        
    }
    

    
    
    static let test = Survey(
        id: "12349149102",
        title: "Öffentliche Verkehrsmittel",
        question: "Sind sie mit den öffentlichen Verkehrsmitteln in Österreich zufrieden?",
        category: .transport,
        resultsByGender: ResultByGender.testArray,
        resultsByAge: ResultByAge.testArray
    )
}

enum Answer:String{
    case yes = "Ja"
    case no = "Nein"
    case neutral = "Neutral"
}
