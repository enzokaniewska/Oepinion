//
//  TopicsList.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct TopicsList: View {
    
    @State private var showBurningOnly = false
    
    let topics = Survey.testList
    
    var body: some View {
        
        ScrollView{
          
            VStack(alignment: .leading) {
                
                HStack(spacing: 20) {
                    Text("Frage des Tages")
                        .font(.title)
                        .bold()
                        .padding(.leading)
                        
                    
                    Image(systemName: "calendar")
                        .scaleEffect(1.5)
                        
                }
                .padding(.top, 50)
                
                QuestionItem(survey: Survey.test)
                    
                Divider()
                    .overlay(.red)
                HStack(spacing: 20) {
                    Text("Zurzeit im Trend")
                        .font(.title)
                        .bold()
                    .padding(.leading)
                    
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .scaleEffect(1.5)
                        
                }
               
                
                ForEach(topics){ topic in
                    
                    QuestionItem(survey: topic)
                    
                    
                }
            }
            
            
        }
        
    }
}

struct TopicsList_Previews: PreviewProvider {
    static var previews: some View {
        TopicsList()
    }
}
