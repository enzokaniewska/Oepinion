//
//  QuestionView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct QuestionView: View {
    
    @State var resultsArePresented = false
    
    var question: Question
    
    let options = [ Option(text: "Ja", buttonColor: Color.green),
                    Option(text: "Nein", buttonColor: Color.red),
                    Option(text: "Neutral", buttonColor: Color.orange)]
    
    var body: some View {
        VStack {
            Text("Titel der Frage")
                .font(.title)
                .bold()
            
            Label(Survey.categories.education.rawValue, systemImage: Survey.categoryIcons[Survey.categories.education] ?? "")
                .foregroundColor(Color.red)
                .padding(1)
                
            Text(question.Text)
                .multilineTextAlignment(.center)
                .font(.title2)
                .padding()
                .padding()
            
            
            HStack{
                
                ForEach(options){ option in
                    
                    Button(option.text){
                        resultsArePresented = true
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                    .tint(option.buttonColor)
                    .fullScreenCover(isPresented: $resultsArePresented){ ResultsView(survey: Survey.test)
                    }
                }
                
                
                
                
                
                
                
            }
                
        }
        .padding()
        
        

    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question.test)
    }
}

