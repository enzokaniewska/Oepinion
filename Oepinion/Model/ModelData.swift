//
//  ModelData.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 04.10.22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import UIKit

final class ModelData: ObservableObject{
    
    let db = Firestore.firestore()
    
    
    @Published var user = User(imageName: "animal1", isNotificationEnabled: false, birthdate: Date(), region: "Kärnten", gender: .male)
    @Published var userIsLoggedIn = false
    @Published var surveys : [Survey] = [
        Survey(
            id: "12349149102",
            title: "Öffentliche Verkehrsmittel",
            question: "Sind sie mit den öffentlichen Verkehrsmitteln in Österreich zufrieden?",
            category: .transport,
            results:
                ["yes" : 200,
                 "neutral" : 240,
                 "no" : 123],
            wasAnswered: true),
        Survey(
            id: "293929291",
            title: "Covid Politik",
            question: "Sollten PCR-Tests kostenlos angeboten werden?",
            category: .health,
            results:
                ["yes" : 200,
                 "neutral" : 240,
                 "no" : 123]),
        Survey(
            id: "3939293392",
            title: "Kostensteigerung",
            question: "Sind Sie der Meinung, dass die Kostensteigerung aus wirtschaftlicher Sicht gerechtfertigt ist?",
            category: .financial,
            results:
                ["yes" : 200,
                 "neutral" : 240,
                 "no" : 123],
            wasAnswered: true),
        Survey(
            id: "303030303",
            title: "Wahlen",
            question: "Ist Ihrer Meinung nach Wählen noch immer gleich relevant wie vor 30 Jahren?",
            category: .political,
            results:
                ["yes" : 200,
                 "neutral" : 240,
                 "no" : 123]),
        Survey(
            id: "33993d3j93",
            title: "Behandlung der Klimaziele",
            question: "Wird Ihrer Meinung nach genug getan, um Klimaziele in Zukunft zu erreichen?",
            category: .environment,
            results:
                ["yes" : 200,
                 "neutral" : 240,
                 "no" : 123]),
        Survey(
            id: "12349149102",
            title: "Covid Politik",
            question: "Sollten PCR-Tests Ihrer Meinung nach kostenpflichtig/kostenlos werden?",
            category: .health,
            results:
                ["yes" : 200,
                 "neutral" : 240,
                 "no" : 123])
        
    ]
    
    static var testUser = User(imageName: "animal1", isNotificationEnabled: false, birthdate: Date(), region: "Kärnten", gender: .male)

    
    func loadSurveys(){
        var surveys = [Survey]()
        
        let surveysRef = db.collection("Surveys")
        
    
        surveysRef.getDocuments { snapshot, error in
            if let snapshot = snapshot, error == nil{
                for document in snapshot.documents{
                    
                    if document.exists{
                        let data = document.data()
                        let title = data["title"] as? String ?? "n/a"
                        let question = data["question"] as? String ?? "n/a"
                        let results = data["results"] as? [String:Int] ?? [String:Int]()
                        let category = Survey.Category(rawValue:  data["category"] as? String ?? "") ?? .health
                        
                        let survey = Survey(id: document.documentID,
                                            title: title,
                                            question: question,
                                            category: category,
                                            results: results)
                        surveys.append(survey)
                    }
                    
                }
                self.surveys = surveys
            }
        }
        
        
        
    }
    
  
    func generateSurveyResultsKey(withChosenOption option: Option, InSurvey:Survey, fromUser user:User) -> String{
        
        var key = ""
        
        //adding character for age group
        if user.getAge() <= 24{
            key += "A"
        }
        else if user.getAge() > 24 && user.getAge() < 45{
            key += "B"
        }
        else if user.getAge() >= 45{
            key += "C"
        }
        
        //adding character for gender
        //diverse is added to either male or female on a randomized basis
        if user.gender == .male{
            key += "M"
        }else if user.gender == .female{
            key += "W"
        }else if user.gender == .diverse{
            key += Int.random(in: 0...3) >= 2 ? "M" : "W"
        }
        
        //adding character that identifies the chosen option
        switch option.text {
        case "Ja":
            key += "_J"
        case "Nein":
            key += "_N"
        default:
            key += "_X"
        }
        
        return key
    }
    func loadSurveyForID(surveyID: String ){
        
        
    }
    
    
    func fetchUserFromDatabase(withID id: String){
        
        let userRef = db.collection("Users").document(id)
        
        
        userRef.getDocument { snapshot, error in
            if let snapshot = snapshot, error == nil{
                let data = snapshot.data()
                if let data = data{
                    let imageName = data["imageName"] as? String ?? "animal1"
                    let isNotificationsEnabled = data["isNotificationsEnabled"] as? Bool ?? false
                    let region = data["region"] as? String ?? "n/a"
                    let gender = Gender(rawValue: data["gender"] as? String ?? "Männlich")!
                    let birthDate = data["birthdate"] as? Date ?? Date()
                    
                    self.userIsLoggedIn = true
                    self.user = User(
                        id: id,
                        imageName: imageName,
                        isNotificationEnabled: isNotificationsEnabled,
                        birthdate: birthDate,
                        region: region,
                        gender: gender
                    )
                }else if !snapshot.exists{
                    print("There is no user in firestore")
                }
                
                
                
                
            }else{
                print(error)
            }
                
        }
        
    }
    
    func saveUserOnDevice(user:User){
        
        UserDefaults.setValue(user.region, forKey: "region")
        UserDefaults.setValue(user.birthdate, forKey: "birthdate")
        UserDefaults.setValue(user.gender, forKey: "gender")
        UserDefaults.setValue(user.imageName, forKey: "imageName")
        UserDefaults.setValue(user.isNotificationEnabled, forKey: "isNotificationsEnabled")
        
        print("user saved locally")
    }
    
    func getUserFromLocalData()->User?{
        
        let region = UserDefaults.value(forKey: "region") as? String
        let birthdate = UserDefaults.value(forKey: "birthdate") as? Date
        let gender = UserDefaults.value(forKey: "gender") as? Gender
        let imageName = UserDefaults.value(forKey: "imageName") as? String
        let isNotificationsEnabled = UserDefaults.value(forKey: "isNotificationsEnabled") as? Bool
        
        if region == nil || birthdate == nil || gender == nil || imageName == nil || isNotificationsEnabled == nil{
            return nil
        }
        
        self.user = user
        self.userIsLoggedIn = true
        return User(id: UIDevice().identifierForVendor?.uuidString, imageName: imageName!, isNotificationEnabled: isNotificationsEnabled!, birthdate: birthdate!, region: region!, gender: gender!)
        
        
    }
    
    func saveUserAnsweredSurvey(survey: Survey, user:User){
        let userRef = db.collection("Users").document(user.id!)
        
        userRef.updateData([
            "answeredSurveys" : FieldValue.arrayUnion([survey.id])
        ])
    }
    func saveSurveyResponse(survey: Survey, user:User, option:Option){
        
        let key = generateSurveyResultsKey(withChosenOption: option, InSurvey: survey, fromUser: user)
       
        let docRef = db.collection("Surveys").document(survey.id)
            
        docRef.updateData([key: FieldValue.increment(1.0)])
        
    }
    
    func saveUserInDatabase(user: User) -> String{
        
        var usersRef = db.collection("Users")
        let id = UIDevice().identifierForVendor
        
        usersRef.document(id!.uuidString).setData(user.getData())
        
        self.user = user
        self.userIsLoggedIn = true
        return id!.uuidString
        
    }
    
    
}
