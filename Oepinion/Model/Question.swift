//
//  Question.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Foundation
import SwiftUI

struct Question{
    
    var title:String
    var content: String
    var opinion: Answer?
    var category: Survey.Category?
    
    
    enum Answer: String, CaseIterable{
        case yes = "Ja"
        case no = "Nein"
        case neutral = "Neutral"
    }
    
    
    
    
}

struct Option: Identifiable{
    var text: String
    var buttonColor: Color
    var id = UUID()
    
    
    
}

