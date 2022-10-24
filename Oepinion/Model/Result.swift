//
//  Result.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 20.10.22.
//

import Foundation

struct ResultByGender: Identifiable{
    let id = UUID()
    let answer: String
    let gender:Gender
    let count: Int
    
    static let testArray = [
        ResultByGender(
            answer: "Ja",
            gender: .male,
            count: 200
        ),
        ResultByGender(
            answer: "Ja",
            gender: .female,
            count: 70
        ),
        ResultByGender(
            answer: "Neutral",
            gender: .male,
            count: 150
        ),
        ResultByGender(
            answer: "Neutral",
            gender: .female,
            count: 140
        ),
        ResultByGender(
            answer: "Nein",
            gender: .male,
            count: 180
        ),
        ResultByGender(
            answer: "Nein",
            gender: .female,
            count: 100
        )
    ]
}

struct ResultByAge: Identifiable{
    let id = UUID()
    let answer: String
    let ageGroup: AgeGroup
    let count: Int
    
    static let testArray = [
        ResultByAge(
            answer: "Ja",
            ageGroup: .groupA,
            count: 100
        ),
        ResultByAge(
            answer: "Nein",
            ageGroup: .groupA,
            count: 100
        ),
        ResultByAge(
            answer: "Neutral",
            ageGroup: .groupA,
            count: 100
        ),
        ResultByAge(
            answer: "Ja",
            ageGroup: .groupB,
            count: 100
        ),
        ResultByAge(
            answer: "Nein",
            ageGroup: .groupB,
            count: 100
        ),
        ResultByAge(
            answer: "Neutral",
            ageGroup: .groupB,
            count: 100
        ),
        ResultByAge(
            answer: "Ja",
            ageGroup: .groupC,
            count: 100
        ),
        ResultByAge(
            answer: "Nein",
            ageGroup: .groupC,
            count: 100
        ),
        ResultByAge(
            answer: "Neutral",
            ageGroup: .groupC,
            count: 100
        )
    
    ]
    
}

enum AgeGroup:String {
    case groupA = "Gruppe A"
    case groupB = "Gruppe B"
    case groupC = "Gruppe C"
}
