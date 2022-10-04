//
//  SurveyResult.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation
import SwiftUI

struct Survey: Identifiable{
    
    var id = UUID()
    
    enum Category:String, CaseIterable, Identifiable{
        var id: Self { self }
        
        case political = "Politik"
        case health = "Gesundheit"
        case transport = "Transport"
        case financial = "Finanzen"
        case education = "Bildung"
        case environment = "Umwelt"
        
        
    }
    
    var question: Question
    let results: [Question.Answer: Int]
    var totalParticipants: Int{
        return results.values.reduce(0, +)
    }
}
