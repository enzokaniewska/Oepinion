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
                
                Text("Politische Frage")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 1)
                    
                    
                
                Text(survey.question.Text)
                    
                Button(action: {
                    
                }, label: {
                    Label("Jetzt abstimmen", systemImage: "figure.wave")
                    
                })
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.red)
                .padding(.top, 5)
                .padding(.bottom,5)
                
                Text("22342 leute haben abgestimmt")
                    .font(.caption)
                    .padding(.bottom)
                    
                
            }
            .padding()
            
           
        
        
        
    }
        
}

struct ResultsRow_Previews: PreviewProvider {
    static var previews: some View {
        QuestionItem(survey: Survey.test)
    }
}
