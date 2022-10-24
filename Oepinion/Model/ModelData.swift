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
    
    
    @Published var user = User(id: "ABC", imageName: "animal40", isNotificationsEnabled: false, birthdate: Date(), region: "Kärnten", gender: .male)
    
    @Published var userIsLoggedIn = false
    @Published var surveys : [Survey] = [
        Survey(
            id: "12349149102",
            title: "Öffentliche Verkehrsmittel",
            question: "Sind sie mit den öffentlichen Verkehrsmitteln in Österreich zufrieden?",
            category: .transport,
            resultsByGender: ResultByGender.testArray,
            resultsByAge: ResultByAge.testArray
        ),
        Survey(
            id: "293929291",
            title: "Covid Politik",
            question: "Sollten PCR-Tests kostenlos angeboten werden?",
            category: .health,
            resultsByGender: ResultByGender.testArray,
            resultsByAge: ResultByAge.testArray
        ),
            
        Survey(
            id: "3939293392",
            title: "Kostensteigerung",
            question: "Sind Sie der Meinung, dass die Kostensteigerung aus wirtschaftlicher Sicht gerechtfertigt ist?",
            category: .financial,
            resultsByGender: ResultByGender.testArray,
            resultsByAge: ResultByAge.testArray
        ),
        Survey(
            id: "303030303",
            title: "Wahlen",
            question: "Ist Ihrer Meinung nach Wählen noch immer gleich relevant wie vor 30 Jahren?",
            category: .political,
            resultsByGender: ResultByGender.testArray,
            resultsByAge: ResultByAge.testArray
        ),
        Survey(
            id: "33993d3j93",
            title: "Behandlung der Klimaziele",
            question: "Wird Ihrer Meinung nach genug getan, um Klimaziele in Zukunft zu erreichen?",
            category: .environment,
            resultsByGender: ResultByGender.testArray,
            resultsByAge: ResultByAge.testArray
        ),
        Survey(
            id: "12349149102",
            title: "Covid Politik",
            question: "Sollten PCR-Tests Ihrer Meinung nach kostenpflichtig/kostenlos werden?",
            category: .health,
            resultsByGender: ResultByGender.testArray,
            resultsByAge: ResultByAge.testArray
        )
        
    ]
    
    

    
    func loadSurveys(){
        var surveys = [Survey]()
        
        let surveysRef = db.collection("Surveys")
        
    
        surveysRef.getDocuments { snapshot, error in
            if let snapshot = snapshot, error == nil{
                for document in snapshot.documents{
                    
                    if document.exists{
                        let data = document.data()
                        
                        var survey = Survey(fromData: data, withID: document.documentID)
                        
                        if self.userIsLoggedIn{
                            if self.user.answeredSurveys.contains(survey.id){
                                survey.wasAnswered = true
                            }
                        }
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
            key += "F"
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
                    
                    self.user = User(fromData: data, id: id)
                    self.userIsLoggedIn = true
                        
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
        UserDefaults.setValue(user.isNotificationsEnabled, forKey: "isNotificationsEnabled")
        UserDefaults.setValue(user.answeredSurveys, forKey: "answeredSurveys")
        print("user saved locally")
    }
    
    func getUserFromLocalData()->User?{
        
        guard let region = UserDefaults.standard.value(forKey: "region") as? String,
              let birthdate = UserDefaults.standard.value(forKey: "birthdate") as? Date,
              let gender = UserDefaults.standard.value(forKey: "gender") as? Gender,
              let imageName = UserDefaults.standard.value(forKey: "imageName") as? String,
              let isNotificationsEnabled = UserDefaults.standard.value(forKey: "isNotificationsEnabled") as? Bool
        else {
            print("no local user data found")
            return nil
        }
        
        self.user = user
        self.userIsLoggedIn = true
        return User(id: UIDevice().identifierForVendor!.uuidString, imageName: imageName, isNotificationsEnabled: isNotificationsEnabled, birthdate: birthdate, region: region, gender: gender)
        
        
    }
    
    func saveUserAnsweredSurvey(survey: Survey, user:User){
        
        //save to firestore
        let userRef = db.collection("Users").document(user.id!)
        
        userRef.updateData([
            "answeredSurveys" : FieldValue.arrayUnion([survey.id])
        ])
        
        //save in local user object
        self.user.answeredSurveys.append(survey.id)
    }
    func saveSurveyResponse(survey: Survey, user:User, option:Option){
        
        let key = generateSurveyResultsKey(withChosenOption: option, InSurvey: survey, fromUser: user)
       
        let docRef = db.collection("Surveys").document(survey.id)
            
        docRef.updateData([key: FieldValue.increment(1.0)])
        
        self.saveUserAnsweredSurvey(survey: survey, user: self.user)
        
        self.loadSurveys()
        
    }
    
    func saveUserInDatabase(user: User){
        
        var usersRef = db.collection("Users")
        let id = UIDevice().identifierForVendor
        
        usersRef.document(id!.uuidString).updateData(user.getData())
        
        self.user = user
        self.userIsLoggedIn = true
        
    }
    
    func checkForAnsweredSurvey(){
        
        for var survey in surveys{
            if user.answeredSurveys.contains(survey.id){
                survey.wasAnswered = true
            }
        }
    }
    
    
}
