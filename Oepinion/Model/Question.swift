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
    var category: Survey.categories?
    
    static let test = Question(title: "Corona Politik", content: "“Wird Ihrer Meinung nach die Coronasituation richtig bewertet und dementsprechend reagiert?", category: .health)
    static let test9 = Question(title: "Corona Politik", content: "Sollten PCR-Tests Ihrer Meinung nach kostenpflichtig/kostenlos werden?", category: .health)
    static let test2 = Question(title:"Öffentliche Verkehrsmittel", content: "Sind sie mit den öffentlichen Verkehrsmitten in Österreich zufrieden?", category: .financial)
    static let test3 = Question(title:"Kostensteigerung", content: "Sind Sie der Meinung, dass die Kostensteigerung aus wirtschaftlicher Sicht gerechtfertigt ist?”", category: .financial)
    static let test4 = Question(title:"Kostensteigerung", content: "“Bedroht die Kostensteigerung Ihre Existenz?”", category: .financial)
    static let test5 = Question(title:"Öffentliche Verkehrsmittel", content: "Wird Ihrer Meinung nach genug getan, um Klimaziele in Zukunft zu erreichen?", category: .environment)
    static let test6 = Question(title:"Wahlen", content: "Ist Ihrer Meinung nach Wählen noch immer gleich relevant wie vor 30 Jahren?", category: .political)
    static let test7 = Question(title:"Lage der Politij", content: "Denken Sie, dass die derzeitige Lage in Österreich von unserer Politik gut gehandhabt wird?", category: .political)
    static let test8 = Question(title:"Einsetzung der Steuergelder", content: "Setzt Ihrer Meinung nach der Staat Steuergelder richtig ein?", category: .political)

    
    enum Answer: String, CaseIterable{
        case yes = "Ja"
        case no = "Nein"
        case neutral = "Neutral"
    }
    
    static let answerIcons = [
        "Ja": "hand.thumbsup.circle.fill",
        "Nein": "hand.thumbsdown.circle.fill",
        "Neutral": "hand.raised.circle.fill"
    ]
    
    
}

struct Option: Identifiable{
    var text: String
    var buttonColor: Color
    var id = UUID()
    
    
}

