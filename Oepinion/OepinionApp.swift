//
//  OepinionApp.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import SwiftUI
import FirebaseCore
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
@main
struct OepinionApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var didPressStartButton = false
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentViewHandler()
                .environmentObject(modelData)
                .onAppear{
                    modelData.loadSurveys()
                    if modelData.getUserFromLocalData() == nil{
                        modelData.fetchUserFromDatabase(withID: UIDevice().identifierForVendor!.uuidString)
                    }
            
                    
                }
            
            
        }
    }
}
