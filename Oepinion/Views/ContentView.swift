//
//  ContentView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State private var selection:Tab = .Question
    
    
    enum Tab{
        case Question
        case Results
        case Account
    }
    
    init() {
        UITabBar.appearance().tintColor = UIColor.red
    }
   
    var body: some View {
        
        TabView{
            QuestionView(question: Question.test)
                .tabItem{
                    Label("Umfrage", systemImage: "questionmark")
                }
                .tag(Tab.Question)
                
            
            TopicsList()
                .tabItem{
                    Label("Meinungen", systemImage: "person.2.wave.2")
                        
                }
                .tag(Tab.Results)
      
        }.accentColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
