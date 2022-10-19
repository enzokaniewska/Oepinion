//
//  QuestionView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct QuestionView: View {
    
    @State var resultsArePresented = false
    @EnvironmentObject var modelData:ModelData
    @State private var noPressed = false
    var survey: Survey
    
    let options = [ Option(text: "Ja", buttonColor: Color.green, buttonIcon:                            "hand.thumbsup.circle.fill"),
                    Option(text: "Nein", buttonColor: Color.red, buttonIcon: "hand.thumbsdown.circle.fill"),
                    Option(text: "Neutral", buttonColor: Color.orange, buttonIcon: "hand.raised.circle.fill")]
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading){
          
               
                Text(survey.title)
                    .font(.title)
                    .bold()
                
                CategoryLabel(category: survey.category)
                
                
                Text(survey.question)
                    .font(.title2)
                    .padding(.vertical)
                
                
            }
            .padding()
            
            HStack{
                Spacer()
                
                ForEach(options){ option in
                    
                    Button(action: {
                        modelData.saveSurveyResponse(survey: survey, user: modelData.user, option: option)
                    }, label: {
                        
                        Label(option.text, systemImage: option.buttonIcon)
                            .imageScale(.large)
                            .symbolRenderingMode(.hierarchical)
                            .font(.title3)
                            
                    })
//                        .fullScreenCover(isPresented: $resultsArePresented){ ResultsView(survey: Survey.test)
//                        }
                        .buttonStyle(.borderedProminent)
                        .tint(option.buttonColor)
                        
                    
                }
            
              
                Spacer()
                }
                
            }
            
        
        
                
    }
    
        
        
}

struct Option:Identifiable{
    var id = UUID()
    var text: String
    var buttonColor:Color
    var buttonIcon:String
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(survey: Survey.test)
            .environmentObject(ModelData())
    }
}

