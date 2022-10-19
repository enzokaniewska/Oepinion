//
//  SurveyResult.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation
import SwiftUI

struct Survey: Codable, Identifiable{
    
    var id:String
    var title: String
    var question:String
    var category:Category
    var results: [String: Int]
    var totalParticipants: Int{
        return results.values.reduce(0, +)
    }
    var wasAnswered = false
    
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
        results:
            ["yes" : 200,
             "neutral" : 240,
             "no" : 123])
}

enum Answer:String{
    case yes = "Ja"
    case no = "Nein"
    case neutral = "Neutral"
}
