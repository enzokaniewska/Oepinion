//
//  Question.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation
import SwiftUI

struct Question{
    
    var Text: String
    var opinion: Answer?
    
    static let test = Question(Text: "Sind Sie mit der Corona-Politik der letzten Jahre einverstanden?")
    
    enum Answer:String{
        case yes = "Yes"
        case no = "No"
        case neutral = "Neutral"
    }
    
    
}

struct Option: Identifiable{
    var text: String
    var buttonColor: Color
    var id = UUID()
    
    
}

