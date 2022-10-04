//
//  QuestionRow.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct QuestionRow: View {
    
    var surveyList: [Survey]
    var title:String
    var body: some View {
        
       
            VStack(alignment: .leading){
                Text(title)
                    .bold()
                    .font(.title)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20) {
                        ForEach(surveyList){ survey in
                            QuestionItem(survey: survey)
                                
                        }
                    }
                    .padding(10)
                    
                }
            }
            
        
    }
}

struct QuestionRow_Previews: PreviewProvider {
    static var previews: some View {
        QuestionRow(surveyList: ModelData.testSurveys, title: "Titel")
    }
}
