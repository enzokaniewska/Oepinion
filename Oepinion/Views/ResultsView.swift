//
//  ResultsView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Charts
import SwiftUI

struct ResultsView: View {
    
    var surveyResult: SurveyResult
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        VStack(alignment: .center){
            
            
            Text("Das denken die Österreicher zu diesem Thema")
                .font(.title)
                .bold()
                .padding(10)
            
            Spacer()
            
            Chart{
                BarMark(
                    x: .value("Yes", "Yes"),
                    y: .value("Anzahl", surveyResult.answers[.yes]!)
                )
                .foregroundStyle(Color.green)
                
                BarMark(
                    x: .value("Nein", "No"),
                    y: .value("Anzahl", surveyResult.answers[.no]!)
                )
                .foregroundStyle(Color.red)
                
                BarMark(
                    x: .value("Neutral", "Neutral"),
                    y: .value("Anzahl", surveyResult.answers[.neutral]!)
                )
                .foregroundStyle(Color.orange)
                
                
                
                
            }
            .frame(width: 300, height: 300)
            
            Spacer()
            
            Button("Zurück zur nächsten Frage"){
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.borderedProminent)
            
        }
        
            
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(surveyResult: SurveyResult.test)
    }
}
