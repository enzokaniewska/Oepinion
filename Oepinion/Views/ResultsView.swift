//
//  ResultsView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Charts
import SwiftUI

struct ResultsView: View {
    
    var survey: Survey
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        VStack(alignment: .center){
            
            Spacer()
            Text("Das denken die Österreicher zu diesem Thema:")
                .font(.title)
                .bold()
                .padding(20)
            
            Spacer()
            
            Chart{
                BarMark(
                    x: .value("Yes", "Yes"),
                    y: .value("Anzahl", survey.answers[.yes]!)
                )
                .foregroundStyle(Color.green)
                
                BarMark(
                    x: .value("Nein", "No"),
                    y: .value("Anzahl", survey.answers[.no]!)
                )
                .foregroundStyle(Color.red)
                
                BarMark(
                    x: .value("Neutral", "Neutral"),
                    y: .value("Anzahl", survey.answers[.neutral]!)
                )
                .foregroundStyle(Color.orange)
                
                
                
                
            }
            .frame(width: 300, height: 300)
            
            Text("12332 Menschen haben bei dieser Umfrage teilgenommen")
                
            
            Spacer()
            
            Button("Zurück zur nächsten Frage"){
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        
            
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(survey: Survey.test)
    }
}
