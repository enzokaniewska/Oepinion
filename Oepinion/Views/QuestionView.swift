//
//  QuestionView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct QuestionView: View {
    
    @State var resultsArePresented = false
    
    @State private var noPressed = false
    var question: Question
    
    let options = [ Option(text: "Ja", buttonColor: Color.green),
                    Option(text: "Nein", buttonColor: Color.red),
                    Option(text: "Neutral", buttonColor: Color.orange)]
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text(question.title)
                .font(.largeTitle)
                .bold()
            
            CategoryLabel(category: question.category!)
            
            
            Text(question.content)
                .font(.title2)
                .padding(.top)
                .padding(.bottom)
            
            HStack{
                
                Button(action: {
                    
                }, label: {
                    
                    Label(options[0].text, systemImage: Question.answerIcons[options[0].text] ?? "")
                        .imageScale(.large)
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2)
                })
                    .fullScreenCover(isPresented: $resultsArePresented){ ResultsView(survey: Survey.test)
                }
                    .buttonStyle(.borderedProminent)
                    .tint(options[0].buttonColor)
                   

                
                Button(action: {
                    resultsArePresented.toggle()
                }, label: {
                    
                    Label(options[1].text, systemImage: Question.answerIcons[options[1].text] ?? "")
                        .imageScale(.large)
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2)
                })
                    .fullScreenCover(isPresented: $resultsArePresented){ ResultsView(survey: Survey.test)
                }
                        .buttonStyle(.borderedProminent)
                        .tint(options[1].buttonColor)
                        
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Label(options[2].text, systemImage: Question.answerIcons[options[2].text] ?? "")
                            .imageScale(.large)
                            .symbolRenderingMode(.hierarchical)
                            .font(.title2)
                        
                    })
                        .fullScreenCover(isPresented: $resultsArePresented){ ResultsView(survey: Survey.test)
                    }
                        .buttonStyle(.borderedProminent)
                        .tint(options[2].buttonColor)
                        
                    
                }
                
            }
        .padding()
        
                
    }
        
        
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question.test2)
    }
}

