//
//  ContentView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import SwiftUI
import UIKit

struct MainAppView: View {
    
    @State private var selection:Tab = .Explore
    @EnvironmentObject var modelData: ModelData

    
    enum Tab{
        case Question
        case Explore
    }
    
    init() {
        UITabBar.appearance().tintColor = UIColor.red
    }
   
    var body: some View {
        
        TabView{
            QuestionView(survey: modelData.surveys.first!)
                .tabItem{
                    Label("Abstimmen", systemImage: "figure.wave")
                        .symbolRenderingMode(.hierarchical)
                }
                .tag(Tab.Question)
                
            
            ExploreView()
                .tabItem{
                    Label("Übersicht", systemImage: "square.text.square.fill")
                        
                }
                .tag(Tab.Explore)
      
        }.accentColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
            .environmentObject(ModelData())
    }
}
