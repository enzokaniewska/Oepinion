//
//  ResultsRow.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct QuestionItem: View {
    
    var survey:Survey
    var body: some View {
        
        
        
            VStack(alignment: .leading){
                
                Text(survey.question.title)
                    .font(.title2)
                    .bold()
                    .padding(.bottom,1)
                    
                    
                
                HStack {
                    CategoryLabel(category: survey.question.category!)
                        .padding(.bottom,1)
                    Spacer()
                    Image(systemName: "person.3.sequence.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.gray)
                    Text(String(survey.totalParticipants))
                }
                
                Text(survey.question.content)
                    .opacity(0.7)
                    
                    
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Label("Abstimmen", systemImage: "bubble.right.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                        
                    })
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(.red)
                    .padding(.top, 5)
                    .padding(.bottom,15)
                    /*
                    Button(action: {
                        
                    }, label: {
                        Label("Ergebnis", systemImage: "chart.bar.xaxis")
                            .symbolRenderingMode(.hierarchical)
                        
                    })
                    .buttonStyle(.bordered)
                    .font(.title2)
                    .tint(.blue)
                    .padding(.top, 5)
                    .padding(.bottom,5)
                    */
                    
                     
                }
                
                
                    
                
            }
            .padding(.leading)
            .padding(.trailing)
            
            
           
        
        
        
    }
        
}

struct ResultsRow_Previews: PreviewProvider {
    static var previews: some View {
        QuestionItem(survey: ModelData.testSurveys.first!)
    }
}
