//
//  SurveyResult.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation
import SwiftUI

struct Survey: Identifiable{
    
    enum categories:String, CaseIterable{
        case political = "Politik"
        case health = "Gesundheit"
        case transport = "Transport"
        case financial = "Finanzen"
        case education = "Bildung"
        case environment = "Umwelt"
    }
    
    static let categoryList: [Survey.categories] = [
        .political,
        .transport,
        .education,
        .environment,
        .health,
        .financial
    ]
    
    
    
    public static let testList = [
        Survey(question: Question.test2,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test3,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test4,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test5,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test6,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test7,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test8,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test9,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300])
    ]
                           
    
    var question: Question
    let answers: [Question.Answer: Int]
    var id = UUID()
    var isBurning = false
    
    static let test = Survey(question: Question.test,
                                   answers:
                                    [.yes: 400,
                                     .no: 1000,
                                     .neutral: 300])
    
    var totalParticipants: Int{
        
        var i = 0
        for answer in answers{
            i = i + answer.value
        }
        return i
    }
}
