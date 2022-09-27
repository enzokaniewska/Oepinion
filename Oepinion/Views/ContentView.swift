//
//  ContentView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var resultsArePresented = false
    
    var question: Question
    
    let options = [ Option(text: "Ja", buttonColor: Color.green),
                    Option(text: "Nein", buttonColor: Color.red),
                    Option(text: "Neutral", buttonColor: Color.orange)]
    
    var body: some View {
        VStack {
            Text(question.Text)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding(.bottom, 50)
            
            HStack{
                
                ForEach(options){ option in
                    
                    
                    Button(option.text){
                        resultsArePresented = true
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                    .tint(option.buttonColor)
                    .fullScreenCover(isPresented: $resultsArePresented){ ResultsView(surveyResult: SurveyResult.test)
                    }
                }
                
                
                
                
                
                
                
            }
                
        }
        .padding()
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(question: Question.test)
    }
}
