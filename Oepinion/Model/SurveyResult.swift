//
//  SurveyResult.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation

struct Survey: Identifiable{
    
    enum categories:String{
        case political = "Politik"
        case health = "Gesundheit"
        case transport = "Transport"
        case financial = "Finanzen"
        case education = "Bildung"
        case environment = "Umwelt"
    }
    static let categoryIcons = [
        categories.political : "",
        categories.health : "heart.fill",
        categories.transport: "car.fill",
        categories.financial: "banknote.fill",
        categories.environment: "leaf.fill",
        categories.education: "book.fill"
    ]
    public static let testList = [
        Survey(question: Question.test,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
        Survey(question: Question.test,
               answers: [.yes: 400,
                         .no: 1000,
                         .neutral: 300]),
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
