//
//  ResultsRow.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct SurveyItem: View {
    
    
    
    var survey:Survey
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                Text(survey.title)
                    .font(.title2)
                    .padding(.bottom,1)
                    .foregroundColor(.primary)
                
                Image(systemName: "control")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.primary)
            }
            
            HStack {
                CategoryLabel(category: survey.category)
                    .padding(.bottom,1)
                
                Spacer()
                
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.secondary)
                
                Text(String(survey.totalParticipants))
                    .foregroundColor(.secondary)
                
            }
            
            Text(survey.question)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
            
            HStack {
                
                Spacer()
                
                
                Label(survey.wasAnswered ? "bereits abgestimmt" : "noch nicht abgestimmt",
                          systemImage:  "checkmark.diamond.fill" )
                    .symbolRenderingMode(.hierarchical)
                    .font(.title3)
                    .foregroundColor(survey.wasAnswered ? .green : .gray)
                    .padding(.top, 5)
                    .padding(.bottom,15)

                
            }
            
        }
        .padding(10)
        
        
        
        
    }
    
}

struct ResultsRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SurveyItem(survey: Survey.test)
            SurveyItem(survey: ModelData().surveys[0])
        }
    }
}
