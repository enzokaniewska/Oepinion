//
//  ResultsView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Charts
import SwiftUI

struct ResultsView: View {
    
    var survey:Survey
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Spacer()
            
            Text("Danke fürs Abstimmen!")
                .font(.largeTitle)
                .bold()
            
            Text("Das denken deine Mitmenschen zu diesem Thema:")
                .font(.title2)
                .fontWeight(.regular)
                .padding(20)
            
            
            ChartView(survey: survey)
            
            
            .frame(width: 300, height: 300)
            
            
            Text("\(survey.totalParticipants) Menschen haben bei dieser Umfrage teilgenommen")
            
            
            Spacer()
            Button(action: {
                
            }) {
                Label("Teilen", systemImage: "square.and.arrow.up.circle.fill")
                    .symbolRenderingMode(.hierarchical)
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .padding(.bottom,5)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                
            }) {
                Label("Zurück", systemImage: "arrowshape.turn.up.backward.circle.fill")
                    .symbolRenderingMode(.hierarchical)
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            
        }
    }
    
    
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(survey: Survey.test)
    }
}
