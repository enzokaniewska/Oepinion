//
//  SurveyResult.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation

struct SurveyResult: Identifiable{
    
    let answers: [Question.Answer: Int]
    var id = UUID()
    
    static let test = SurveyResult(answers:
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
